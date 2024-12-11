import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'logo_header_model.dart';
export 'logo_header_model.dart';

class LogoHeaderWidget extends StatefulWidget {
  const LogoHeaderWidget({super.key});

  @override
  State<LogoHeaderWidget> createState() => _LogoHeaderWidgetState();
}

class _LogoHeaderWidgetState extends State<LogoHeaderWidget> {
  late LogoHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogoHeaderModel());

    _model.searchBarTextController ??= TextEditingController();
    _model.searchBarFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      height: 50.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 21.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/AFRO_T_1.1.1.png',
                width: 35.0,
                height: 35.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: 200.0,
              child: TextFormField(
                controller: _model.searchBarTextController,
                focusNode: _model.searchBarFocusNode,
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  isDense: true,
                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Poppins',
                        letterSpacing: 0.0,
                      ),
                  hintText: 'Search',
                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Poppins',
                        letterSpacing: 0.0,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFE5E5E7),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(43.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(43.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(43.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(43.0),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 24.0,
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      letterSpacing: 0.0,
                    ),
                cursorColor: FlutterFlowTheme.of(context).primaryText,
                validator: _model.searchBarTextControllerValidator
                    .asValidator(context),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 24.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                Scaffold.of(context).openEndDrawer();
              },
              child: Stack(
                alignment: const AlignmentDirectional(1.9, -2.2),
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/Group_18910.png',
                      width: 34.0,
                      height: 34.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFEFFDC),
                      shape: BoxShape.circle,
                    ),
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      '9',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).secondary,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
