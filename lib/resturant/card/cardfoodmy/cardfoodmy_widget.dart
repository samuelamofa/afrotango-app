import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cardfoodmy_model.dart';
export 'cardfoodmy_model.dart';

class CardfoodmyWidget extends StatefulWidget {
  const CardfoodmyWidget({
    super.key,
    required this.recipe,
  });

  final RecipeRecord? recipe;

  @override
  State<CardfoodmyWidget> createState() => _CardfoodmyWidgetState();
}

class _CardfoodmyWidgetState extends State<CardfoodmyWidget> {
  late CardfoodmyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardfoodmyModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        context.pushNamed(
          ResturantDetailsWidget.routeName,
          queryParameters: {
            'recipe': serializeParam(
              widget.recipe,
              ParamType.Document,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            'recipe': widget.recipe,
          },
        );
      },
      child: Container(
        width: double.infinity,
        height: 117.74,
        decoration: BoxDecoration(
          color: Color(0xFF31373C),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(0.0),
                  ),
                  child: Image.network(
                    valueOrDefault<String>(
                      widget.recipe?.image,
                      'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw1fHxmb29kfGVufDB8fHx8MTc0MTg1NTQ2M3ww&ixlib=rb-4.0.3&q=80&w=1080',
                    ),
                    width: 120.0,
                    height: 120.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.recipe?.name,
                            'Appam & Stew - 2 nos',
                          ).maybeHandleOverflow(
                            maxChars: 17,
                            replacement: '…',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.local_fire_department,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 16.0,
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    '${valueOrDefault<String>(
                                      widget.recipe?.caloris.toString(),
                                      '0',
                                    )} kcal',
                                    '320 kcal',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                ),
                              ].divide(SizedBox(width: 4.0)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.scale,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 16.0,
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    '${valueOrDefault<String>(
                                      widget.recipe?.grm.toString(),
                                      '0',
                                    )} gm',
                                    '300 gm',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                ),
                              ].divide(SizedBox(width: 4.0)),
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                        Text(
                          valueOrDefault<String>(
                            formatNumber(
                              widget.recipe?.price,
                              formatType: FormatType.decimal,
                              decimalType: DecimalType.automatic,
                              currency: '₵',
                            ),
                            '₵180',
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                        ),
                      ].divide(SizedBox(height: 4.0)),
                    ),
                  ],
                ),
              ].divide(SizedBox(width: 16.0)),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
              child: FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 40.0,
                fillColor: Color(0x47000000),
                icon: Icon(
                  Icons.restore_from_trash_outlined,
                  color: Color(0xFFFF0000),
                  size: 24.0,
                ),
                onPressed: () async {
                  await widget.recipe!.reference.delete();
                },
              ),
            ),
          ].divide(SizedBox(width: 12.0)),
        ),
      ),
    );
  }
}
