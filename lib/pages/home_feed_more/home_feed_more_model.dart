import '/flutter_flow/flutter_flow_util.dart';
import 'home_feed_more_widget.dart' show HomeFeedMoreWidget;
import 'package:flutter/material.dart';

class HomeFeedMoreModel extends FlutterFlowModel<HomeFeedMoreWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarTextController;
  String? Function(BuildContext, String?)? searchBarTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchBarFocusNode?.dispose();
    searchBarTextController?.dispose();
  }
}
