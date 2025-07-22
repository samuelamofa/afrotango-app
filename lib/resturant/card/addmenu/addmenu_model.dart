import '/flutter_flow/flutter_flow_util.dart';
import 'addmenu_widget.dart' show AddmenuWidget;
import 'package:flutter/material.dart';

class AddmenuModel extends FlutterFlowModel<AddmenuWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading_uploadData63r = false;
  FFUploadedFile uploadedLocalFile_uploadData63r =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadData5ex = false;
  FFUploadedFile uploadedLocalFile_uploadData5ex =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData5ex = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
