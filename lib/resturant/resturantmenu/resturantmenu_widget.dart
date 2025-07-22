import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/resturant/card/cardfood1/cardfood1_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'resturantmenu_model.dart';
export 'resturantmenu_model.dart';

class ResturantmenuWidget extends StatefulWidget {
  const ResturantmenuWidget({
    super.key,
    required this.menue,
  });

  final ResturantMenueRecord? menue;

  static String routeName = 'Resturantmenu';
  static String routePath = 'resturantmenu';

  @override
  State<ResturantmenuWidget> createState() => _ResturantmenuWidgetState();
}

class _ResturantmenuWidgetState extends State<ResturantmenuWidget> {
  late ResturantmenuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResturantmenuModel());
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
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            context.safePop();
                          },
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget.menue?.name,
                            'menu',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ].divide(SizedBox(width: 20.0)),
                    ),
                  ),
                  StreamBuilder<List<RecipeRecord>>(
                    stream: queryRecipeRecord(
                      queryBuilder: (recipeRecord) => recipeRecord.where(
                        'resturantmenue',
                        isEqualTo: widget.menue?.reference,
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
                      List<RecipeRecord> listViewRecipeRecordList =
                          snapshot.data!;

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewRecipeRecordList.length,
                        separatorBuilder: (_, __) => SizedBox(height: 20.0),
                        itemBuilder: (context, listViewIndex) {
                          final listViewRecipeRecord =
                              listViewRecipeRecordList[listViewIndex];
                          return wrapWithModel(
                            model: _model.cardfood1Models.getModel(
                              listViewIndex.toString(),
                              listViewIndex,
                            ),
                            updateCallback: () => safeSetState(() {}),
                            child: Cardfood1Widget(
                              key: Key(
                                'Keyke9_${listViewIndex.toString()}',
                              ),
                              recipe: listViewRecipeRecord,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ].divide(SizedBox(height: 40.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
