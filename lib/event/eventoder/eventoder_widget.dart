import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/event/cardevent/card1_c/card1_c_widget.dart';
import '/event/cardevent/card3/card3_widget.dart';
import '/event/cardevent/event_navebar/event_navebar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'eventoder_model.dart';
export 'eventoder_model.dart';

class EventoderWidget extends StatefulWidget {
  const EventoderWidget({super.key});

  static String routeName = 'eventoder';
  static String routePath = 'eventoder';

  @override
  State<EventoderWidget> createState() => _EventoderWidgetState();
}

class _EventoderWidgetState extends State<EventoderWidget> {
  late EventoderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventoderModel());
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
          leading: FlutterFlowIconButton(
            borderRadius: 8.0,
            buttonSize: 54.0,
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: FlutterFlowTheme.of(context).primary,
              size: 24.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'dqeosn9i' /* Booked Events */,
            ),
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  font: GoogleFonts.poppins(
                    fontWeight:
                        FlutterFlowTheme.of(context).titleMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primary,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).titleMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
              child: InkWell(
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
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                '',
                fit: BoxFit.cover,
              ),
            ),
          ),
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Container(
          decoration: BoxDecoration(),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'k1s6omym' /* Upcoming */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).secondary,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                      StreamBuilder<List<RegisterdEventRecord>>(
                        stream: queryRegisterdEventRecord(
                          queryBuilder: (registerdEventRecord) =>
                              registerdEventRecord
                                  .where(
                                    'user',
                                    isEqualTo: currentUserReference,
                                  )
                                  .where(
                                    'event_end',
                                    isGreaterThan: getCurrentTimestamp,
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
                          List<RegisterdEventRecord>
                              listViewRegisterdEventRecordList = snapshot.data!;

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewRegisterdEventRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewRegisterdEventRecord =
                                  listViewRegisterdEventRecordList[
                                      listViewIndex];
                              return wrapWithModel(
                                model: _model.card3Models.getModel(
                                  listViewIndex.toString(),
                                  listViewIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: Card3Widget(
                                  key: Key(
                                    'Keye1q_${listViewIndex.toString()}',
                                  ),
                                  registerdEvent: listViewRegisterdEventRecord,
                                ),
                              );
                            },
                          );
                        },
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'x0gal31a' /* History */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                      StreamBuilder<List<RegisterdEventRecord>>(
                        stream: queryRegisterdEventRecord(
                          queryBuilder: (registerdEventRecord) =>
                              registerdEventRecord
                                  .where(
                                    'user',
                                    isEqualTo: currentUserReference,
                                  )
                                  .where(
                                    'event_end',
                                    isLessThan: getCurrentTimestamp,
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
                          List<RegisterdEventRecord>
                              rowRegisterdEventRecordList = snapshot.data!;

                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  rowRegisterdEventRecordList.length,
                                  (rowIndex) {
                                final rowRegisterdEventRecord =
                                    rowRegisterdEventRecordList[rowIndex];
                                return wrapWithModel(
                                  model: _model.card1CModels.getModel(
                                    rowIndex.toString(),
                                    rowIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: Card1CWidget(
                                    key: Key(
                                      'Key7zq_${rowIndex.toString()}',
                                    ),
                                    eventpurchase: rowRegisterdEventRecord,
                                  ),
                                );
                              }).divide(SizedBox(width: 12.0)),
                            ),
                          );
                        },
                      ),
                    ]
                        .divide(SizedBox(height: 30.0))
                        .around(SizedBox(height: 30.0)),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.eventNavebarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: EventNavebarWidget(
                    tba: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
