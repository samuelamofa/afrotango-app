import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/voice_translator/loading/loading_widget.dart';
import 'record_widget.dart' show RecordWidget;
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class RecordModel extends FlutterFlowModel<RecordWidget> {
  ///  Local state fields for this page.

  bool record = false;

  bool returnadio = false;

  bool processing = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDowninput widget.
  String? dropDowninputValue;
  FormFieldController<String>? dropDowninputValueController;
  // State field(s) for DropDownout widget.
  String? dropDownoutValue;
  FormFieldController<String>? dropDownoutValueController;
  AudioRecorder? audioRecorder;
  String? recorded;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // Stores action output result for [Backend Call - API (translate)] action in Column widget.
  ApiCallResponse? apiResultf46;
  // Stores action output result for [Backend Call - API (GetResponse)] action in Column widget.
  ApiCallResponse? translatr;
  // Stores action output result for [Custom Action - fetchaduio] action in Column widget.
  String? audiotranscrib;
  // Model for loading component.
  late LoadingModel loadingModel;

  @override
  void initState(BuildContext context) {
    loadingModel = createModel(context, () => LoadingModel());
  }

  @override
  void dispose() {
    loadingModel.dispose();
  }
}
