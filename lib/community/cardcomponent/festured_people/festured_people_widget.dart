import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'festured_people_model.dart';
export 'festured_people_model.dart';

class FesturedPeopleWidget extends StatefulWidget {
  const FesturedPeopleWidget({super.key});

  @override
  State<FesturedPeopleWidget> createState() => _FesturedPeopleWidgetState();
}

class _FesturedPeopleWidgetState extends State<FesturedPeopleWidget> {
  late FesturedPeopleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FesturedPeopleModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          AuthUserStreamWidget(
            builder: (context) => Container(
              width: 60.0,
              height: 60.0,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                valueOrDefault<String>(
                  currentUserPhoto,
                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/afro-tango-g6fj7t/assets/bg4fitk4cbij/user_(3).png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
            child: AuthUserStreamWidget(
              builder: (context) => Text(
                valueOrDefault(currentUserDocument?.firstName, ''),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
