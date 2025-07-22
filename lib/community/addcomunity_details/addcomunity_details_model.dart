import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'addcomunity_details_widget.dart' show AddcomunityDetailsWidget;
import 'package:flutter/material.dart';

class AddcomunityDetailsModel
    extends FlutterFlowModel<AddcomunityDetailsWidget> {
  ///  Local state fields for this page.

  DocumentReference? selectedcatigory;

  int? loop = 0;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in AddcomunityDetails widget.
  CatigoryCommunityRecord? catigory;
  bool isDataUploading_uploadDataIw4 = false;
  FFUploadedFile uploadedLocalFile_uploadDataIw4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadDataIw4w = false;
  FFUploadedFile uploadedLocalFile_uploadDataIw4w =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataIw4w = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'v5ge84mr' /* displayName is required */,
      );
    }

    return null;
  }

  // State field(s) for TextFielddescription widget.
  FocusNode? textFielddescriptionFocusNode;
  TextEditingController? textFielddescriptionTextController;
  String? Function(BuildContext, String?)?
      textFielddescriptionTextControllerValidator;
  String? _textFielddescriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0xz0hxv4' /* description is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textFielddescriptionTextControllerValidator =
        _textFielddescriptionTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    textFielddescriptionFocusNode?.dispose();
    textFielddescriptionTextController?.dispose();
  }
}
