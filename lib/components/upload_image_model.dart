import '/flutter_flow/flutter_flow_util.dart';
import 'upload_image_widget.dart' show UploadImageWidget;
import 'package:flutter/material.dart';

class UploadImageModel extends FlutterFlowModel<UploadImageWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
