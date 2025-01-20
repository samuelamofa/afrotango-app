import '/flutter_flow/flutter_flow_util.dart';
import 'community_widget.dart' show CommunityWidget;
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

  List<String> category = [];
  void addToCategory(String item) => category.add(item);
  void removeFromCategory(String item) => category.remove(item);
  void removeAtIndexFromCategory(int index) => category.removeAt(index);
  void insertAtIndexInCategory(int index, String item) =>
      category.insert(index, item);
  void updateCategoryAtIndex(int index, Function(String) updateFn) =>
      category[index] = updateFn(category[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode1;
  TextEditingController? searchBarTextController1;
  String? Function(BuildContext, String?)? searchBarTextController1Validator;
  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode2;
  TextEditingController? searchBarTextController2;
  String? Function(BuildContext, String?)? searchBarTextController2Validator;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Image widget.
  List<String>? communityfilters;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchBarFocusNode1?.dispose();
    searchBarTextController1?.dispose();

    searchBarFocusNode2?.dispose();
    searchBarTextController2?.dispose();
  }
}
