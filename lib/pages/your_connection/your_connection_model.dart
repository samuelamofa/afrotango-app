import '/backend/backend.dart';
import '/create_components/logo_header/logo_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'your_connection_widget.dart' show YourConnectionWidget;
import 'package:flutter/material.dart';

class YourConnectionModel extends FlutterFlowModel<YourConnectionWidget> {
  ///  Local state fields for this page.

  String? chatIdDoc;

  List<UsersRecord> userList = [];
  void addToUserList(UsersRecord item) => userList.add(item);
  void removeFromUserList(UsersRecord item) => userList.remove(item);
  void removeAtIndexFromUserList(int index) => userList.removeAt(index);
  void insertAtIndexInUserList(int index, UsersRecord item) =>
      userList.insert(index, item);
  void updateUserListAtIndex(int index, Function(UsersRecord) updateFn) =>
      userList[index] = updateFn(userList[index]);

  ///  State fields for stateful widgets in this page.

  // Model for LogoHeader component.
  late LogoHeaderModel logoHeaderModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for myTextField widget.
  FocusNode? myTextFieldFocusNode;
  TextEditingController? myTextFieldTextController;
  String? Function(BuildContext, String?)? myTextFieldTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<UsersRecord>? connectionUsersd;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  ChatRecord? queryChatref1;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ChatRecord? newChatRef1;
  // State field(s) for allTextField widget.
  FocusNode? allTextFieldFocusNode;
  TextEditingController? allTextFieldTextController;
  String? Function(BuildContext, String?)? allTextFieldTextControllerValidator;
  List<UsersRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {
    logoHeaderModel = createModel(context, () => LogoHeaderModel());
  }

  @override
  void dispose() {
    logoHeaderModel.dispose();
    tabBarController?.dispose();
    myTextFieldFocusNode?.dispose();
    myTextFieldTextController?.dispose();

    allTextFieldFocusNode?.dispose();
    allTextFieldTextController?.dispose();
  }
}
