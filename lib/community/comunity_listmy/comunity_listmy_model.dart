import '/backend/backend.dart';
import '/community/cardcomponent/card/card_widget.dart';
import '/community/cardcomponent/card_comunity/card_comunity_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'comunity_listmy_widget.dart' show ComunityListmyWidget;
import 'package:flutter/material.dart';

class ComunityListmyModel extends FlutterFlowModel<ComunityListmyWidget> {
  ///  Local state fields for this page.

  DocumentReference? catigory;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in comunityListmy widget.
  CatigoryCommunityRecord? catigor;
  // Models for card dynamic component.
  late FlutterFlowDynamicModels<CardModel> cardModels;
  // Models for cardComunity dynamic component.
  late FlutterFlowDynamicModels<CardComunityModel> cardComunityModels;

  @override
  void initState(BuildContext context) {
    cardModels = FlutterFlowDynamicModels(() => CardModel());
    cardComunityModels = FlutterFlowDynamicModels(() => CardComunityModel());
  }

  @override
  void dispose() {
    cardModels.dispose();
    cardComunityModels.dispose();
  }
}
