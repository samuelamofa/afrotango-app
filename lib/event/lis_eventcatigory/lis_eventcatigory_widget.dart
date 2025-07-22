import '/backend/backend.dart';
import '/event/cardevent/eventcardcatigory/eventcardcatigory_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'lis_eventcatigory_model.dart';
export 'lis_eventcatigory_model.dart';

class LisEventcatigoryWidget extends StatefulWidget {
  const LisEventcatigoryWidget({super.key});

  static String routeName = 'LisEventcatigory';
  static String routePath = 'lisEventcatigory';

  @override
  State<LisEventcatigoryWidget> createState() => _LisEventcatigoryWidgetState();
}

class _LisEventcatigoryWidgetState extends State<LisEventcatigoryWidget> {
  late LisEventcatigoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LisEventcatigoryModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.catigoryevent = await queryEventcatigoryRecordOnce(
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.catigory = _model.catigoryevent?.reference;
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
    return StreamBuilder<List<EventRecord>>(
      stream: queryEventRecord(),
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
        List<EventRecord> lisEventcatigoryEventRecordList = snapshot.data!;

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
                  context.pop();
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'c5bdrkl5' /* Events For You */,
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
                      fontStyle:
                          FlutterFlowTheme.of(context).titleMedium.fontStyle,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: Container(
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 30.0, 15.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      StreamBuilder<List<EventcatigoryRecord>>(
                        stream: queryEventcatigoryRecord(),
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
                          List<EventcatigoryRecord> rowEventcatigoryRecordList =
                              snapshot.data!;

                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  rowEventcatigoryRecordList.length,
                                  (rowIndex) {
                                final rowEventcatigoryRecord =
                                    rowEventcatigoryRecordList[rowIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.catigory =
                                        rowEventcatigoryRecord.reference;
                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color:
                                            rowEventcatigoryRecord.reference ==
                                                    _model.catigory
                                                ? FlutterFlowTheme.of(context)
                                                    .secondary
                                                : FlutterFlowTheme.of(context)
                                                    .primary,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              rowEventcatigoryRecord.image,
                                              width: 24.0,
                                              height: 24.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Text(
                                            rowEventcatigoryRecord.name,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 10.0)),
                                      ),
                                    ),
                                  ),
                                );
                              }).divide(SizedBox(width: 15.0)),
                            ),
                          );
                        },
                      ),
                      if (_model.catigory == null)
                        Builder(
                          builder: (context) {
                            final event =
                                lisEventcatigoryEventRecordList.toList();

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: event.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 12.0),
                              itemBuilder: (context, eventIndex) {
                                final eventItem = event[eventIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.eventcardcatigoryModels1
                                        .getModel(
                                      eventIndex.toString(),
                                      eventIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: EventcardcatigoryWidget(
                                      key: Key(
                                        'Key51x_${eventIndex.toString()}',
                                      ),
                                      event: eventItem,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      if (_model.catigory != null)
                        StreamBuilder<List<EventRecord>>(
                          stream: queryEventRecord(
                            queryBuilder: (eventRecord) => eventRecord.where(
                              'catigory',
                              isEqualTo: _model.catigory,
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
                            List<EventRecord> listViewEventRecordList =
                                snapshot.data!;

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewEventRecordList.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 12.0),
                              itemBuilder: (context, listViewIndex) {
                                final listViewEventRecord =
                                    listViewEventRecordList[listViewIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 40.0, 0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.eventcardcatigoryModels2
                                        .getModel(
                                      listViewIndex.toString(),
                                      listViewIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: EventcardcatigoryWidget(
                                      key: Key(
                                        'Keyhp2_${listViewIndex.toString()}',
                                      ),
                                      event: listViewEventRecord,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                    ].divide(SizedBox(height: 20.0)),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
