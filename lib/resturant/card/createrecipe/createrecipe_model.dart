import '/flutter_flow/flutter_flow_util.dart';
import 'createrecipe_widget.dart' show CreaterecipeWidget;
import 'package:flutter/material.dart';

class CreaterecipeModel extends FlutterFlowModel<CreaterecipeWidget> {
  ///  Local state fields for this component.

  List<String> ingredients = [];
  void addToIngredients(String item) => ingredients.add(item);
  void removeFromIngredients(String item) => ingredients.remove(item);
  void removeAtIndexFromIngredients(int index) => ingredients.removeAt(index);
  void insertAtIndexInIngredients(int index, String item) =>
      ingredients.insert(index, item);
  void updateIngredientsAtIndex(int index, Function(String) updateFn) =>
      ingredients[index] = updateFn(ingredients[index]);

  List<String> instructions = [];
  void addToInstructions(String item) => instructions.add(item);
  void removeFromInstructions(String item) => instructions.remove(item);
  void removeAtIndexFromInstructions(int index) => instructions.removeAt(index);
  void insertAtIndexInInstructions(int index, String item) =>
      instructions.insert(index, item);
  void updateInstructionsAtIndex(int index, Function(String) updateFn) =>
      instructions[index] = updateFn(instructions[index]);

  bool addingr = false;

  bool addinstru = false;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadData6wf = false;
  FFUploadedFile uploadedLocalFile_uploadData6wf =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextFieldadd widget.
  FocusNode? textFieldaddFocusNode;
  TextEditingController? textFieldaddTextController;
  String? Function(BuildContext, String?)? textFieldaddTextControllerValidator;
  // State field(s) for TextFieladdins widget.
  FocusNode? textFieladdinsFocusNode;
  TextEditingController? textFieladdinsTextController;
  String? Function(BuildContext, String?)?
      textFieladdinsTextControllerValidator;
  bool isDataUploading_uploadData6kz = false;
  FFUploadedFile uploadedLocalFile_uploadData6kz =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData6kz = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

    textFieldaddFocusNode?.dispose();
    textFieldaddTextController?.dispose();

    textFieladdinsFocusNode?.dispose();
    textFieladdinsTextController?.dispose();
  }
}
