import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_result_widget.dart' show SearchResultWidget;
import 'package:flutter/material.dart';

class SearchResultModel extends FlutterFlowModel<SearchResultWidget> {
  ///  Local state fields for this page.

  String? searchText;

  List<DocumentReference> userList = [];
  void addToUserList(DocumentReference item) => userList.add(item);
  void removeFromUserList(DocumentReference item) => userList.remove(item);
  void removeAtIndexFromUserList(int index) => userList.removeAt(index);
  void insertAtIndexInUserList(int index, DocumentReference item) =>
      userList.insert(index, item);
  void updateUserListAtIndex(int index, Function(DocumentReference) updateFn) =>
      userList[index] = updateFn(userList[index]);

  List<DocumentReference> communityList = [];
  void addToCommunityList(DocumentReference item) => communityList.add(item);
  void removeFromCommunityList(DocumentReference item) =>
      communityList.remove(item);
  void removeAtIndexFromCommunityList(int index) =>
      communityList.removeAt(index);
  void insertAtIndexInCommunityList(int index, DocumentReference item) =>
      communityList.insert(index, item);
  void updateCommunityListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      communityList[index] = updateFn(communityList[index]);

  List<DocumentReference> eventList = [];
  void addToEventList(DocumentReference item) => eventList.add(item);
  void removeFromEventList(DocumentReference item) => eventList.remove(item);
  void removeAtIndexFromEventList(int index) => eventList.removeAt(index);
  void insertAtIndexInEventList(int index, DocumentReference item) =>
      eventList.insert(index, item);
  void updateEventListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      eventList[index] = updateFn(eventList[index]);

  List<DocumentReference> businessList = [];
  void addToBusinessList(DocumentReference item) => businessList.add(item);
  void removeFromBusinessList(DocumentReference item) =>
      businessList.remove(item);
  void removeAtIndexFromBusinessList(int index) => businessList.removeAt(index);
  void insertAtIndexInBusinessList(int index, DocumentReference item) =>
      businessList.insert(index, item);
  void updateBusinessListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      businessList[index] = updateFn(businessList[index]);

  List<DocumentReference> adsList = [];
  void addToAdsList(DocumentReference item) => adsList.add(item);
  void removeFromAdsList(DocumentReference item) => adsList.remove(item);
  void removeAtIndexFromAdsList(int index) => adsList.removeAt(index);
  void insertAtIndexInAdsList(int index, DocumentReference item) =>
      adsList.insert(index, item);
  void updateAdsListAtIndex(int index, Function(DocumentReference) updateFn) =>
      adsList[index] = updateFn(adsList[index]);

  ///  State fields for stateful widgets in this page.

  List<UsersRecord> simpleSearchResults1 = [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults2 = [];
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  List<UsersRecord> simpleSearchResults3 = [];
  List<CommunitiesRecord> simpleSearchResults4 = [];
  List<BusinessRecord> simpleSearchResults5 = [];
  List<EventRecord> simpleSearchResults6 = [];
  List<AdsRecord> simpleSearchResults7 = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tabBarController?.dispose();
  }
}
