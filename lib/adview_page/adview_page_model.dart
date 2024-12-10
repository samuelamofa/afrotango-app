import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'adview_page_widget.dart' show AdviewPageWidget;
import 'package:flutter/material.dart';

class AdviewPageModel extends FlutterFlowModel<AdviewPageWidget> {
  ///  Local state fields for this page.

  String? chatIdDoc;

  ///  State fields for stateful widgets in this page.

  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarTextController;
  String? Function(BuildContext, String?)? searchBarTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ChatRecord? queryChatref;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatRecord? newChatRef;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchBarFocusNode?.dispose();
    searchBarTextController?.dispose();
  }
}
