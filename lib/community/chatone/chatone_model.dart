import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'chatone_widget.dart' show ChatoneWidget;
import 'package:flutter/material.dart';

class ChatoneModel extends FlutterFlowModel<ChatoneWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataAsgmy = false;
  FFUploadedFile uploadedLocalFile_uploadDataAsgmy =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
