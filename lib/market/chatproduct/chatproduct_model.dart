import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/market/card/cardmarket/cardmarket_widget.dart';
import 'chatproduct_widget.dart' show ChatproductWidget;
import 'package:flutter/material.dart';

class ChatproductModel extends FlutterFlowModel<ChatproductWidget> {
  ///  Local state fields for this page.

  int? loop = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in chatproduct widget.
  List<MessageproductRecord>? messages;
  // Model for cardmarket component.
  late CardmarketModel cardmarketModel;
  bool isDataUploading_uploadDataAsg = false;
  FFUploadedFile uploadedLocalFile_uploadDataAsg =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading_uploadData1co57 = false;
  FFUploadedFile uploadedLocalFile_uploadData1co57 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData1co57 = '';

  @override
  void initState(BuildContext context) {
    cardmarketModel = createModel(context, () => CardmarketModel());
  }

  @override
  void dispose() {
    cardmarketModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
