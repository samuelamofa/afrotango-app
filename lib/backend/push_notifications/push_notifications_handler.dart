import 'dart:async';

import 'serialization_util.dart';
import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

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
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
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
          color: FlutterFlowTheme.of(context).primary,
          child: Center(
            child: Image.asset(
              'assets/images/Artboard_5_copy_6@300x_1.png',
              width: 200.0,
              height: 200.0,
              fit: BoxFit.contain,
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
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'loginPage_old': ParameterData.none(),
  'forgetPassword': ParameterData.none(),
  'ResourceCenter': ParameterData.none(),
  'CreateBusiness': ParameterData.none(),
  'EditProfile': (data) async => ParameterData(
        allParams: {
          'firsttime': getParameter<bool>(data, 'firsttime'),
        },
      ),
  'Profiles': (data) async => ParameterData(
        allParams: {
          'users': getParameter<String>(data, 'users'),
        },
      ),
  'profileshare': (data) async => ParameterData(
        allParams: {
          'user': getParameter<DocumentReference>(data, 'user'),
        },
      ),
  'Eventhome': ParameterData.none(),
  'eventsearch': (data) async => ParameterData(
        allParams: {
          'search': getParameter<String>(data, 'search'),
          'intialdate': getParameter<DateTime>(data, 'intialdate'),
          'category': getParameter<String>(data, 'category'),
          'location': getParameter<String>(data, 'location'),
        },
      ),
  'Eventdetails': (data) async => ParameterData(
        allParams: {
          'event': await getDocumentParameter<EventRecord>(
              data, 'event', EventRecord.fromSnapshot),
        },
      ),
  'eventodersucess': (data) async => ParameterData(
        allParams: {
          'purchaseevent': await getDocumentParameter<RegisterdEventRecord>(
              data, 'purchaseevent', RegisterdEventRecord.fromSnapshot),
        },
      ),
  'eventTicketDetails': (data) async => ParameterData(
        allParams: {
          'purchaseticket': await getDocumentParameter<RegisterdEventRecord>(
              data, 'purchaseticket', RegisterdEventRecord.fromSnapshot),
        },
      ),
  'eventoder': ParameterData.none(),
  'emptyeventoder': ParameterData.none(),
  'comunityHome': ParameterData.none(),
  'CommunityProfile': (data) async => ParameterData(
        allParams: {
          'community': await getDocumentParameter<CommunityRecord>(
              data, 'community', CommunityRecord.fromSnapshot),
        },
      ),
  'comunityList': ParameterData.none(),
  'Addmember': (data) async => ParameterData(
        allParams: {
          'commList': await getDocumentParameter<CommunityRecord>(
              data, 'commList', CommunityRecord.fromSnapshot),
        },
      ),
  'AddcomunityDetails': (data) async => ParameterData(
        allParams: {
          'edite': getParameter<bool>(data, 'edite'),
          'community': await getDocumentParameter<CommunityRecord>(
              data, 'community', CommunityRecord.fromSnapshot),
        },
      ),
  'Community-ShareQR': ParameterData.none(),
  'marketHome': ParameterData.none(),
  'selected': ParameterData.none(),
  'marketSeach': (data) async => ParameterData(
        allParams: {
          'filterd': getParameter<bool>(data, 'filterd'),
        },
      ),
  'market_sort_filter': ParameterData.none(),
  'product': (data) async => ParameterData(
        allParams: {
          'product': await getDocumentParameter<ProductRecord>(
              data, 'product', ProductRecord.fromSnapshot),
        },
      ),
  'resturantHome': ParameterData.none(),
  'resturantDetails': (data) async => ParameterData(
        allParams: {
          'recipe': await getDocumentParameter<RecipeRecord>(
              data, 'recipe', RecipeRecord.fromSnapshot),
        },
      ),
  'cart': ParameterData.none(),
  'success': ParameterData.none(),
  'notificationrestu': ParameterData.none(),
  'profileforResturant': ParameterData.none(),
  'ttt': ParameterData.none(),
  'myEvent': ParameterData.none(),
  'LisEvents': ParameterData.none(),
  'LisEventspecialdeal': (data) async => ParameterData(
        allParams: {
          'category': await getDocumentParameter<EventcatigoryRecord>(
              data, 'category', EventcatigoryRecord.fromSnapshot),
        },
      ),
  'LisEventforyou': ParameterData.none(),
  'LisEventcatigory': ParameterData.none(),
  'ProfilesComunity': (data) async => ParameterData(
        allParams: {
          'user': await getDocumentParameter<UsersRecord>(
              data, 'user', UsersRecord.fromSnapshot),
        },
      ),
  'galleryComunity': ParameterData.none(),
  'communitychat': (data) async => ParameterData(
        allParams: {
          'chat': getParameter<DocumentReference>(data, 'chat'),
          'comunity': getParameter<DocumentReference>(data, 'comunity'),
          'member': getParameter<DocumentReference>(data, 'member'),
        },
      ),
  'communitychatlist': ParameterData.none(),
  'chatproduct': (data) async => ParameterData(
        allParams: {
          'product': getParameter<DocumentReference>(data, 'product'),
          'chat': await getDocumentParameter<ChatproductRecord>(
              data, 'chat', ChatproductRecord.fromSnapshot),
        },
      ),
  'marketproductlist': (data) async => ParameterData(
        allParams: {
          'type': getParameter<String>(data, 'type'),
        },
      ),
  'marketproductlistCatigory': (data) async => ParameterData(
        allParams: {
          'type': getParameter<String>(data, 'type'),
        },
      ),
  'resurantorder': ParameterData.none(),
  'orderdetails': (data) async => ParameterData(
        allParams: {
          'order': await getDocumentParameter<OrderRecord>(
              data, 'order', OrderRecord.fromSnapshot),
        },
      ),
  'orderdetailsbuyer': (data) async => ParameterData(
        allParams: {
          'order': await getDocumentParameter<OrderRecord>(
              data, 'order', OrderRecord.fromSnapshot),
        },
      ),
  'resurantorderbuyer': ParameterData.none(),
  'menu': ParameterData.none(),
  'myproduct': ParameterData.none(),
  'comunityListmy': ParameterData.none(),
  'MyResturant': ParameterData.none(),
  'chatone': (data) async => ParameterData(
        allParams: {
          'chat': await getDocumentParameter<ChatRecord>(
              data, 'chat', ChatRecord.fromSnapshot),
        },
      ),
  'chat': ParameterData.none(),
  'bussiness': (data) async => ParameterData(
        allParams: {
          'bussiness': await getDocumentParameter<BusinessRecord>(
              data, 'bussiness', BusinessRecord.fromSnapshot),
        },
      ),
  'mybusineslist': ParameterData.none(),
  'EditBusiness': (data) async => ParameterData(
        allParams: {
          'bussiness': await getDocumentParameter<BusinessRecord>(
              data, 'bussiness', BusinessRecord.fromSnapshot),
        },
      ),
  'LisEventsCatigory': (data) async => ParameterData(
        allParams: {
          'catigory': getParameter<DocumentReference>(data, 'catigory'),
        },
      ),
  'marketchatlist': ParameterData.none(),
  'Addmember2': (data) async => ParameterData(
        allParams: {
          'community': await getDocumentParameter<CommunityRecord>(
              data, 'community', CommunityRecord.fromSnapshot),
        },
      ),
  'Resturantmenu': (data) async => ParameterData(
        allParams: {
          'menue': await getDocumentParameter<ResturantMenueRecord>(
              data, 'menue', ResturantMenueRecord.fromSnapshot),
        },
      ),
  'Resturantmenusearch': ParameterData.none(),
  'Hub': ParameterData.none(),
  'businessReviewPage': (data) async => ParameterData(
        allParams: {
          'bussiness': await getDocumentParameter<BusinessRecord>(
              data, 'bussiness', BusinessRecord.fromSnapshot),
        },
      ),
  'VERIFY': ParameterData.none(),
  'veridetails': (data) async => ParameterData(
        allParams: {
          'veryfy': await getDocumentParameter<VerificationRecord>(
              data, 'veryfy', VerificationRecord.fromSnapshot),
        },
      ),
  'viewID': (data) async => ParameterData(
        allParams: {
          'verify': await getDocumentParameter<VerificationRecord>(
              data, 'verify', VerificationRecord.fromSnapshot),
        },
      ),
  'Manageverifyme': ParameterData.none(),
  'Manageverify': ParameterData.none(),
  'EventAttendees': (data) async => ParameterData(
        allParams: {
          'event': await getDocumentParameter<EventRecord>(
              data, 'event', EventRecord.fromSnapshot),
        },
      ),
  'loginScreen': ParameterData.none(),
  'signupScreen': ParameterData.none(),
  'Record': ParameterData.none(),
  'signupPage_old': ParameterData.none(),
  'homePage': ParameterData.none(),
  'myPost': ParameterData.none(),
  'searchFilter': ParameterData.none(),
  'busineslistCopy': ParameterData.none(),
  'comunityHomeCopy': ParameterData.none(),
  'businessSearch': (data) async => ParameterData(
        allParams: {
          'country': getParameter<String>(data, 'country'),
          'search': getParameter<String>(data, 'search'),
          'category': getParameter<String>(data, 'category'),
        },
      ),
  'businessSearchFilter': ParameterData.none(),
  'communitySearchResult': (data) async => ParameterData(
        allParams: {
          'category': getParameter<String>(data, 'category'),
          'country': getParameter<String>(data, 'country'),
          'search': getParameter<String>(data, 'search'),
        },
      ),
  'searchFilterComunty': ParameterData.none(),
  'busineslist': ParameterData.none(),
  'searchResultsAll': ParameterData.none(),
  'searchcontactCopy': ParameterData.none(),
  'PopularUsers': ParameterData.none(),
  'FeaturedUsers': ParameterData.none(),
  'NewUsers': ParameterData.none(),
  'profileshareCopy': (data) async => ParameterData(
        allParams: {
          'user': getParameter<DocumentReference>(data, 'user'),
        },
      ),
  'eventsearchTest': ParameterData.none(),
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
