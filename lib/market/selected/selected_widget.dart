import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/market/card/cardmarket/cardmarket_widget.dart';
import '/market/card/cardselected/cardselected_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'selected_model.dart';
export 'selected_model.dart';

class SelectedWidget extends StatefulWidget {
  const SelectedWidget({super.key});

  static String routeName = 'selected';
  static String routePath = 'selected';

  @override
  State<SelectedWidget> createState() => _SelectedWidgetState();
}

class _SelectedWidgetState extends State<SelectedWidget> {
  late SelectedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectedModel());
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
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 70.0, 15.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
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
                      context.safePop();
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Arrow_-_Left.png',
                        width: 24.0,
                        height: 24.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'l33mlv1t' /* Selected _ Items */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ].divide(SizedBox(width: 30.0)),
              ),
              wrapWithModel(
                model: _model.cardselectedModel1,
                updateCallback: () => safeSetState(() {}),
                child: CardselectedWidget(),
              ),
              wrapWithModel(
                model: _model.cardselectedModel2,
                updateCallback: () => safeSetState(() {}),
                child: CardselectedWidget(),
              ),
              wrapWithModel(
                model: _model.cardselectedModel3,
                updateCallback: () => safeSetState(() {}),
                child: CardselectedWidget(),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFBFF),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 0.0, 15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '70as0ooa' /* You may also like */,
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
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'fgnzl89r' /* view all */,
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
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                        StreamBuilder<List<ProductRecord>>(
                          stream: queryProductRecord(
                            queryBuilder: (productRecord) =>
                                productRecord.orderBy('created_at'),
                            limit: 10,
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
                            List<ProductRecord> rowProductRecordList =
                                snapshot.data!;

                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                    rowProductRecordList.length, (rowIndex) {
                                  final rowProductRecord =
                                      rowProductRecordList[rowIndex];
                                  return wrapWithModel(
                                    model: _model.cardmarketModels.getModel(
                                      rowIndex.toString(),
                                      rowIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: CardmarketWidget(
                                      key: Key(
                                        'Keyo5c_${rowIndex.toString()}',
                                      ),
                                      product: rowProductRecord,
                                    ),
                                  );
                                }).divide(SizedBox(width: 10.0)),
                              ),
                            );
                          },
                        ),
                      ].divide(SizedBox(height: 20.0)),
                    ),
                  ),
                ),
              ),
            ].divide(SizedBox(height: 20.0)),
          ),
        ),
      ),
    );
  }
}
