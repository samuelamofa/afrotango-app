import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'action3_select_list_model.dart';
export 'action3_select_list_model.dart';

class Action3SelectListWidget extends StatefulWidget {
  const Action3SelectListWidget({super.key});

  @override
  State<Action3SelectListWidget> createState() =>
      _Action3SelectListWidgetState();
}

class _Action3SelectListWidgetState extends State<Action3SelectListWidget> {
  late Action3SelectListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Action3SelectListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Container(
        width: 350.0,
        height: 250.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Choose Category',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Poppins',
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
            ),
            FlutterFlowChoiceChips(
              options: const [
                ChipData('Real Estate'),
                ChipData('Restaurants'),
                ChipData('Plumbers'),
                ChipData('Hotels'),
                ChipData('Electricians'),
                ChipData('Hair Saloon')
              ],
              onChanged: (val) =>
                  safeSetState(() => _model.choiceChipsValues = val),
              selectedChipStyle: ChipStyle(
                backgroundColor: FlutterFlowTheme.of(context).secondary,
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).info,
                      letterSpacing: 0.0,
                    ),
                iconColor: FlutterFlowTheme.of(context).info,
                iconSize: 16.0,
                elevation: 0.0,
                borderRadius: BorderRadius.circular(8.0),
              ),
              unselectedChipStyle: ChipStyle(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                    ),
                iconColor: FlutterFlowTheme.of(context).secondaryText,
                iconSize: 16.0,
                elevation: 0.0,
                borderRadius: BorderRadius.circular(8.0),
              ),
              chipSpacing: 8.0,
              rowSpacing: 8.0,
              multiselect: true,
              initialized: _model.choiceChipsValues != null,
              alignment: WrapAlignment.start,
              controller: _model.choiceChipsValueController ??=
                  FormFieldController<List<String>>(
                [],
              ),
              wrapped: true,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context, _model.choiceChipsValues);
                },
                text: 'Apply',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
