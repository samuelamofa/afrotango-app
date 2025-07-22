import '/flutter_flow/flutter_flow_util.dart';
import '/resturant/card/resturant_nave/resturant_nave_widget.dart';
import '/index.dart';
import 'profilefor_resturant_widget.dart' show ProfileforResturantWidget;
import 'package:flutter/material.dart';

class ProfileforResturantModel
    extends FlutterFlowModel<ProfileforResturantWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for resturantNave component.
  late ResturantNaveModel resturantNaveModel;

  @override
  void initState(BuildContext context) {
    resturantNaveModel = createModel(context, () => ResturantNaveModel());
  }

  @override
  void dispose() {
    resturantNaveModel.dispose();
  }
}
