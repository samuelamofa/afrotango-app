import '/backend/backend.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'business_directory_widget.dart' show BusinessDirectoryWidget;
import 'package:collection/collection.dart';
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
  List<BusinessRecord>? all;
  // Stores action output result for [Firestore Query - Query a collection] action in ChoiceChips widget.
  List<BusinessRecord>? realEstate;
  // Stores action output result for [Firestore Query - Query a collection] action in ChoiceChips widget.
  List<BusinessRecord>? automotive;
  // Stores action output result for [Firestore Query - Query a collection] action in ChoiceChips widget.
  List<BusinessRecord>? businessSupport;
  // Stores action output result for [Firestore Query - Query a collection] action in ChoiceChips widget.
  List<BusinessRecord>? computersandElectronics;
  // Stores action output result for [Firestore Query - Query a collection] action in ChoiceChips widget.
  List<BusinessRecord>? constructionandContractors;
  // Stores action output result for [Firestore Query - Query a collection] action in ChoiceChips widget.
  List<BusinessRecord>? education;
  // Stores action output result for [Firestore Query - Query a collection] action in ChoiceChips widget.
  List<BusinessRecord>? entertainment;
  // Stores action output result for [Firestore Query - Query a collection] action in ChoiceChips widget.
  List<BusinessRecord>? foodDinning;
  // Stores action output result for [Firestore Query - Query a collection] action in ChoiceChips widget.
  List<BusinessRecord>? healthandMedicine;
  // Stores action output result for [Firestore Query - Query a collection] action in ChoiceChips widget.
  List<BusinessRecord>? homeGarden;
  // Stores action output result for [Firestore Query - Query a collection] action in ChoiceChips widget.
  List<BusinessRecord>? legalFinance;
  // Stores action output result for [Firestore Query - Query a collection] action in ChoiceChips widget.
  List<BusinessRecord>? merchantRetail;
  // Stores action output result for [Firestore Query - Query a collection] action in ChoiceChips widget.
  List<BusinessRecord>? miscellaneous;
  // Stores action output result for [Firestore Query - Query a collection] action in ChoiceChips widget.
  List<BusinessRecord>? personalCareServices;

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
