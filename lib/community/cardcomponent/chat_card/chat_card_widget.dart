import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat_card_model.dart';
export 'chat_card_model.dart';

class ChatCardWidget extends StatefulWidget {
  const ChatCardWidget({
    super.key,
    required this.comunitychat,
  });

  final CommunitychatRecord? comunitychat;

  @override
  State<ChatCardWidget> createState() => _ChatCardWidgetState();
}

class _ChatCardWidgetState extends State<ChatCardWidget> {
  late ChatCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CommunityRecord>(
      stream: CommunityRecord.getDocument(widget.comunitychat!.communityRef!),
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

        final containerCommunityRecord = snapshot.data!;

        return Container(
          width: double.infinity,
          height: 80.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: StreamBuilder<List<CommunityMemberRecord>>(
            stream: queryCommunityMemberRecord(
              parent: containerCommunityRecord.reference,
              queryBuilder: (communityMemberRecord) =>
                  communityMemberRecord.where(
                'userRef',
                isEqualTo: currentUserReference,
              ),
              singleRecord: true,
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
              List<CommunityMemberRecord> rowCommunityMemberRecordList =
                  snapshot.data!;
              final rowCommunityMemberRecord =
                  rowCommunityMemberRecordList.isNotEmpty
                      ? rowCommunityMemberRecordList.first
                      : null;

              return Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          CommunitychatWidget.routeName,
                          queryParameters: {
                            'chat': serializeParam(
                              widget.comunitychat?.reference,
                              ParamType.DocumentReference,
                            ),
                            'comunity': serializeParam(
                              containerCommunityRecord.reference,
                              ParamType.DocumentReference,
                            ),
                            'member': serializeParam(
                              rowCommunityMemberRecord?.reference,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 45.0,
                            height: 45.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              valueOrDefault<String>(
                                containerCommunityRecord.image,
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/afro-tango-g6fj7t/assets/bg4fitk4cbij/user_(3).png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 10.0,
                                height: 2.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  containerCommunityRecord.displayName,
                                  'Milendra',
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
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  widget.comunitychat?.message,
                                  'why would you go to a trophical island',
                                ).maybeHandleOverflow(
                                  maxChars: 40,
                                  replacement: '…',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF2F2F2F),
                                      fontSize: 11.0,
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
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  dateTimeFormat(
                                    "jms",
                                    widget.comunitychat?.lastmesageTime,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  '10.31 am',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF2F2F2F),
                                      fontSize: 8.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              StreamBuilder<List<MessageRecord>>(
                                stream: queryMessageRecord(
                                  queryBuilder: (messageRecord) => messageRecord
                                      .where(
                                        'chat',
                                        isEqualTo:
                                            widget.comunitychat?.reference,
                                      )
                                      .where(
                                        'seenmember',
                                        arrayContains:
                                            rowCommunityMemberRecord?.reference,
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
                                  List<MessageRecord>
                                      containerMessageRecordList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Visibility(
                                      visible:
                                          containerMessageRecordList.length >=
                                              1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              containerMessageRecordList.length
                                                  .toString(),
                                              '4',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ].divide(SizedBox(width: 15.0)),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
