import '/backend/backend.dart';
import '/business/business_search_result/business_search_result_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'business_search_widget.dart' show BusinessSearchWidget;
import 'package:flutter/material.dart';

class BusinessSearchModel extends FlutterFlowModel<BusinessSearchWidget> {
  ///  Local state fields for this page.

  bool isfiler = false;

  List<BusinessRecord> listbusiness = [];
  void addToListbusiness(BusinessRecord item) => listbusiness.add(item);
  void removeFromListbusiness(BusinessRecord item) => listbusiness.remove(item);
  void removeAtIndexFromListbusiness(int index) => listbusiness.removeAt(index);
  void insertAtIndexInListbusiness(int index, BusinessRecord item) =>
      listbusiness.insert(index, item);
  void updateListbusinessAtIndex(
          int index, Function(BusinessRecord) updateFn) =>
      listbusiness[index] = updateFn(listbusiness[index]);

  ///  State fields for stateful widgets in this page.

  List<BusinessRecord> simpleSearchResults = [];
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for searchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;
  // Models for businessSearchResult dynamic component.
  late FlutterFlowDynamicModels<BusinessSearchResultModel>
      businessSearchResultModels;

  @override
  void initState(BuildContext context) {
    businessSearchResultModels =
        FlutterFlowDynamicModels(() => BusinessSearchResultModel());
  }

  @override
  void dispose() {
    searchFieldFocusNode?.dispose();
    searchFieldTextController?.dispose();

    businessSearchResultModels.dispose();
  }
}
