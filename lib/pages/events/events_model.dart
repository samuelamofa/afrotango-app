import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'events_widget.dart' show EventsWidget;
import 'package:flutter/material.dart';

class EventsModel extends FlutterFlowModel<EventsWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> eventList = [];
  void addToEventList(DocumentReference item) => eventList.add(item);
  void removeFromEventList(DocumentReference item) => eventList.remove(item);
  void removeAtIndexFromEventList(int index) => eventList.removeAt(index);
  void insertAtIndexInEventList(int index, DocumentReference item) =>
      eventList.insert(index, item);
  void updateEventListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      eventList[index] = updateFn(eventList[index]);

  List<String> category = [];
  void addToCategory(String item) => category.add(item);
  void removeFromCategory(String item) => category.remove(item);
  void removeAtIndexFromCategory(int index) => category.removeAt(index);
  void insertAtIndexInCategory(int index, String item) =>
      category.insert(index, item);
  void updateCategoryAtIndex(int index, Function(String) updateFn) =>
      category[index] = updateFn(category[index]);

  DateTime? eventdate;

  ///  State fields for stateful widgets in this page.

  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode1;
  TextEditingController? searchBarTextController1;
  String? Function(BuildContext, String?)? searchBarTextController1Validator;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode2;
  TextEditingController? searchBarTextController2;
  String? Function(BuildContext, String?)? searchBarTextController2Validator;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Image widget.
  List<String>? eventfilters;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    searchBarFocusNode1?.dispose();
    searchBarTextController1?.dispose();

    searchBarFocusNode2?.dispose();
    searchBarTextController2?.dispose();
  }
}
