import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'communitychat_widget.dart' show CommunitychatWidget;
import 'package:flutter/material.dart';

class CommunitychatModel extends FlutterFlowModel<CommunitychatWidget> {
  ///  Local state fields for this page.

  int? loop = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in communitychat widget.
  List<MessageRecord>? message;
  bool isDataUploading_uploadDataAsgn = false;
  FFUploadedFile uploadedLocalFile_uploadDataAsgn =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading_uploadData1co5 = false;
  FFUploadedFile uploadedLocalFile_uploadData1co5 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData1co5 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
