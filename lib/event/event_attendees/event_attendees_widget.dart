import '/backend/backend.dart';
import '/community/cardcomponent/cardmember2/cardmember2_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'event_attendees_model.dart';
export 'event_attendees_model.dart';

class EventAttendeesWidget extends StatefulWidget {
  const EventAttendeesWidget({
    super.key,
    required this.event,
  });

  final EventRecord? event;

  static String routeName = 'EventAttendees';
  static String routePath = 'eventAttendees';

  @override
  State<EventAttendeesWidget> createState() => _EventAttendeesWidgetState();
}

class _EventAttendeesWidgetState extends State<EventAttendeesWidget> {
  late EventAttendeesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventAttendeesModel());
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
            valueOrDefault<String>(
              'Attendants (${widget.event?.joinedUsersRef.length.toString()})',
              '0',
            ),
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  font: GoogleFonts.poppins(
                    fontWeight:
                        FlutterFlowTheme.of(context).titleMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primary,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).titleMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(HomePageWidget.routeName);
                },
                child: Container(
                  width: 45.0,
                  height: 45.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/Shape_(3).png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                '',
                fit: BoxFit.cover,
              ),
            ),
          ),
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final attendee =
                          widget.event?.joinedUsersRef.toList() ?? [];

                      return ListView.separated(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          0,
                          0,
                          20.0,
                        ),
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: attendee.length,
                        separatorBuilder: (_, __) => SizedBox(height: 20.0),
                        itemBuilder: (context, attendeeIndex) {
                          final attendeeItem = attendee[attendeeIndex];
                          return StreamBuilder<UsersRecord>(
                            stream: UsersRecord.getDocument(attendeeItem),
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

                              final cardmember2UsersRecord = snapshot.data!;

                              return wrapWithModel(
                                model: _model.cardmember2Models.getModel(
                                  attendeeIndex.toString(),
                                  attendeeIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: Cardmember2Widget(
                                  key: Key(
                                    'Keyv09_${attendeeIndex.toString()}',
                                  ),
                                  user: cardmember2UsersRecord,
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ].divide(SizedBox(height: 30.0)).around(SizedBox(height: 30.0)),
            ),
          ),
        ),
      ),
    );
  }
}
