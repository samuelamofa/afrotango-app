import '/business/business_card/business_card_widget.dart';
import '/components/emptylist_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'busineslist_widget.dart' show BusineslistWidget;
import 'package:flutter/material.dart';

class BusineslistModel extends FlutterFlowModel<BusineslistWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for businessCard dynamic component.
  late FlutterFlowDynamicModels<BusinessCardModel> businessCardModels1;
  // Models for emptylist dynamic component.
  late FlutterFlowDynamicModels<EmptylistModel> emptylistModels1;
  // Models for businessCard dynamic component.
  late FlutterFlowDynamicModels<BusinessCardModel> businessCardModels2;
  // Models for emptylist dynamic component.
  late FlutterFlowDynamicModels<EmptylistModel> emptylistModels2;
  // Models for businessCard dynamic component.
  late FlutterFlowDynamicModels<BusinessCardModel> businessCardModels3;
  // Models for emptylist dynamic component.
  late FlutterFlowDynamicModels<EmptylistModel> emptylistModels3;

  @override
  void initState(BuildContext context) {
    businessCardModels1 = FlutterFlowDynamicModels(() => BusinessCardModel());
    emptylistModels1 = FlutterFlowDynamicModels(() => EmptylistModel());
    businessCardModels2 = FlutterFlowDynamicModels(() => BusinessCardModel());
    emptylistModels2 = FlutterFlowDynamicModels(() => EmptylistModel());
    businessCardModels3 = FlutterFlowDynamicModels(() => BusinessCardModel());
    emptylistModels3 = FlutterFlowDynamicModels(() => EmptylistModel());
  }

  @override
  void dispose() {
    businessCardModels1.dispose();
    emptylistModels1.dispose();
    businessCardModels2.dispose();
    emptylistModels2.dispose();
    businessCardModels3.dispose();
    emptylistModels3.dispose();
  }
}
