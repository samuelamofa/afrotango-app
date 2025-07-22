import '/community/cardcomponent/card/card_widget.dart';
import '/community/cardcomponent/chat_card/chat_card_widget.dart';
import '/community/cardcomunity/cardcomunity_widget.dart';
import '/community/comunity_nav/comunity_nav_widget.dart';
import '/components/emptylist_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/resturant/card/empty/empty_widget.dart';
import '/index.dart';
import 'comunity_home_copy_widget.dart' show ComunityHomeCopyWidget;
import 'package:flutter/material.dart';

class ComunityHomeCopyModel extends FlutterFlowModel<ComunityHomeCopyWidget> {
  ///  Local state fields for this page.

  DocumentReference? catigory;

  ///  State fields for stateful widgets in this page.

  // Models for card dynamic component.
  late FlutterFlowDynamicModels<CardModel> cardModels;
  // Models for cardcomunity dynamic component.
  late FlutterFlowDynamicModels<CardcomunityModel> cardcomunityModels;
  // Models for emptylist dynamic component.
  late FlutterFlowDynamicModels<EmptylistModel> emptylistModels1;
  // Model for empty component.
  late EmptyModel emptyModel;
  // Models for chatCard dynamic component.
  late FlutterFlowDynamicModels<ChatCardModel> chatCardModels;
  // Models for emptylist dynamic component.
  late FlutterFlowDynamicModels<EmptylistModel> emptylistModels2;
  // Model for comunityNav component.
  late ComunityNavModel comunityNavModel;

  @override
  void initState(BuildContext context) {
    cardModels = FlutterFlowDynamicModels(() => CardModel());
    cardcomunityModels = FlutterFlowDynamicModels(() => CardcomunityModel());
    emptylistModels1 = FlutterFlowDynamicModels(() => EmptylistModel());
    emptyModel = createModel(context, () => EmptyModel());
    chatCardModels = FlutterFlowDynamicModels(() => ChatCardModel());
    emptylistModels2 = FlutterFlowDynamicModels(() => EmptylistModel());
    comunityNavModel = createModel(context, () => ComunityNavModel());
  }

  @override
  void dispose() {
    cardModels.dispose();
    cardcomunityModels.dispose();
    emptylistModels1.dispose();
    emptyModel.dispose();
    chatCardModels.dispose();
    emptylistModels2.dispose();
    comunityNavModel.dispose();
  }
}
