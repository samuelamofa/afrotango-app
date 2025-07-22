import '/flutter_flow/flutter_flow_util.dart';
import '/resturant/card/resturant_nave/resturant_nave_widget.dart';
import '/index.dart';
import 'notificationrestu_widget.dart' show NotificationrestuWidget;
import 'package:flutter/material.dart';

class NotificationrestuModel extends FlutterFlowModel<NotificationrestuWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for resturantNave component.
  late ResturantNaveModel resturantNaveModel;

  @override
  void initState(BuildContext context) {
    resturantNaveModel = createModel(context, () => ResturantNaveModel());
  }

  @override
  void dispose() {
    resturantNaveModel.dispose();
  }
}
