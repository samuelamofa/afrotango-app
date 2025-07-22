import '/auth/firebase_auth/auth_util.dart';
import '/auth/my_wall/my_wall_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'profiles_comunity_model.dart';
export 'profiles_comunity_model.dart';

class ProfilesComunityWidget extends StatefulWidget {
  const ProfilesComunityWidget({
    super.key,
    required this.user,
  });

  final UsersRecord? user;

  static String routeName = 'ProfilesComunity';
  static String routePath = 'ProfilesComunity';

  @override
  State<ProfilesComunityWidget> createState() => _ProfilesComunityWidgetState();
}

class _ProfilesComunityWidgetState extends State<ProfilesComunityWidget> {
  late ProfilesComunityModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilesComunityModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 230.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.network(
                              valueOrDefault<String>(
                                widget.user?.bannerImage != null &&
                                        widget.user?.bannerImage != ''
                                    ? widget.user?.bannerImage
                                    : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/afro-tango-g6fj7t/assets/r93hgs1wpxjj/Header.png',
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/afro-tango-g6fj7t/assets/r93hgs1wpxjj/Header.png',
                              ),
                            ).image,
                          ),
                          gradient: LinearGradient(
                            colors: [Color(0xFF4AB6FF), Color(0xFFAAB6F6)],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(-0.81, -1.0),
                            end: AlignmentDirectional(0.81, 1.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 60.0, 15.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 15.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.arrow_back_ios,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        context.safePop();
                                      },
                                    ),
                                  ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '2op8x1e6' /* Profile */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 21.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.share,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed(
                                      ProfileshareCopyWidget.routeName,
                                      queryParameters: {
                                        'user': serializeParam(
                                          widget.user?.reference,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(HomePageWidget.routeName);
                                  },
                                  child: Container(
                                    width: 45.0,
                                    height: 45.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      'assets/images/Shape_(3).png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 15.0)),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 195.0, 15.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 65.0,
                                    height: 65.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 50.0,
                                      buttonSize: 40.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondary,
                                      icon: Icon(
                                        FFIcons.kcommentDots,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 30.0,
                                      ),
                                      onPressed: () async {
                                        _model.chat = await queryChatRecordOnce(
                                          queryBuilder: (chatRecord) =>
                                              chatRecord
                                                  .where(
                                                    'users',
                                                    arrayContains:
                                                        currentUserReference,
                                                  )
                                                  .where(
                                                    'user_b',
                                                    isEqualTo:
                                                        widget.user?.reference,
                                                  )
                                                  .where(
                                                    'user_a',
                                                    isEqualTo:
                                                        currentUserReference,
                                                  ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        if (_model.chat != null) {
                                          context.pushNamed(
                                            ChatoneWidget.routeName,
                                            queryParameters: {
                                              'chat': serializeParam(
                                                _model.chat,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'chat': _model.chat,
                                            },
                                          );
                                        } else {
                                          var chatRecordReference =
                                              ChatRecord.collection.doc();
                                          await chatRecordReference.set({
                                            ...createChatRecordData(
                                              userA: currentUserReference,
                                              userB: widget.user?.reference,
                                              time: getCurrentTimestamp,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'users': [
                                                  widget.user?.reference
                                                ],
                                              },
                                            ),
                                          });
                                          _model.chatcreated =
                                              ChatRecord.getDocumentFromData({
                                            ...createChatRecordData(
                                              userA: currentUserReference,
                                              userB: widget.user?.reference,
                                              time: getCurrentTimestamp,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'users': [
                                                  widget.user?.reference
                                                ],
                                              },
                                            ),
                                          }, chatRecordReference);

                                          await _model.chatcreated!.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'users': FieldValue.arrayUnion(
                                                    [currentUserReference]),
                                              },
                                            ),
                                          });

                                          context.pushNamed(
                                            ChatoneWidget.routeName,
                                            queryParameters: {
                                              'chat': serializeParam(
                                                _model.chatcreated,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'chat': _model.chatcreated,
                                            },
                                          );
                                        }

                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (widget.user?.followers
                                            .contains(currentUserReference) ==
                                        false)
                                      FFButtonWidget(
                                        onPressed: () async {
                                          if (widget.user?.reference !=
                                              currentUserReference) {
                                            await widget.user!.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'followers':
                                                      FieldValue.arrayUnion([
                                                    currentUserReference
                                                  ]),
                                                },
                                              ),
                                            });

                                            FFAppState().update(() {});

                                            context.goNamed(
                                              ProfilesComunityWidget.routeName,
                                              queryParameters: {
                                                'user': serializeParam(
                                                  widget.user,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'user': widget.user,
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          }
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'ym7div6g' /* Follow */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color: Colors.white,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    if (widget.user?.followers
                                            .contains(currentUserReference) ==
                                        true)
                                      FFButtonWidget(
                                        onPressed: () async {
                                          if (widget.user?.reference !=
                                              currentUserReference) {
                                            await widget.user!.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'followers':
                                                      FieldValue.arrayRemove([
                                                    currentUserReference
                                                  ]),
                                                },
                                              ),
                                            });

                                            FFAppState().update(() {});

                                            context.goNamed(
                                              ProfilesComunityWidget.routeName,
                                              queryParameters: {
                                                'user': serializeParam(
                                                  widget.user,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'user': widget.user,
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          }
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'rv2dz9xa' /* Unfollow */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color: Colors.white,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                  ].divide(SizedBox(height: 5.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 160.0, 0.0, 0.0),
                      child: Container(
                        width: 140.0,
                        height: 140.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: FlutterFlowExpandedImageView(
                                        image: Image.network(
                                          valueOrDefault<String>(
                                            widget.user?.photoUrl,
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/afro-tango-g6fj7t/assets/bg4fitk4cbij/user_(3).png',
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                        allowRotation: false,
                                        tag: valueOrDefault<String>(
                                          widget.user?.photoUrl,
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/afro-tango-g6fj7t/assets/bg4fitk4cbij/user_(3).png',
                                        ),
                                        useHeroAnimation: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: valueOrDefault<String>(
                                    widget.user?.photoUrl,
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/afro-tango-g6fj7t/assets/bg4fitk4cbij/user_(3).png',
                                  ),
                                  transitionOnUserGestures: true,
                                  child: Container(
                                    width: 128.0,
                                    height: 128.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        widget.user?.photoUrl,
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/afro-tango-g6fj7t/assets/bg4fitk4cbij/user_(3).png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  90.0, 110.0, 0.0, 0.0),
                              child: Container(
                                width: 25.0,
                                height: 25.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    functions
                                        .countryFlag(widget.user?.countryName),
                                    'https://flagcdn.com/h80/gh.png',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.user?.firstName} ${widget.user?.lastName}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                      if (widget.user?.iDVerify == true)
                        Icon(
                          Icons.verified_sharp,
                          color: Color(0xFFCBA135),
                          size: 24.0,
                        ),
                    ].divide(SizedBox(width: 5.0)),
                  ),
                  Text(
                    valueOrDefault<String>(
                      widget.user?.profession,
                      'Profession',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  Text(
                    '${widget.user?.followers.length.toString()} Followers',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ].divide(SizedBox(height: 5.0)),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).secondary,
                    icon: Icon(
                      Icons.phone,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      await launchUrl(Uri(
                        scheme: 'tel',
                        path: currentPhoneNumber,
                      ));
                    },
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).secondary,
                    icon: Icon(
                      FFIcons.kwhatsapp,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      if (isAndroid) {
                        await launchURL(
                            'whatsapp://send?phone=${currentPhoneNumber}&text=HI');
                      } else if (isiOS) {
                        await launchURL(
                            'https://wa.me/${currentPhoneNumber}?text=hi');
                      } else {
                        await launchURL(
                            'https://api.whatsapp.com/send/?phone=whatsapp://send?phone=${currentPhoneNumber}&text=HI');
                      }
                    },
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).secondary,
                    icon: Icon(
                      FFIcons.kfacebook,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      await launchURL(
                          valueOrDefault(currentUserDocument?.facebook, ''));
                    },
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).secondary,
                    icon: Icon(
                      FFIcons.ktwitter,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      await launchURL(
                          valueOrDefault(currentUserDocument?.twitter, ''));
                    },
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).secondary,
                    icon: Icon(
                      FFIcons.kinstagram5,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      await launchURL(
                          valueOrDefault(currentUserDocument?.instagram, ''));
                    },
                  ),
                ].divide(SizedBox(width: 20.0)),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 0.0),
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    minWidth: 68.0,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFAA7E02),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 55.0,
                                  height: 55.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE2BF4E),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/writer_1.png',
                                      width: 30.0,
                                      height: 30.0,
                                      fit: BoxFit.none,
                                      cacheWidth: 30,
                                      cacheHeight: 30,
                                    ),
                                  ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'oubymq6x' /* Bio */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 21.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ].divide(SizedBox(width: 20.0)),
                            ),
                            if (_model.bio == true)
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  _model.bio = false;
                                  _model.posts = false;
                                  _model.media = false;
                                  safeSetState(() {});
                                },
                              ),
                            if (!_model.bio)
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0x51000000),
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  _model.bio = !_model.bio;
                                  _model.posts = false;
                                  _model.media = false;
                                  safeSetState(() {});
                                },
                              ),
                          ],
                        ),
                        if (_model.bio)
                          Text(
                            valueOrDefault<String>(
                              widget.user?.bio,
                              'bio',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF4E5C62),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
                tabletLandscape: false,
                desktop: false,
              ))
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 68.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFCBA135),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 55.0,
                                    height: 55.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE2BF4E),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/post_1.png',
                                        width: 25.0,
                                        height: 25.0,
                                        fit: BoxFit.none,
                                        cacheWidth: 25,
                                        cacheHeight: 25,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'o7uxg1zx' /* Posts */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 21.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 20.0)),
                              ),
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0x52000000),
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(GalleryComunityWidget.routeName);
                  },
                  child: Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      minHeight: 68.0,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFDAC471),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 55.0,
                                    height: 55.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFFDB8),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Frame.png',
                                        width: 30.0,
                                        height: 30.0,
                                        fit: BoxFit.none,
                                        cacheWidth: 30,
                                        cacheHeight: 30,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '41oeyxsr' /* Media */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 21.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 20.0)),
                              ),
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0x52000000),
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  context.pushNamed(
                                      GalleryComunityWidget.routeName);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: wrapWithModel(
                  model: _model.myWallModel,
                  updateCallback: () => safeSetState(() {}),
                  child: MyWallWidget(
                    user: widget.user!.reference,
                  ),
                ),
              ),
            ].divide(SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
