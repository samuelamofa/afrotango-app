import '/create_components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page3_widget.dart' show HomePage3Widget;
import 'package:flutter/material.dart';

class HomePage3Model extends FlutterFlowModel<HomePage3Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarTextController;
  String? Function(BuildContext, String?)? searchBarTextControllerValidator;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    searchBarFocusNode?.dispose();
    searchBarTextController?.dispose();

    navBarModel.dispose();
  }
}
