import '/community/cardcomponent/chat_card/chat_card_widget.dart';
import '/community/comunity_nav/comunity_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/resturant/card/empty/empty_widget.dart';
import '/index.dart';
import 'communitychatlist_widget.dart' show CommunitychatlistWidget;
import 'package:flutter/material.dart';

class CommunitychatlistModel extends FlutterFlowModel<CommunitychatlistWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for empty component.
  late EmptyModel emptyModel;
  // Models for chatCard dynamic component.
  late FlutterFlowDynamicModels<ChatCardModel> chatCardModels;
  // Model for comunityNav component.
  late ComunityNavModel comunityNavModel;

  @override
  void initState(BuildContext context) {
    emptyModel = createModel(context, () => EmptyModel());
    chatCardModels = FlutterFlowDynamicModels(() => ChatCardModel());
    comunityNavModel = createModel(context, () => ComunityNavModel());
  }

  @override
  void dispose() {
    emptyModel.dispose();
    chatCardModels.dispose();
    comunityNavModel.dispose();
  }
}
