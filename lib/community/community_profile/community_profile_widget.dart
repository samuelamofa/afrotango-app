import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/community/cardcomponent/cardmember/cardmember_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'community_profile_model.dart';
export 'community_profile_model.dart';

class CommunityProfileWidget extends StatefulWidget {
  const CommunityProfileWidget({
    super.key,
    required this.community,
  });

  final CommunityRecord? community;

  static String routeName = 'CommunityProfile';
  static String routePath = 'communityProfile';

  @override
  State<CommunityProfileWidget> createState() => _CommunityProfileWidgetState();
}

class _CommunityProfileWidgetState extends State<CommunityProfileWidget> {
  late CommunityProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityProfileModel());

    _model.switchValue = true;
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CommunityMemberRecord>>(
      stream: queryCommunityMemberRecord(
        parent: widget.community?.reference,
        queryBuilder: (communityMemberRecord) => communityMemberRecord.where(
          'userRef',
          isEqualTo: currentUserReference,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitThreeBounce(
                  color: Color(0x51000000),
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        List<CommunityMemberRecord> communityProfileCommunityMemberRecordList =
            snapshot.data!;
        final communityProfileCommunityMemberRecord =
            communityProfileCommunityMemberRecordList.isNotEmpty
                ? communityProfileCommunityMemberRecordList.first
                : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 320.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.network(
                              valueOrDefault<String>(
                                widget.community?.image,
                                'https://images.unsplash.com/photo-1522543558187-768b6df7c25c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxjb21tdW5pdHl8ZW58MHx8fHwxNzQyODkxNjk0fDA&ixlib=rb-4.0.3&q=80&w=1080',
                              ),
                            ).image,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 60.0, 15.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondary,
                                      icon: Icon(
                                        Icons.arrow_back_ios_new,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        context.safePop();
                                      },
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        if (widget.community?.createdUserRef ==
                                            currentUserReference)
                                          FlutterFlowIconButton(
                                            borderRadius: 8.0,
                                            buttonSize: 40.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                            icon: FaIcon(
                                              FontAwesomeIcons.pen,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              context.pushNamed(
                                                AddcomunityDetailsWidget
                                                    .routeName,
                                                queryParameters: {
                                                  'edite': serializeParam(
                                                    true,
                                                    ParamType.bool,
                                                  ),
                                                  'community': serializeParam(
                                                    widget.community,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'community':
                                                      widget.community,
                                                },
                                              );
                                            },
                                          ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                                HomePageWidget.routeName);
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
                                      ].divide(SizedBox(width: 40.0)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 0.0, 30.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 45.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: StreamBuilder<
                                            CatigoryCommunityRecord>(
                                          stream: CatigoryCommunityRecord
                                              .getDocument(widget.community!
                                                  .catigories.firstOrNull!),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  child: SpinKitThreeBounce(
                                                    color: Color(0x51000000),
                                                    size: 40.0,
                                                  ),
                                                ),
                                              );
                                            }

                                            final rowCatigoryCommunityRecord =
                                                snapshot.data!;

                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      rowCatigoryCommunityRecord
                                                          .image,
                                                      'https://images.unsplash.com/photo-1524758631624-e2822e304c36?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw4fHxvZmZpY2V8ZW58MHx8fHwxNzQyNDY0MDE4fDA&ixlib=rb-4.0.3&q=80&w=1080',
                                                    ),
                                                    width: 15.0,
                                                    height: 15.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        rowCatigoryCommunityRecord
                                                            .name,
                                                        'office',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                    Container(
                                                      width: 10.0,
                                                      height: 2.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ].divide(SizedBox(width: 10.0)),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 308.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 206.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(60.0),
                                bottomRight: Radius.circular(60.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      widget.community?.displayName,
                                      'Smurze Studio',
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
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          's2awjfjm' /* Description */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF585858),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          widget.community?.description,
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
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
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 20.0)),
                                  ),
                                ].divide(SizedBox(height: 20.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1.0, 1.0),
                        child: Builder(
                          builder: (context) {
                            if (widget.community?.members.contains(
                                    communityProfileCommunityMemberRecord
                                        ?.reference) ??
                                false) {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 270.0, 30.0, 0.0),
                                child: Container(
                                  width: 70.0,
                                  height: 70.0,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFE2BF4E),
                                        Color(0xFF937416)
                                      ],
                                      stops: [0.0, 1.0],
                                      begin: AlignmentDirectional(0.0, -1.0),
                                      end: AlignmentDirectional(0, 1.0),
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderRadius: 8.0,
                                        buttonSize: 65.0,
                                        icon: Icon(
                                          FFIcons.kchat1,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 30.0,
                                        ),
                                        onPressed: () async {
                                          context.pushNamed(
                                            CommunitychatWidget.routeName,
                                            queryParameters: {
                                              'chat': serializeParam(
                                                widget.community?.comunityChat,
                                                ParamType.DocumentReference,
                                              ),
                                              'comunity': serializeParam(
                                                widget.community?.reference,
                                                ParamType.DocumentReference,
                                              ),
                                              'member': serializeParam(
                                                communityProfileCommunityMemberRecord
                                                    ?.reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 270.0, 30.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    var communityMemberRecordReference =
                                        CommunityMemberRecord.createDoc(
                                            widget.community!.reference);
                                    await communityMemberRecordReference
                                        .set(createCommunityMemberRecordData(
                                      userRef: currentUserReference,
                                      isAdmin: false,
                                      isModerator: false,
                                    ));
                                    _model.membe = CommunityMemberRecord
                                        .getDocumentFromData(
                                            createCommunityMemberRecordData(
                                              userRef: currentUserReference,
                                              isAdmin: false,
                                              isModerator: false,
                                            ),
                                            communityMemberRecordReference);
                                    if (widget.community?.comunityChat !=
                                        null) {
                                      await widget.community!.comunityChat!
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'members': FieldValue.arrayUnion(
                                                [currentUserReference]),
                                          },
                                        ),
                                      });

                                      await widget.community!.reference
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'members': FieldValue.arrayUnion(
                                                [_model.membe?.reference]),
                                          },
                                        ),
                                      });
                                    } else {
                                      var communitychatRecordReference =
                                          CommunitychatRecord.collection.doc();
                                      await communitychatRecordReference.set({
                                        ...createCommunitychatRecordData(
                                          communityRef:
                                              widget.community?.reference,
                                          message: 'welcom',
                                          createdUserRef:
                                              widget.community?.createdUserRef,
                                          createdTime: getCurrentTimestamp,
                                          lastmesageTime: getCurrentTimestamp,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'members': [currentUserReference],
                                          },
                                        ),
                                      });
                                      _model.newcommunity = CommunitychatRecord
                                          .getDocumentFromData({
                                        ...createCommunitychatRecordData(
                                          communityRef:
                                              widget.community?.reference,
                                          message: 'welcom',
                                          createdUserRef:
                                              widget.community?.createdUserRef,
                                          createdTime: getCurrentTimestamp,
                                          lastmesageTime: getCurrentTimestamp,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'members': [currentUserReference],
                                          },
                                        ),
                                      }, communitychatRecordReference);

                                      await widget.community!.reference
                                          .update({
                                        ...createCommunityRecordData(
                                          comunityChat:
                                              widget.community?.comunityChat,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'members': FieldValue.arrayUnion([
                                              communityProfileCommunityMemberRecord
                                                  ?.reference
                                            ]),
                                          },
                                        ),
                                      });
                                    }

                                    _model.visibility = true;
                                    safeSetState(() {});

                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    width: 70.0,
                                    height: 70.0,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFE2BF4E),
                                          Color(0xFF937416)
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: AlignmentDirectional(0.0, -1.0),
                                        end: AlignmentDirectional(0, 1.0),
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'vjdh86gl' /* Join */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (false)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 35.0,
                                      height: 35.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFB200),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.bookmark,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            size: 15.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '1ah2bcnm' /* Saved Messages */,
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
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 10.0)),
                                ),
                                FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 15.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 35.0,
                                    height: 35.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF98C3E),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.bell,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: 15.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'xxcyownw' /* Notification */,
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
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                              Switch.adaptive(
                                value: _model.switchValue!,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.switchValue = newValue);
                                },
                                activeColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).secondary,
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveThumbColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 35.0,
                                    height: 35.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF635FF6),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.bookmark,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: 15.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '5mes28fe' /* Files */,
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
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        'Total ${valueOrDefault<String>(
                                          widget
                                              .community?.communityfiles.length
                                              .toString(),
                                          '343',
                                        )}',
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              fontSize: 10.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                              if (_model.show != true)
                                FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 15.0,
                                  ),
                                  onPressed: () async {
                                    _model.show = !_model.show;
                                    safeSetState(() {});
                                  },
                                ),
                              if (_model.show == true)
                                FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 15.0,
                                  ),
                                  onPressed: () async {
                                    _model.show = !_model.show;
                                    safeSetState(() {});
                                  },
                                ),
                            ],
                          ),
                        ),
                      ].divide(SizedBox(height: 15.0)),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 30.0, 15.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (_model.show == true)
                          Builder(
                            builder: (context) {
                              final files =
                                  widget.community?.communityfiles.toList() ??
                                      [];

                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:
                                      List.generate(files.length, (filesIndex) {
                                    final filesItem = files[filesIndex];
                                    return InkWell(
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
                                                  filesItem,
                                                  'https://images.unsplash.com/photo-1543718290-a207a786243a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw3fHxmaXJld29ya3N8ZW58MHx8fHwxNzQxNjE5OTk3fDA&ixlib=rb-4.0.3&q=80&w=400',
                                                ),
                                                fit: BoxFit.contain,
                                              ),
                                              allowRotation: false,
                                              tag: valueOrDefault<String>(
                                                filesItem,
                                                'https://images.unsplash.com/photo-1543718290-a207a786243a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw3fHxmaXJld29ya3N8ZW58MHx8fHwxNzQxNjE5OTk3fDA&ixlib=rb-4.0.3&q=80&w=400' +
                                                    '$filesIndex',
                                              ),
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: valueOrDefault<String>(
                                          filesItem,
                                          'https://images.unsplash.com/photo-1543718290-a207a786243a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw3fHxmaXJld29ya3N8ZW58MHx8fHwxNzQxNjE5OTk3fDA&ixlib=rb-4.0.3&q=80&w=400' +
                                              '$filesIndex',
                                        ),
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(23.0),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              filesItem,
                                              'https://images.unsplash.com/photo-1543718290-a207a786243a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw3fHxmaXJld29ya3N8ZW58MHx8fHwxNzQxNjE5OTk3fDA&ixlib=rb-4.0.3&q=80&w=400',
                                            ),
                                            width: 90.0,
                                            height: 90.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).divide(SizedBox(width: 10.0)),
                                ),
                              );
                            },
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 15.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 35.0,
                                    height: 35.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.person_2,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: 15.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'at1u8mpb' /* Members */,
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
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        '${valueOrDefault<String>(
                                          widget.community?.members.length
                                              .toString(),
                                          '20',
                                        )} Member',
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              fontSize: 10.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                              if (widget.community?.createdUserRef ==
                                  currentUserReference)
                                FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.add,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 15.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed(
                                      Addmember2Widget.routeName,
                                      queryParameters: {
                                        'community': serializeParam(
                                          widget.community,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'community': widget.community,
                                      },
                                    );
                                  },
                                ),
                            ],
                          ),
                        ),
                      ].divide(SizedBox(height: 15.0)),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final member =
                            widget.community?.members.toList() ?? [];

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: member.length,
                          separatorBuilder: (_, __) => SizedBox(height: 15.0),
                          itemBuilder: (context, memberIndex) {
                            final memberItem = member[memberIndex];
                            return StreamBuilder<CommunityMemberRecord>(
                              stream:
                                  CommunityMemberRecord.getDocument(memberItem),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 40.0,
                                      height: 40.0,
                                      child: SpinKitThreeBounce(
                                        color: Color(0x51000000),
                                        size: 40.0,
                                      ),
                                    ),
                                  );
                                }

                                final cardmemberCommunityMemberRecord =
                                    snapshot.data!;

                                return wrapWithModel(
                                  model: _model.cardmemberModels.getModel(
                                    memberIndex.toString(),
                                    memberIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: CardmemberWidget(
                                    key: Key(
                                      'Key47k_${memberIndex.toString()}',
                                    ),
                                    user: cardmemberCommunityMemberRecord,
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
