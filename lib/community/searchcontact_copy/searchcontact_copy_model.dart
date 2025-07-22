import '/backend/backend.dart';
import '/community/cardcomponent/cardmember2/cardmember2_widget.dart';
import '/community/cardcomponent/cardnew/cardnew_widget.dart';
import '/community/cardcomponent/cardnew_copy/cardnew_copy_widget.dart';
import '/community/comunity_nav/comunity_nav_widget.dart';
import '/components/emptylist_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'searchcontact_copy_widget.dart' show SearchcontactCopyWidget;
import 'package:flutter/material.dart';

class SearchcontactCopyModel extends FlutterFlowModel<SearchcontactCopyWidget> {
  ///  Local state fields for this page.

  String? catigory = '';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults = [];
  // Models for cardmember2 dynamic component.
  late FlutterFlowDynamicModels<Cardmember2Model> cardmember2Models;
  // Models for cardnew dynamic component.
  late FlutterFlowDynamicModels<CardnewModel> cardnewModels1;
  // Models for emptylist dynamic component.
  late FlutterFlowDynamicModels<EmptylistModel> emptylistModels1;
  // Models for cardnewCopy dynamic component.
  late FlutterFlowDynamicModels<CardnewCopyModel> cardnewCopyModels1;
  // Models for cardnewCopy dynamic component.
  late FlutterFlowDynamicModels<CardnewCopyModel> cardnewCopyModels2;
  // Models for cardnew dynamic component.
  late FlutterFlowDynamicModels<CardnewModel> cardnewModels2;
  // Models for emptylist dynamic component.
  late FlutterFlowDynamicModels<EmptylistModel> emptylistModels2;
  // Model for comunityNav component.
  late ComunityNavModel comunityNavModel;

  @override
  void initState(BuildContext context) {
    cardmember2Models = FlutterFlowDynamicModels(() => Cardmember2Model());
    cardnewModels1 = FlutterFlowDynamicModels(() => CardnewModel());
    emptylistModels1 = FlutterFlowDynamicModels(() => EmptylistModel());
    cardnewCopyModels1 = FlutterFlowDynamicModels(() => CardnewCopyModel());
    cardnewCopyModels2 = FlutterFlowDynamicModels(() => CardnewCopyModel());
    cardnewModels2 = FlutterFlowDynamicModels(() => CardnewModel());
    emptylistModels2 = FlutterFlowDynamicModels(() => EmptylistModel());
    comunityNavModel = createModel(context, () => ComunityNavModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    cardmember2Models.dispose();
    cardnewModels1.dispose();
    emptylistModels1.dispose();
    cardnewCopyModels1.dispose();
    cardnewCopyModels2.dispose();
    cardnewModels2.dispose();
    emptylistModels2.dispose();
    comunityNavModel.dispose();
  }
}
