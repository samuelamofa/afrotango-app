import '/backend/backend.dart';
import '/community/cardcomponent/card/card_widget.dart';
import '/community/cardcomponent/community_filter/community_filter_widget.dart';
import '/community/cardcomunity/cardcomunity_widget.dart';
import '/community/comunity_nav/comunity_nav_widget.dart';
import '/components/emptylist_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'dart:math' as math;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comunity_home_model.dart';
export 'comunity_home_model.dart';

class ComunityHomeWidget extends StatefulWidget {
  const ComunityHomeWidget({super.key});

  static String routeName = 'comunityHome';
  static String routePath = 'comunityHome';

  @override
  State<ComunityHomeWidget> createState() => _ComunityHomeWidgetState();
}

class _ComunityHomeWidgetState extends State<ComunityHomeWidget>
    with TickerProviderStateMixin {
  late ComunityHomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComunityHomeModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: Offset(-20.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: Offset(-20.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'transformOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(30.0, -30.0),
          ),
        ],
      ),
      'iconOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<CommunityRecord>>(
      stream: queryCommunityRecord(
        limit: 10,
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
        List<CommunityRecord> comunityHomeCommunityRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 54.0,
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.pushNamed(HomePageWidget.routeName);
                },
              ),
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(HomePageWidget.routeName);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Shape_(3).png',
                        width: 40.0,
                        height: 40.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              actions: [],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(70.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: CommunityFilterWidget(
                                listofDoc: comunityHomeCommunityRecordList,
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: Container(
                      width: 320.0,
                      height: 54.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.search,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 30.0,
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              '93po1ety' /* Search Group */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xA614181B),
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          Icon(
                            FFIcons.kslidersH,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 24.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              centerTitle: false,
            ),
            body: Container(
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                StreamBuilder<List<CatigoryCommunityRecord>>(
                                  stream: queryCatigoryCommunityRecord(),
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
                                    List<CatigoryCommunityRecord>
                                        rowCatigoryCommunityRecordList =
                                        snapshot.data!;

                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                            rowCatigoryCommunityRecordList
                                                .length, (rowIndex) {
                                          final rowCatigoryCommunityRecord =
                                              rowCatigoryCommunityRecordList[
                                                  rowIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.catigory =
                                                  rowCatigoryCommunityRecord
                                                      .reference;
                                              safeSetState(() {});
                                            },
                                            child: wrapWithModel(
                                              model: _model.cardModels.getModel(
                                                rowIndex.toString(),
                                                rowIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: CardWidget(
                                                key: Key(
                                                  'Keyhuq_${rowIndex.toString()}',
                                                ),
                                                catigory:
                                                    rowCatigoryCommunityRecord,
                                                swlected: _model.catigory,
                                              ),
                                            ),
                                          );
                                        }).divide(SizedBox(width: 9.0)),
                                      ),
                                    );
                                  },
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'pvocze1w' /* Featured Communities */,
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
                            if (comunityHomeCommunityRecordList.length > 0)
                              Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Builder(
                                  builder: (context) {
                                    final comunity = (_model.catigory != null
                                            ? comunityHomeCommunityRecordList
                                                .where((e) => e.catigories
                                                    .contains(_model.catigory))
                                                .toList()
                                            : comunityHomeCommunityRecordList)
                                        .toList();

                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(comunity.length,
                                            (comunityIndex) {
                                          final comunityItem =
                                              comunity[comunityIndex];
                                          return wrapWithModel(
                                            model: _model.cardcomunityModels1
                                                .getModel(
                                              comunityIndex.toString(),
                                              comunityIndex,
                                            ),
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: CardcomunityWidget(
                                              key: Key(
                                                'Key4mo_${comunityIndex.toString()}',
                                              ),
                                              community: comunityItem,
                                            ),
                                          );
                                        }).divide(SizedBox(width: 8.0)),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            if (comunityHomeCommunityRecordList.length == 0)
                              Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Builder(
                                  builder: (context) {
                                    final comunity = (_model.catigory != null
                                            ? comunityHomeCommunityRecordList
                                                .where((e) => e.catigories
                                                    .contains(_model.catigory))
                                                .toList()
                                            : comunityHomeCommunityRecordList)
                                        .toList();

                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(comunity.length,
                                            (comunityIndex) {
                                          final comunityItem =
                                              comunity[comunityIndex];
                                          return Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: wrapWithModel(
                                              model: _model.emptylistModels1
                                                  .getModel(
                                                random_data.randomString(
                                                  0,
                                                  8,
                                                  true,
                                                  false,
                                                  false,
                                                ),
                                                comunityIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: EmptylistWidget(
                                                key: Key(
                                                  'Keya7o_${random_data.randomString(
                                                    0,
                                                    8,
                                                    true,
                                                    false,
                                                    false,
                                                  )}',
                                                ),
                                              ),
                                            ),
                                          );
                                        }).divide(SizedBox(width: 8.0)),
                                      ),
                                    );
                                  },
                                ),
                              ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'wc291bti' /* Popular Communities */,
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
                            if (comunityHomeCommunityRecordList.length > 0)
                              Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Builder(
                                  builder: (context) {
                                    final comunity = (_model.catigory != null
                                            ? comunityHomeCommunityRecordList
                                                .where((e) => e.catigories
                                                    .contains(_model.catigory))
                                                .toList()
                                            : comunityHomeCommunityRecordList)
                                        .toList();

                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(comunity.length,
                                            (comunityIndex) {
                                          final comunityItem =
                                              comunity[comunityIndex];
                                          return wrapWithModel(
                                            model: _model.cardcomunityModels2
                                                .getModel(
                                              comunityIndex.toString(),
                                              comunityIndex,
                                            ),
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: CardcomunityWidget(
                                              key: Key(
                                                'Keyrxn_${comunityIndex.toString()}',
                                              ),
                                              community: comunityItem,
                                            ),
                                          );
                                        }).divide(SizedBox(width: 8.0)),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            if (comunityHomeCommunityRecordList.length == 0)
                              Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Builder(
                                  builder: (context) {
                                    final comunity = (_model.catigory != null
                                            ? comunityHomeCommunityRecordList
                                                .where((e) => e.catigories
                                                    .contains(_model.catigory))
                                                .toList()
                                            : comunityHomeCommunityRecordList)
                                        .toList();

                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(comunity.length,
                                            (comunityIndex) {
                                          final comunityItem =
                                              comunity[comunityIndex];
                                          return Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: wrapWithModel(
                                              model: _model.emptylistModels2
                                                  .getModel(
                                                random_data.randomString(
                                                  0,
                                                  8,
                                                  true,
                                                  false,
                                                  false,
                                                ),
                                                comunityIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: EmptylistWidget(
                                                key: Key(
                                                  'Keydqq_${random_data.randomString(
                                                    0,
                                                    8,
                                                    true,
                                                    false,
                                                    false,
                                                  )}',
                                                ),
                                              ),
                                            ),
                                          );
                                        }).divide(SizedBox(width: 8.0)),
                                      ),
                                    );
                                  },
                                ),
                              ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '45mhu6l6' /* New Communities */,
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
                            if (comunityHomeCommunityRecordList.length > 0)
                              Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Builder(
                                  builder: (context) {
                                    final comunity = (_model.catigory != null
                                            ? comunityHomeCommunityRecordList
                                                .where((e) => e.catigories
                                                    .contains(_model.catigory))
                                                .toList()
                                            : comunityHomeCommunityRecordList)
                                        .toList();

                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(comunity.length,
                                            (comunityIndex) {
                                          final comunityItem =
                                              comunity[comunityIndex];
                                          return wrapWithModel(
                                            model: _model.cardcomunityModels3
                                                .getModel(
                                              comunityIndex.toString(),
                                              comunityIndex,
                                            ),
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: CardcomunityWidget(
                                              key: Key(
                                                'Key115_${comunityIndex.toString()}',
                                              ),
                                              community: comunityItem,
                                            ),
                                          );
                                        }).divide(SizedBox(width: 8.0)),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            if (comunityHomeCommunityRecordList.length == 0)
                              Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Builder(
                                  builder: (context) {
                                    final comunity = (_model.catigory != null
                                            ? comunityHomeCommunityRecordList
                                                .where((e) => e.catigories
                                                    .contains(_model.catigory))
                                                .toList()
                                            : comunityHomeCommunityRecordList)
                                        .toList();

                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(comunity.length,
                                            (comunityIndex) {
                                          final comunityItem =
                                              comunity[comunityIndex];
                                          return Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: wrapWithModel(
                                              model: _model.emptylistModels3
                                                  .getModel(
                                                random_data.randomString(
                                                  0,
                                                  8,
                                                  true,
                                                  false,
                                                  false,
                                                ),
                                                comunityIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: EmptylistWidget(
                                                key: Key(
                                                  'Keyq4q_${random_data.randomString(
                                                    0,
                                                    8,
                                                    true,
                                                    false,
                                                    false,
                                                  )}',
                                                ),
                                              ),
                                            ),
                                          );
                                        }).divide(SizedBox(width: 8.0)),
                                      ),
                                    );
                                  },
                                ),
                              ),
                          ],
                        ),
                      ].addToEnd(SizedBox(height: 80.0)),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: wrapWithModel(
                      model: _model.comunityNavModel,
                      updateCallback: () => safeSetState(() {}),
                      child: ComunityNavWidget(
                        tab: 3,
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
                    Align(
                      alignment: AlignmentDirectional(1.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 16.0, 87.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional(1.0, 1.0),
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(40.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(40.0),
                                  ),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 2.0,
                                      sigmaY: 2.0,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 25.0, 10.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(40.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(40.0),
                                        ),
                                        child: Container(
                                          width: 180.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(40.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(20.0),
                                              topRight: Radius.circular(40.0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 8.0, 0.0, 10.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        CommunitychatlistWidget
                                                            .routeName,
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 100.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          FlutterFlowIconButton(
                                                            borderRadius: 30.0,
                                                            buttonSize: 50.0,
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                            icon: Icon(
                                                              FFIcons.kchat,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              size: 20.0,
                                                            ),
                                                            onPressed: () {
                                                              print(
                                                                  'IconButton pressed ...');
                                                            },
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'mlifay4m' /* New Chat */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                                        .primary,
                                                                    fontSize:
                                                                        8.0,
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
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation2']!,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                          AddmemberWidget
                                                              .routeName);
                                                    },
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 62.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FlutterFlowIconButton(
                                                            borderRadius: 30.0,
                                                            buttonSize: 50.0,
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                            icon: Icon(
                                                              Icons
                                                                  .groups_sharp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              size: 20.0,
                                                            ),
                                                            onPressed: () {
                                                              print(
                                                                  'IconButton pressed ...');
                                                            },
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '7vm00km1' /* Create Group */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                                        .primary,
                                                                    fontSize:
                                                                        8.0,
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
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation3']!,
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 20.0)),
                                            ),
                                          ),
                                        ),
                                      ).animateOnActionTrigger(
                                        animationsMap[
                                            'containerOnActionTriggerAnimation1']!,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 8.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (FFAppState().isOptionsExpanded) {
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation1'] !=
                                            null) {
                                          animationsMap[
                                                  'containerOnActionTriggerAnimation1']!
                                              .controller
                                              .reverse();
                                        }
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation2'] !=
                                            null) {
                                          animationsMap[
                                                  'containerOnActionTriggerAnimation2']!
                                              .controller
                                              .reverse();
                                        }
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation2'] !=
                                            null) {
                                          animationsMap[
                                                  'containerOnActionTriggerAnimation2']!
                                              .controller
                                              .reverse();
                                        }
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation2'] !=
                                            null) {
                                          animationsMap[
                                                  'containerOnActionTriggerAnimation2']!
                                              .controller
                                              .reverse();
                                        }
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation3'] !=
                                            null) {
                                          animationsMap[
                                                  'containerOnActionTriggerAnimation3']!
                                              .controller
                                              .reverse();
                                        }
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation1'] !=
                                            null) {
                                          animationsMap[
                                                  'containerOnActionTriggerAnimation1']!
                                              .controller
                                              .reverse();
                                        }
                                        if (animationsMap[
                                                'transformOnActionTriggerAnimation'] !=
                                            null) {
                                          animationsMap[
                                                  'transformOnActionTriggerAnimation']!
                                              .controller
                                              .reverse();
                                        }
                                        if (animationsMap[
                                                'iconOnActionTriggerAnimation'] !=
                                            null) {
                                          animationsMap[
                                                  'iconOnActionTriggerAnimation']!
                                              .controller
                                              .reverse();
                                        }
                                        FFAppState().isOptionsExpanded = false;
                                      } else {
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation1'] !=
                                            null) {
                                          animationsMap[
                                                  'containerOnActionTriggerAnimation1']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation1'] !=
                                            null) {
                                          animationsMap[
                                                  'containerOnActionTriggerAnimation1']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation2'] !=
                                            null) {
                                          animationsMap[
                                                  'containerOnActionTriggerAnimation2']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation1'] !=
                                            null) {
                                          animationsMap[
                                                  'containerOnActionTriggerAnimation1']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation3'] !=
                                            null) {
                                          animationsMap[
                                                  'containerOnActionTriggerAnimation3']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation1'] !=
                                            null) {
                                          animationsMap[
                                                  'containerOnActionTriggerAnimation1']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                        if (animationsMap[
                                                'transformOnActionTriggerAnimation'] !=
                                            null) {
                                          animationsMap[
                                                  'transformOnActionTriggerAnimation']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                        if (animationsMap[
                                                'iconOnActionTriggerAnimation'] !=
                                            null) {
                                          animationsMap[
                                                  'iconOnActionTriggerAnimation']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                        FFAppState().isOptionsExpanded = true;
                                      }
                                    },
                                    child: ClipOval(
                                      child: Container(
                                        width: 50.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFF937416),
                                              Color(0xFFE2BF4E)
                                            ],
                                            stops: [0.0, 1.0],
                                            begin: AlignmentDirectional(
                                                0.87, -1.0),
                                            end: AlignmentDirectional(
                                                -0.87, 1.0),
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          children: [
                                            Transform.rotate(
                                              angle: -45.0 * (math.pi / 180),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: Icon(
                                                  Icons.send_rounded,
                                                  color: Colors.white,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ).animateOnActionTrigger(
                                              animationsMap[
                                                  'transformOnActionTriggerAnimation']!,
                                            ),
                                            Icon(
                                              Icons.close_rounded,
                                              color: Colors.white,
                                              size: 24.0,
                                            ).animateOnActionTrigger(
                                              animationsMap[
                                                  'iconOnActionTriggerAnimation']!,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
