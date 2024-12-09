import '/flutter_flow/flutter_flow_util.dart';
import 'upload_image_widget.dart' show UploadImageWidget;
import 'package:flutter/material.dart';

class UploadImageModel extends FlutterFlowModel<UploadImageWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
