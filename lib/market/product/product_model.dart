import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'product_widget.dart' show ProductWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class ProductModel extends FlutterFlowModel<ProductWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ChatproductRecord? chatfound;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatproductRecord? chatpro;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
  }

  @override
  void dispose() {}
}
