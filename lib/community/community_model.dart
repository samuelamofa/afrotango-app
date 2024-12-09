import '/backend/backend.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'community_widget.dart' show CommunityWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class CommunityModel extends FlutterFlowModel<CommunityWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> listOfCommunities = [];
  void addToListOfCommunities(DocumentReference item) =>
      listOfCommunities.add(item);
  void removeFromListOfCommunities(DocumentReference item) =>
      listOfCommunities.remove(item);
  void removeAtIndexFromListOfCommunities(int index) =>
      listOfCommunities.removeAt(index);
  void insertAtIndexInListOfCommunities(int index, DocumentReference item) =>
      listOfCommunities.insert(index, item);
  void updateListOfCommunitiesAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      listOfCommunities[index] = updateFn(listOfCommunities[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarTextController;
  String? Function(BuildContext, String?)? searchBarTextControllerValidator;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Firestore Query - Query a collection] action in ChoiceChips widget.
  List<CommunitiesRecord>? all;
  // Stores action output result for [Firestore Query - Query a collection] action in ChoiceChips widget.
  List<CommunitiesRecord>? professionals;
  // Stores action output result for [Firestore Query - Query a collection] action in ChoiceChips widget.
  List<CommunitiesRecord>? officialGovernment;
  // Stores action output result for [Firestore Query - Query a collection] action in ChoiceChips widget.
  List<CommunitiesRecord>? commercial;
  // Stores action output result for [Firestore Query - Query a collection] action in ChoiceChips widget.
  List<CommunitiesRecord>? religion;
  // Stores action output result for [Firestore Query - Query a collection] action in ChoiceChips widget.
  List<CommunitiesRecord>? scholars;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    searchBarFocusNode?.dispose();
    searchBarTextController?.dispose();

    navBarModel.dispose();
  }
}
