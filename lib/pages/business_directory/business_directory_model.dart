import '/flutter_flow/flutter_flow_util.dart';
import 'business_directory_widget.dart' show BusinessDirectoryWidget;
import 'package:flutter/material.dart';

class BusinessDirectoryModel extends FlutterFlowModel<BusinessDirectoryWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> business = [];
  void addToBusiness(DocumentReference item) => business.add(item);
  void removeFromBusiness(DocumentReference item) => business.remove(item);
  void removeAtIndexFromBusiness(int index) => business.removeAt(index);
  void insertAtIndexInBusiness(int index, DocumentReference item) =>
      business.insert(index, item);
  void updateBusinessAtIndex(int index, Function(DocumentReference) updateFn) =>
      business[index] = updateFn(business[index]);

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
  List<String>? filters;

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
