import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'eventcardcatigory_model.dart';
export 'eventcardcatigory_model.dart';

class EventcardcatigoryWidget extends StatefulWidget {
  const EventcardcatigoryWidget({
    super.key,
    required this.event,
  });

  final EventRecord? event;

  @override
  State<EventcardcatigoryWidget> createState() =>
      _EventcardcatigoryWidgetState();
}

class _EventcardcatigoryWidgetState extends State<EventcardcatigoryWidget> {
  late EventcardcatigoryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventcardcatigoryModel());
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
          EventdetailsWidget.routeName,
          queryParameters: {
            'event': serializeParam(
              widget.event,
              ParamType.Document,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            'event': widget.event,
          },
        );
      },
      child: Container(
        width: 316.0,
        height: 245.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.network(
              valueOrDefault<String>(
                widget.event?.eventImage != null &&
                        widget.event?.eventImage != ''
                    ? widget.event?.eventImage
                    : 'https://images.unsplash.com/photo-1517048676732-d65bc937f952?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw5fHxldmVudHxlbnwwfHx8fDE3NDIzNzUzMDh8MA&ixlib=rb-4.0.3&q=80&w=1080',
                'https://images.unsplash.com/photo-1517048676732-d65bc937f952?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw5fHxldmVudHxlbnwwfHx8fDE3NDIzNzUzMDh8MA&ixlib=rb-4.0.3&q=80&w=1080',
              ),
            ).image,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StreamBuilder<EventcatigoryRecord>(
                      stream: EventcatigoryRecord.getDocument(
                          widget.event!.catigory!),
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

                        final imageEventcatigoryRecord = snapshot.data!;

                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              imageEventcatigoryRecord.image,
                              'https://images.unsplash.com/photo-1614680376573-df3480f0c6ff?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxtdXNpYyUyMGljb258ZW58MHx8fHwxNzQyNDY3MzI1fDA&ixlib=rb-4.0.3&q=80&w=1080',
                            ),
                            width: 24.0,
                            height: 24.0,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                    if ((currentUserDocument?.favoritevent.toList() ?? [])
                            .contains(widget.event?.reference) ==
                        true)
                      AuthUserStreamWidget(
                        builder: (context) => ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Group_2377.png',
                            width: 24.0,
                            height: 24.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    if ((currentUserDocument?.favoritevent.toList() ?? [])
                            .contains(widget.event?.reference) ==
                        false)
                      AuthUserStreamWidget(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await currentUserReference!.update({
                              ...mapToFirestore(
                                {
                                  'Favoritevent': FieldValue.arrayUnion(
                                      [widget.event?.reference]),
                                },
                              ),
                            });
                          },
                          child: Container(
                            width: 24.0,
                            height: 24.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              shape: BoxShape.circle,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.favorite_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 14.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ].divide(SizedBox(width: 10.0)),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5.0,
                    sigmaY: 5.0,
                  ),
                  child: Container(
                    width: 305.0,
                    height: 84.0,
                    decoration: BoxDecoration(
                      color: Color(0xBCFFFFFF),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              widget.event?.eventName,
                              'International Jazz Festival..',
                            ).maybeHandleOverflow(
                              maxChars: 28,
                              replacement: '…',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${valueOrDefault<String>(
                                  dateTimeFormat(
                                    "yMMMd",
                                    widget.event?.eventDate,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  '30 April 2023 ',
                                )}-${valueOrDefault<String>(
                                  widget.event?.eventLocation,
                                  'Jakarta',
                                )},${valueOrDefault<String>(
                                  widget.event?.country,
                                  'indonesia',
                                )}',
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
                                      color: Color(0xFF202020),
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
                              Text(
                                '${formatNumber(
                                  widget.event?.price,
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.automatic,
                                  currency: '\$',
                                )}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
