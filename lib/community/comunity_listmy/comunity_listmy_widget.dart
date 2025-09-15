import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/community/cardcomponent/card/card_widget.dart';
import '/community/cardcomponent/card_comunity/card_comunity_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'comunity_listmy_model.dart';
export 'comunity_listmy_model.dart';

class ComunityListmyWidget extends StatefulWidget {
  const ComunityListmyWidget({super.key});

  static String routeName = 'comunityListmy';
  static String routePath = 'comunityListmy';

  @override
  State<ComunityListmyWidget> createState() => _ComunityListmyWidgetState();
}

class _ComunityListmyWidgetState extends State<ComunityListmyWidget> {
  late ComunityListmyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComunityListmyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.catigor = await queryCatigoryCommunityRecordOnce(
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.catigory = _model.catigor?.reference;
      safeSetState(() {});
    });
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondary,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
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
                  ].divide(SizedBox(width: 10.0)),
                ),
                FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 40.0,
                  icon: FaIcon(
                    FontAwesomeIcons.search,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.pushNamed(SearchcontactCopyWidget.routeName);
                  },
                ),
              ],
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: Container(
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
                tabletLandscape: false,
                desktop: false,
              ))
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: 45.0,
                              height: 45.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                valueOrDefault<String>(
                                  currentUserPhoto,
                                  'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw4fHx1c2VyfGVufDB8fHx8MTc0MjQxMDIyNnww&ixlib=rb-4.0.3&q=80&w=1080',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          AuthUserStreamWidget(
                            builder: (context) => Text(
                              valueOrDefault<String>(
                                currentUserDisplayName,
                                'Andreas',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ].divide(SizedBox(width: 10.0)),
                      ),
                      FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 40.0,
                        icon: FaIcon(
                          FontAwesomeIcons.search,
                          color: Color(0xFF1A1167),
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.pushNamed(SearchcontactCopyWidget.routeName);
                        },
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: StreamBuilder<List<CatigoryCommunityRecord>>(
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
                        rowCatigoryCommunityRecordList = snapshot.data!;

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(
                            rowCatigoryCommunityRecordList.length, (rowIndex) {
                          final rowCatigoryCommunityRecord =
                              rowCatigoryCommunityRecordList[rowIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.catigory =
                                  rowCatigoryCommunityRecord.reference;
                              safeSetState(() {});
                            },
                            child: wrapWithModel(
                              model: _model.cardModels.getModel(
                                rowIndex.toString(),
                                rowIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              child: CardWidget(
                                key: Key(
                                  'Key6qf_${rowIndex.toString()}',
                                ),
                                catigory: rowCatigoryCommunityRecord,
                                swlected: _model.catigory,
                              ),
                            ),
                          );
                        }).divide(SizedBox(width: 9.0)),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).secondary,
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        size: 20.0,
                      ),
                      onPressed: () async {
                        context.safePop();
                      },
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'p2bif0xc' /* My Community  */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ].divide(SizedBox(width: 10.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: StreamBuilder<List<CommunityRecord>>(
                  stream: queryCommunityRecord(
                    queryBuilder: (communityRecord) => communityRecord
                        .where(
                          'catigories',
                          arrayContains: _model.catigory,
                        )
                        .where(
                          'createdUserRef',
                          isEqualTo: currentUserReference,
                        ),
                  ),
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
                    List<CommunityRecord> listViewCommunityRecordList =
                        snapshot.data!;

                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewCommunityRecordList.length,
                      separatorBuilder: (_, __) => SizedBox(height: 15.0),
                      itemBuilder: (context, listViewIndex) {
                        final listViewCommunityRecord =
                            listViewCommunityRecordList[listViewIndex];
                        return wrapWithModel(
                          model: _model.cardComunityModels.getModel(
                            listViewIndex.toString(),
                            listViewIndex,
                          ),
                          updateCallback: () => safeSetState(() {}),
                          child: CardComunityWidget(
                            key: Key(
                              'Keyh72_${listViewIndex.toString()}',
                            ),
                            comunity: listViewCommunityRecord,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ].divide(SizedBox(height: 10.0)).addToStart(SizedBox(height: 20.0)),
          ),
        ),
      ),
    );
  }
}
