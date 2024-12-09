import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'my_post_widget.dart' show MyPostWidget;
import 'package:flutter/material.dart';

class MyPostModel extends FlutterFlowModel<MyPostWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarTextController;
  String? Function(BuildContext, String?)? searchBarTextControllerValidator;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // State field(s) for PostTabBar widget.
  TabController? postTabBarController;
  int get postTabBarCurrentIndex =>
      postTabBarController != null ? postTabBarController!.index : 0;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    searchBarFocusNode?.dispose();
    searchBarTextController?.dispose();

    navBarModel.dispose();
    postTabBarController?.dispose();
  }
}
