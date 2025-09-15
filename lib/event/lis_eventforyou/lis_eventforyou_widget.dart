import '/backend/backend.dart';
import '/event/cardevent/card1/card1_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'lis_eventforyou_model.dart';
export 'lis_eventforyou_model.dart';

class LisEventforyouWidget extends StatefulWidget {
  const LisEventforyouWidget({super.key});

  static String routeName = 'LisEventforyou';
  static String routePath = 'lisEventforyou';

  @override
  State<LisEventforyouWidget> createState() => _LisEventforyouWidgetState();
}

class _LisEventforyouWidgetState extends State<LisEventforyouWidget> {
  late LisEventforyouModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LisEventforyouModel());
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
              '3qzhd8xj' /* Event For You */,
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
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Container(
          decoration: BoxDecoration(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                StreamBuilder<List<EventRecord>>(
                  stream: queryEventRecord(
                    queryBuilder: (eventRecord) => eventRecord.where(
                      'number_attendants',
                      isGreaterThanOrEqualTo: 4,
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
                    List<EventRecord> listViewEventRecordList = snapshot.data!;

                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewEventRecordList.length,
                      separatorBuilder: (_, __) => SizedBox(height: 12.0),
                      itemBuilder: (context, listViewIndex) {
                        final listViewEventRecord =
                            listViewEventRecordList[listViewIndex];
                        return wrapWithModel(
                          model: _model.card1Models.getModel(
                            listViewIndex.toString(),
                            listViewIndex,
                          ),
                          updateCallback: () => safeSetState(() {}),
                          child: Card1Widget(
                            key: Key(
                              'Key106_${listViewIndex.toString()}',
                            ),
                            event: listViewEventRecord,
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
    );
  }
}
