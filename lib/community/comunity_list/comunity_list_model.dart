import '/backend/backend.dart';
import '/community/cardcomponent/card/card_widget.dart';
import '/community/cardcomponent/card_comunity/card_comunity_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'comunity_list_widget.dart' show ComunityListWidget;
import 'package:flutter/material.dart';

class ComunityListModel extends FlutterFlowModel<ComunityListWidget> {
  ///  Local state fields for this page.

  DocumentReference? catigory;

  bool search = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  List<CommunityRecord> simpleSearchResults1 = [];
  // Models for card dynamic component.
  late FlutterFlowDynamicModels<CardModel> cardModels;
  // Models for cardComunity dynamic component.
  late FlutterFlowDynamicModels<CardComunityModel> cardComunityModels;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  List<CommunityRecord> simpleSearchResults2 = [];

  @override
  void initState(BuildContext context) {
    cardModels = FlutterFlowDynamicModels(() => CardModel());
    cardComunityModels = FlutterFlowDynamicModels(() => CardComunityModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    cardModels.dispose();
    cardComunityModels.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
