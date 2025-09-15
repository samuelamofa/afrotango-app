import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cardnew_copy_model.dart';
export 'cardnew_copy_model.dart';

class CardnewCopyWidget extends StatefulWidget {
  const CardnewCopyWidget({
    super.key,
    required this.user,
  });

  final UsersRecord? user;

  @override
  State<CardnewCopyWidget> createState() => _CardnewCopyWidgetState();
}

class _CardnewCopyWidgetState extends State<CardnewCopyWidget> {
  late CardnewCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardnewCopyModel());
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
          ProfilesComunityWidget.routeName,
          queryParameters: {
            'user': serializeParam(
              widget.user,
              ParamType.Document,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            'user': widget.user,
          },
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.network(
                  valueOrDefault<String>(
                    widget.user?.photoUrl,
                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/afro-tango-g6fj7t/assets/bg4fitk4cbij/user_(3).png',
                  ),
                ).image,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    '${widget.user?.firstName} ${widget.user?.lastName}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          lineHeight: 1.0,
                        ),
                  ),
                  Container(
                    width: 15.0,
                    height: 15.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      valueOrDefault<String>(
                        functions.countryFlag(widget.user?.countryName),
                        'https://flagcdn.com/h80/gh.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ].divide(SizedBox(width: 5.0)),
              ),
              Text(
                valueOrDefault<String>(
                  widget.user?.bio,
                  '@bio',
                ).maybeHandleOverflow(
                  maxChars: 50,
                  replacement: '…',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.poppins(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      fontSize: 10.0,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ],
          ),
        ].divide(SizedBox(width: 10.0)),
      ),
    );
  }
}
