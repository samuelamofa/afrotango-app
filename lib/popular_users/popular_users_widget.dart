import '/backend/backend.dart';
import '/community/cardcomponent/cardnew_copy/cardnew_copy_widget.dart';
import '/components/emptylist_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'popular_users_model.dart';
export 'popular_users_model.dart';

class PopularUsersWidget extends StatefulWidget {
  const PopularUsersWidget({super.key});

  static String routeName = 'PopularUsers';
  static String routePath = 'popularUsers';

  @override
  State<PopularUsersWidget> createState() => _PopularUsersWidgetState();
}

class _PopularUsersWidgetState extends State<PopularUsersWidget> {
  late PopularUsersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopularUsersModel());
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
        List<UsersRecord> popularUsersUsersRecordList = snapshot.data!;

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
                  'o105ev8f' /* Popular Users */,
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (popularUsersUsersRecordList.length > 0)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final serch = popularUsersUsersRecordList
                              .sortedList(
                                  keyOf: (e) => e.followers.length, desc: true)
                              .toList();
                          if (serch.isEmpty) {
                            return EmptylistWidget();
                          }

                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children:
                                  List.generate(serch.length, (serchIndex) {
                                final serchItem = serch[serchIndex];
                                return wrapWithModel(
                                  model: _model.cardnewCopyModels.getModel(
                                    serchIndex.toString(),
                                    serchIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: CardnewCopyWidget(
                                    key: Key(
                                      'Keywq6_${serchIndex.toString()}',
                                    ),
                                    user: serchItem,
                                  ),
                                );
                              })
                                      .divide(SizedBox(height: 10.0))
                                      .addToStart(SizedBox(height: 20.0)),
                            ),
                          );
                        },
                      ),
                    ),
                  if (popularUsersUsersRecordList.length == 0)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final serch = popularUsersUsersRecordList
                              .sortedList(
                                  keyOf: (e) => e.followers.length, desc: true)
                              .toList();
                          if (serch.isEmpty) {
                            return EmptylistWidget();
                          }

                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children:
                                  List.generate(serch.length, (serchIndex) {
                                final serchItem = serch[serchIndex];
                                return Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: wrapWithModel(
                                    model: _model.emptylistModels.getModel(
                                      random_data.randomString(
                                        0,
                                        8,
                                        true,
                                        false,
                                        false,
                                      ),
                                      serchIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: EmptylistWidget(
                                      key: Key(
                                        'Key9ci_${random_data.randomString(
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
                              })
                                      .divide(SizedBox(height: 10.0))
                                      .addToStart(SizedBox(height: 20.0)),
                            ),
                          );
                        },
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
