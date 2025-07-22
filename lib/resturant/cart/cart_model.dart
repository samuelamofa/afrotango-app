import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/resturant/card/resturant_nave/resturant_nave_widget.dart';
import '/index.dart';
import 'cart_widget.dart' show CartWidget;
import 'package:flutter/material.dart';

class CartModel extends FlutterFlowModel<CartWidget> {
  ///  Local state fields for this page.

  int? loop = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in Row widget.
  OrderRecord? oder;
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
