import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'market_sort_filter_widget.dart' show MarketSortFilterWidget;
import 'package:flutter/material.dart';

class MarketSortFilterModel extends FlutterFlowModel<MarketSortFilterWidget> {
  ///  Local state fields for this page.

  bool filter = false;

  bool color = false;

  bool size = false;

  bool price = false;

  bool sort = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for RadioButtonsort widget.
  FormFieldController<String>? radioButtonsortValueController;
  // State field(s) for RadioButtoncolor widget.
  FormFieldController<String>? radioButtoncolorValueController;
  // State field(s) for RadioButtonsize widget.
  FormFieldController<String>? radioButtonsizeValueController;
  // State field(s) for RadioButtonprice widget.
  FormFieldController<String>? radioButtonpriceValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get radioButtonsortValue => radioButtonsortValueController?.value;
  String? get radioButtoncolorValue => radioButtoncolorValueController?.value;
  String? get radioButtonsizeValue => radioButtonsizeValueController?.value;
  String? get radioButtonpriceValue => radioButtonpriceValueController?.value;
}
