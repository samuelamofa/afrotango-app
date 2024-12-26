import '/flutter_flow/flutter_flow_util.dart';
import 'search_connections_comp_widget.dart' show SearchConnectionsCompWidget;
import 'package:flutter/material.dart';

class SearchConnectionsCompModel
    extends FlutterFlowModel<SearchConnectionsCompWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> userList = [];
  void addToUserList(DocumentReference item) => userList.add(item);
  void removeFromUserList(DocumentReference item) => userList.remove(item);
  void removeAtIndexFromUserList(int index) => userList.removeAt(index);
  void insertAtIndexInUserList(int index, DocumentReference item) =>
      userList.insert(index, item);
  void updateUserListAtIndex(int index, Function(DocumentReference) updateFn) =>
      userList[index] = updateFn(userList[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
