import '/backend/backend.dart';
import '/community/cardcomponent/cardmember2/cardmember2_widget.dart';
import '/community/cardcomponent/cardnew/cardnew_widget.dart';
import '/community/comunity_nav/comunity_nav_widget.dart';
import '/components/emptylist_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'searchcontact_widget.dart' show SearchcontactWidget;
import 'package:flutter/material.dart';

class SearchcontactModel extends FlutterFlowModel<SearchcontactWidget> {
  ///  Local state fields for this page.

  String? catigory = '';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults = [];
  // Models for cardmember2 dynamic component.
  late FlutterFlowDynamicModels<Cardmember2Model> cardmember2Models1;
  // Models for cardmember2 dynamic component.
  late FlutterFlowDynamicModels<Cardmember2Model> cardmember2Models2;
  // Models for cardnew dynamic component.
  late FlutterFlowDynamicModels<CardnewModel> cardnewModels1;
  // Models for cardnew dynamic component.
  late FlutterFlowDynamicModels<CardnewModel> cardnewModels2;
  // Models for cardnew dynamic component.
  late FlutterFlowDynamicModels<CardnewModel> cardnewModels3;
  // Models for cardnew dynamic component.
  late FlutterFlowDynamicModels<CardnewModel> cardnewModels4;
  // Models for cardnew dynamic component.
  late FlutterFlowDynamicModels<CardnewModel> cardnewModels5;
  // Models for emptylist dynamic component.
  late FlutterFlowDynamicModels<EmptylistModel> emptylistModels;
  // Model for comunityNav component.
  late ComunityNavModel comunityNavModel;

  @override
  void initState(BuildContext context) {
    cardmember2Models1 = FlutterFlowDynamicModels(() => Cardmember2Model());
    cardmember2Models2 = FlutterFlowDynamicModels(() => Cardmember2Model());
    cardnewModels1 = FlutterFlowDynamicModels(() => CardnewModel());
    cardnewModels2 = FlutterFlowDynamicModels(() => CardnewModel());
    cardnewModels3 = FlutterFlowDynamicModels(() => CardnewModel());
    cardnewModels4 = FlutterFlowDynamicModels(() => CardnewModel());
    cardnewModels5 = FlutterFlowDynamicModels(() => CardnewModel());
    emptylistModels = FlutterFlowDynamicModels(() => EmptylistModel());
    comunityNavModel = createModel(context, () => ComunityNavModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    cardmember2Models1.dispose();
    cardmember2Models2.dispose();
    cardnewModels1.dispose();
    cardnewModels2.dispose();
    cardnewModels3.dispose();
    cardnewModels4.dispose();
    cardnewModels5.dispose();
    emptylistModels.dispose();
    comunityNavModel.dispose();
  }
}
