import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cardreview_model.dart';
export 'cardreview_model.dart';

class CardreviewWidget extends StatefulWidget {
  const CardreviewWidget({
    super.key,
    required this.review,
  });

  final ReviewRecipeRecord? review;

  @override
  State<CardreviewWidget> createState() => _CardreviewWidgetState();
}

class _CardreviewWidgetState extends State<CardreviewWidget> {
  late CardreviewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardreviewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF1D2126),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: StreamBuilder<UsersRecord>(
          stream: UsersRecord.getDocument(widget.review!.user!),
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

            final rowUsersRecord = snapshot.data!;

            return Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40.0,
                  height: 40.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    valueOrDefault<String>(
                      rowUsersRecord.photoUrl,
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/afro-tango-g6fj7t/assets/bg4fitk4cbij/user_(3).png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          rowUsersRecord.displayName,
                          'Ansaf Ref',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                      Flexible(
                        child: Text(
                          valueOrDefault<String>(
                            widget.review?.comment,
                            ' is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown ',
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
                      RatingBar.builder(
                        onRatingUpdate: (newValue) => safeSetState(
                            () => _model.ratingBarValue = newValue),
                        itemBuilder: (context, index) => Icon(
                          Icons.star_rounded,
                          color: FlutterFlowTheme.of(context).secondary,
                        ),
                        direction: Axis.horizontal,
                        initialRating: _model.ratingBarValue ??=
                            valueOrDefault<double>(
                          widget.review?.rating.toDouble(),
                          1.0,
                        ),
                        unratedColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        itemCount: 5,
                        itemSize: 24.0,
                        glowColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    ].divide(SizedBox(height: 10.0)),
                  ),
                ),
              ].divide(SizedBox(width: 15.0)),
            );
          },
        ),
      ),
    );
  }
}
