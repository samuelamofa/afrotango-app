import '/flutter_flow/flutter_flow_util.dart';
import 'messaging_widget.dart' show MessagingWidget;
import 'package:flutter/material.dart';

class MessagingModel extends FlutterFlowModel<MessagingWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Columnscroll widget.
  ScrollController? columnscroll;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    columnscroll = ScrollController();
  }

  @override
  void dispose() {
    columnscroll?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
