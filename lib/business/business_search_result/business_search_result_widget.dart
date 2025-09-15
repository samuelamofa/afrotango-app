import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'business_search_result_model.dart';
export 'business_search_result_model.dart';

class BusinessSearchResultWidget extends StatefulWidget {
  const BusinessSearchResultWidget({
    super.key,
    required this.bussijness,
  });

  final BusinessRecord? bussijness;

  @override
  State<BusinessSearchResultWidget> createState() =>
      _BusinessSearchResultWidgetState();
}

class _BusinessSearchResultWidgetState
    extends State<BusinessSearchResultWidget> {
  late BusinessSearchResultModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BusinessSearchResultModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(
                BussinessWidget.routeName,
                queryParameters: {
                  'bussiness': serializeParam(
                    widget.bussijness,
                    ParamType.Document,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  'bussiness': widget.bussijness,
                },
              );
            },
            child: Material(
              color: Colors.transparent,
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                width: double.infinity,
                height: 70.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        valueOrDefault<String>(
                          widget.bussijness?.businessImage,
                          'https://picsum.photos/seed/48/600',
                        ),
                        width: 60.0,
                        height: 60.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.bussijness?.businessName,
                            'Business Name',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'tg2sgrwj' /* Category */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ],
                    ),
                  ]
                      .divide(SizedBox(width: 10.0))
                      .addToStart(SizedBox(width: 10.0))
                      .addToEnd(SizedBox(width: 10.0)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
