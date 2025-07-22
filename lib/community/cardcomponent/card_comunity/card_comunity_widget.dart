import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'card_comunity_model.dart';
export 'card_comunity_model.dart';

class CardComunityWidget extends StatefulWidget {
  const CardComunityWidget({
    super.key,
    required this.comunity,
  });

  final CommunityRecord? comunity;

  @override
  State<CardComunityWidget> createState() => _CardComunityWidgetState();
}

class _CardComunityWidgetState extends State<CardComunityWidget> {
  late CardComunityModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardComunityModel());
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
          CommunityProfileWidget.routeName,
          queryParameters: {
            'community': serializeParam(
              widget.comunity,
              ParamType.Document,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            'community': widget.comunity,
          },
        );
      },
      child: Container(
        width: 315.0,
        height: 134.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  valueOrDefault<String>(
                    widget.comunity?.image,
                    'https://images.unsplash.com/photo-1442504028989-ab58b5f29a4a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw5fHxjb21tdW5pdHl8ZW58MHx8fHwxNzQyNDkxMjgyfDA&ixlib=rb-4.0.3&q=80&w=1080',
                  ),
                  width: 85.0,
                  height: 104.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 10.0,
                              height: 2.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).comunity,
                              ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                widget.comunity?.displayName,
                                'Highland Collage',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ].divide(SizedBox(width: 5.0)),
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.comunity?.description,
                        'Jorge Ok sool like how do ...',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 10.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    Builder(
                      builder: (context) {
                        final member =
                            widget.comunity?.members.toList() ?? [];

                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(member.length, (memberIndex) {
                            final memberItem = member[memberIndex];
                            return StreamBuilder<CommunityMemberRecord>(
                              stream:
                                  CommunityMemberRecord.getDocument(memberItem),
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

                                final containerCommunityMemberRecord =
                                    snapshot.data!;

                                return Container(
                                  decoration: BoxDecoration(),
                                  child: StreamBuilder<UsersRecord>(
                                    stream: UsersRecord.getDocument(
                                        containerCommunityMemberRecord
                                            .userRef!),
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

                                      final circleImageUsersRecord =
                                          snapshot.data!;

                                      return Container(
                                        width: 25.0,
                                        height: 25.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            circleImageUsersRecord.photoUrl,
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/afro-tango-g6fj7t/assets/bg4fitk4cbij/user_(3).png',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          }),
                        );
                      },
                    ),
                  ].divide(SizedBox(height: 15.0)),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondary,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.comunity?.members.length.toString(),
                        '0',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.poppins(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                ),
              ),
              if (widget.comunity?.createdUserRef == currentUserReference)
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.delete_outlined,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Are you Sure you want to delete'),
                                content: Text('this Action can not be ondo'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: Text('Confirm'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (confirmDialogResponse) {
                        _model.chat = await queryCommunitychatRecordOnce(
                          queryBuilder: (communitychatRecord) =>
                              communitychatRecord.where(
                            'communityRef',
                            isEqualTo: widget.comunity?.reference,
                          ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);
                        await _model.chat!.reference.delete();
                        await widget.comunity!.reference.delete();
                      }

                      safeSetState(() {});
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
