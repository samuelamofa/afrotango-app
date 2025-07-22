import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'createproduct_widget.dart' show CreateproductWidget;
import 'package:flutter/material.dart';

class CreateproductModel extends FlutterFlowModel<CreateproductWidget> {
  ///  Local state fields for this component.

  List<FFUploadedFile> images = [];
  void addToImages(FFUploadedFile item) => images.add(item);
  void removeFromImages(FFUploadedFile item) => images.remove(item);
  void removeAtIndexFromImages(int index) => images.removeAt(index);
  void insertAtIndexInImages(int index, FFUploadedFile item) =>
      images.insert(index, item);
  void updateImagesAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      images[index] = updateFn(images[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldNAME widget.
  FocusNode? textFieldNAMEFocusNode;
  TextEditingController? textFieldNAMETextController;
  String? Function(BuildContext, String?)? textFieldNAMETextControllerValidator;
  // State field(s) for TextFieldPRICE widget.
  FocusNode? textFieldPRICEFocusNode;
  TextEditingController? textFieldPRICETextController;
  String? Function(BuildContext, String?)?
      textFieldPRICETextControllerValidator;
  // State field(s) for TextFieldDESCR widget.
  FocusNode? textFieldDESCRFocusNode;
  TextEditingController? textFieldDESCRTextController;
  String? Function(BuildContext, String?)?
      textFieldDESCRTextControllerValidator;
  // State field(s) for ChoiceChipsCOLOR widget.
  FormFieldController<List<String>>? choiceChipsCOLORValueController;
  String? get choiceChipsCOLORValue =>
      choiceChipsCOLORValueController?.value?.firstOrNull;
  set choiceChipsCOLORValue(String? val) =>
      choiceChipsCOLORValueController?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChipsSIZE widget.
  FormFieldController<List<String>>? choiceChipsSIZEValueController;
  String? get choiceChipsSIZEValue =>
      choiceChipsSIZEValueController?.value?.firstOrNull;
  set choiceChipsSIZEValue(String? val) =>
      choiceChipsSIZEValueController?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChipsCATI widget.
  FormFieldController<List<String>>? choiceChipsCATIValueController;
  String? get choiceChipsCATIValue =>
      choiceChipsCATIValueController?.value?.firstOrNull;
  set choiceChipsCATIValue(String? val) =>
      choiceChipsCATIValueController?.value = val != null ? [val] : [];
  bool isDataUploading_uploadDataYei = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadDataYei = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldNAMEFocusNode?.dispose();
    textFieldNAMETextController?.dispose();

    textFieldPRICEFocusNode?.dispose();
    textFieldPRICETextController?.dispose();

    textFieldDESCRFocusNode?.dispose();
    textFieldDESCRTextController?.dispose();
  }
}
