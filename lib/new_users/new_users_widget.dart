import '/backend/backend.dart';
import '/community/cardcomponent/cardnew_copy/cardnew_copy_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'new_users_model.dart';
export 'new_users_model.dart';

class NewUsersWidget extends StatefulWidget {
  const NewUsersWidget({super.key});

  static String routeName = 'NewUsers';
  static String routePath = 'newUsers';

  @override
  State<NewUsersWidget> createState() => _NewUsersWidgetState();
}

class _NewUsersWidgetState extends State<NewUsersWidget> {
  late NewUsersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewUsersModel());
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
        List<UsersRecord> newUsersUsersRecordList = snapshot.data!;

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
                  'eny198zj' /* New Users */,
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
                  if (newUsersUsersRecordList.length > 0)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final serch = newUsersUsersRecordList.toList();

                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children:
                                  List.generate(serch.length, (serchIndex) {
                                final serchItem = serch[serchIndex];
                                return wrapWithModel(
                                  model: _model.cardnewCopyModels1.getModel(
                                    serchIndex.toString(),
                                    serchIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: CardnewCopyWidget(
                                    key: Key(
                                      'Keyzay_${serchIndex.toString()}',
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
                  if (newUsersUsersRecordList.length == 0)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final serch = newUsersUsersRecordList.toList();

                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children:
                                  List.generate(serch.length, (serchIndex) {
                                final serchItem = serch[serchIndex];
                                return wrapWithModel(
                                  model: _model.cardnewCopyModels2.getModel(
                                    serchIndex.toString(),
                                    serchIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: CardnewCopyWidget(
                                    key: Key(
                                      'Key8u1_${serchIndex.toString()}',
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
