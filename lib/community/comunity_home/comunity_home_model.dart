import '/community/cardcomponent/card/card_widget.dart';
import '/community/cardcomunity/cardcomunity_widget.dart';
import '/community/comunity_nav/comunity_nav_widget.dart';
import '/components/emptylist_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'comunity_home_widget.dart' show ComunityHomeWidget;
import 'package:flutter/material.dart';

class ComunityHomeModel extends FlutterFlowModel<ComunityHomeWidget> {
  ///  Local state fields for this page.

  DocumentReference? catigory;

  ///  State fields for stateful widgets in this page.

  // Models for card dynamic component.
  late FlutterFlowDynamicModels<CardModel> cardModels;
  // Models for cardcomunity dynamic component.
  late FlutterFlowDynamicModels<CardcomunityModel> cardcomunityModels1;
  // Models for emptylist dynamic component.
  late FlutterFlowDynamicModels<EmptylistModel> emptylistModels1;
  // Models for cardcomunity dynamic component.
  late FlutterFlowDynamicModels<CardcomunityModel> cardcomunityModels2;
  // Models for emptylist dynamic component.
  late FlutterFlowDynamicModels<EmptylistModel> emptylistModels2;
  // Models for cardcomunity dynamic component.
  late FlutterFlowDynamicModels<CardcomunityModel> cardcomunityModels3;
  // Models for emptylist dynamic component.
  late FlutterFlowDynamicModels<EmptylistModel> emptylistModels3;
  // Model for comunityNav component.
  late ComunityNavModel comunityNavModel;

  @override
  void initState(BuildContext context) {
    cardModels = FlutterFlowDynamicModels(() => CardModel());
    cardcomunityModels1 = FlutterFlowDynamicModels(() => CardcomunityModel());
    emptylistModels1 = FlutterFlowDynamicModels(() => EmptylistModel());
    cardcomunityModels2 = FlutterFlowDynamicModels(() => CardcomunityModel());
    emptylistModels2 = FlutterFlowDynamicModels(() => EmptylistModel());
    cardcomunityModels3 = FlutterFlowDynamicModels(() => CardcomunityModel());
    emptylistModels3 = FlutterFlowDynamicModels(() => EmptylistModel());
    comunityNavModel = createModel(context, () => ComunityNavModel());
  }

  @override
  void dispose() {
    cardModels.dispose();
    cardcomunityModels1.dispose();
    emptylistModels1.dispose();
    cardcomunityModels2.dispose();
    emptylistModels2.dispose();
    cardcomunityModels3.dispose();
    emptylistModels3.dispose();
    comunityNavModel.dispose();
  }
}
