import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'event_filter_copy_widget.dart' show EventFilterCopyWidget;
import 'package:flutter/material.dart';

class EventFilterCopyModel extends FlutterFlowModel<EventFilterCopyWidget> {
  ///  Local state fields for this component.

  String? category;

  String? country;

  DateTime? intialdate;

  String? name;

  List<EventRecord> event = [];
  void addToEvent(EventRecord item) => event.add(item);
  void removeFromEvent(EventRecord item) => event.remove(item);
  void removeAtIndexFromEvent(int index) => event.removeAt(index);
  void insertAtIndexInEvent(int index, EventRecord item) =>
      event.insert(index, item);
  void updateEventAtIndex(int index, Function(EventRecord) updateFn) =>
      event[index] = updateFn(event[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for countryDropDown widget.
  String? countryDropDownValue;
  FormFieldController<String>? countryDropDownValueController;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
