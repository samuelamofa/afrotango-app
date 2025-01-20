import 'dart:async';

import 'serialization_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          child: Center(
            child: Image.asset(
              'assets/images/AFRO_T_1.1.1.png',
              width: 170.0,
              height: 170.0,
              fit: BoxFit.cover,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'loginPage': ParameterData.none(),
  'signupPage': ParameterData.none(),
  'forgetPassword': ParameterData.none(),
  'homeFeedMore': ParameterData.none(),
  'personalProfile': ParameterData.none(),
  'connectionProfile': (data) async => ParameterData(
        allParams: {
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
        },
      ),
  'gallery': ParameterData.none(),
  'myPost': (data) async => ParameterData(
        allParams: {
          'adsBool': getParameter<bool>(data, 'adsBool'),
        },
      ),
  'homeFeed': ParameterData.none(),
  'ProfileEdit': ParameterData.none(),
  'Notification': ParameterData.none(),
  'BusinessDirectory': ParameterData.none(),
  'BuisnessProfile': (data) async => ParameterData(
        allParams: {
          'businessRef': getParameter<DocumentReference>(data, 'businessRef'),
        },
      ),
  'Review': (data) async => ParameterData(
        allParams: {
          'businessRef': getParameter<DocumentReference>(data, 'businessRef'),
        },
      ),
  'Allmessage': ParameterData.none(),
  'groupMessagingBox': (data) async => ParameterData(
        allParams: {
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
        },
      ),
  'messaging': (data) async => ParameterData(
        allParams: {
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
        },
      ),
  'yourConnection': (data) async => ParameterData(
        allParams: {
          'allConnectionBool': getParameter<bool>(data, 'allConnectionBool'),
        },
      ),
  'Community': ParameterData.none(),
  'myCommunities': ParameterData.none(),
  'communitySpace': (data) async => ParameterData(
        allParams: {
          'communityRef': getParameter<DocumentReference>(data, 'communityRef'),
        },
      ),
  'aboutCommunity': (data) async => ParameterData(
        allParams: {
          'communityRef': getParameter<DocumentReference>(data, 'communityRef'),
        },
      ),
  'Marketplace': ParameterData.none(),
  'ResourceCenter': ParameterData.none(),
  'adviewPage': (data) async => ParameterData(
        allParams: {
          'adPostRef': getParameter<DocumentReference>(data, 'adPostRef'),
        },
      ),
  'events': ParameterData.none(),
  'eventView': (data) async => ParameterData(
        allParams: {
          'eventRef': getParameter<DocumentReference>(data, 'eventRef'),
        },
      ),
  'CreateBusiness': ParameterData.none(),
  'createProfile': ParameterData.none(),
  'searchResult': (data) async => ParameterData(
        allParams: {
          'searchText': getParameter<String>(data, 'searchText'),
        },
      ),
  'homePage3': ParameterData.none(),
  'Feed': ParameterData.none(),
  'Feed2': ParameterData.none(),
  'Marketplace1': (data) async => ParameterData(
        allParams: {
          'categoryName': getParameter<String>(data, 'categoryName'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
