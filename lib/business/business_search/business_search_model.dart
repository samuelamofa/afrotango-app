import '/backend/backend.dart';
import '/business/business_search_result/business_search_result_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'business_search_widget.dart' show BusinessSearchWidget;
import 'package:flutter/material.dart';

class BusinessSearchModel extends FlutterFlowModel<BusinessSearchWidget> {
  ///  State fields for stateful widgets in this page.

  List<BusinessRecord> simpleSearchResults = [];
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Models for businessSearchResult dynamic component.
  late FlutterFlowDynamicModels<BusinessSearchResultModel>
      businessSearchResultModels1;
  // Models for businessSearchResult dynamic component.
  late FlutterFlowDynamicModels<BusinessSearchResultModel>
      businessSearchResultModels2;

  @override
  void initState(BuildContext context) {
    businessSearchResultModels1 =
        FlutterFlowDynamicModels(() => BusinessSearchResultModel());
    businessSearchResultModels2 =
        FlutterFlowDynamicModels(() => BusinessSearchResultModel());
  }

  @override
  void dispose() {
    businessSearchResultModels1.dispose();
    businessSearchResultModels2.dispose();
  }
}
