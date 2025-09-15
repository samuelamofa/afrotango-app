import '/backend/backend.dart';
import '/community/cardcomunity/cardcomunity_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'community_search_result_widget.dart' show CommunitySearchResultWidget;
import 'package:flutter/material.dart';

class CommunitySearchResultModel
    extends FlutterFlowModel<CommunitySearchResultWidget> {
  ///  Local state fields for this page.

  bool? filter = false;

  List<CommunityRecord> communityFilter = [];
  void addToCommunityFilter(CommunityRecord item) => communityFilter.add(item);
  void removeFromCommunityFilter(CommunityRecord item) =>
      communityFilter.remove(item);
  void removeAtIndexFromCommunityFilter(int index) =>
      communityFilter.removeAt(index);
  void insertAtIndexInCommunityFilter(int index, CommunityRecord item) =>
      communityFilter.insert(index, item);
  void updateCommunityFilterAtIndex(
          int index, Function(CommunityRecord) updateFn) =>
      communityFilter[index] = updateFn(communityFilter[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for searchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;
  // Models for cardcomunity dynamic component.
  late FlutterFlowDynamicModels<CardcomunityModel> cardcomunityModels;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {
    cardcomunityModels = FlutterFlowDynamicModels(() => CardcomunityModel());
  }

  @override
  void dispose() {
    searchFieldFocusNode?.dispose();
    searchFieldTextController?.dispose();

    cardcomunityModels.dispose();
  }
}
