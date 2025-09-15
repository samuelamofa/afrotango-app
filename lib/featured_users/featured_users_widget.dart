import '/backend/backend.dart';
import '/community/cardcomponent/cardnew_copy/cardnew_copy_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'featured_users_model.dart';
export 'featured_users_model.dart';

class FeaturedUsersWidget extends StatefulWidget {
  const FeaturedUsersWidget({super.key});

  static String routeName = 'FeaturedUsers';
  static String routePath = 'featuredUsers';

  @override
  State<FeaturedUsersWidget> createState() => _FeaturedUsersWidgetState();
}

class _FeaturedUsersWidgetState extends State<FeaturedUsersWidget> {
  late FeaturedUsersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeaturedUsersModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(),
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
        List<UsersRecord> featuredUsersUsersRecordList = snapshot.data!;

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
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'hpufo7jq' /* Featured Users */,
                ),
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      font: GoogleFonts.poppins(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleMedium.fontStyle,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: Visibility(
                          visible: featuredUsersUsersRecordList.length > 0,
                          child: Builder(
                            builder: (context) {
                              final serchterm =
                                  featuredUsersUsersRecordList.toList();

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(serchterm.length,
                                    (serchtermIndex) {
                                  final serchtermItem =
                                      serchterm[serchtermIndex];
                                  return wrapWithModel(
                                    model: _model.cardnewCopyModels1.getModel(
                                      serchtermIndex.toString(),
                                      serchtermIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: CardnewCopyWidget(
                                      key: Key(
                                        'Key9ha_${serchtermIndex.toString()}',
                                      ),
                                      user: serchtermItem,
                                    ),
                                  );
                                }).divide(SizedBox(height: 10.0)),
                              );
                            },
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: Visibility(
                          visible: featuredUsersUsersRecordList.length == 0,
                          child: Builder(
                            builder: (context) {
                              final serchterm =
                                  featuredUsersUsersRecordList.toList();

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(serchterm.length,
                                    (serchtermIndex) {
                                  final serchtermItem =
                                      serchterm[serchtermIndex];
                                  return wrapWithModel(
                                    model: _model.cardnewCopyModels2.getModel(
                                      serchtermIndex.toString(),
                                      serchtermIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: CardnewCopyWidget(
                                      key: Key(
                                        'Keysf3_${serchtermIndex.toString()}',
                                      ),
                                      user: serchtermItem,
                                    ),
                                  );
                                }).divide(SizedBox(height: 10.0)),
                              );
                            },
                          ),
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 10.0))
                        .addToStart(SizedBox(height: 20.0)),
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
