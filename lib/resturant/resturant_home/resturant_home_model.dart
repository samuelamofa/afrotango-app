import '/flutter_flow/flutter_flow_util.dart';
import '/resturant/card/cardfood/cardfood_widget.dart';
import '/resturant/card/cardfood1/cardfood1_widget.dart';
import '/resturant/card/cardfoodmenue/cardfoodmenue_widget.dart';
import '/resturant/card/cardfoodresto/cardfoodresto_widget.dart';
import '/resturant/card/resturant_nave/resturant_nave_widget.dart';
import '/index.dart';
import 'resturant_home_widget.dart' show ResturantHomeWidget;
import 'package:flutter/material.dart';

class ResturantHomeModel extends FlutterFlowModel<ResturantHomeWidget> {
  ///  Local state fields for this page.

  int? tab = 1;

  ///  State fields for stateful widgets in this page.

  // Model for cardfood component.
  late CardfoodModel cardfoodModel1;
  // Model for cardfood component.
  late CardfoodModel cardfoodModel2;
  // Models for cardfoodmenue dynamic component.
  late FlutterFlowDynamicModels<CardfoodmenueModel> cardfoodmenueModels;
  // Models for cardfood1 dynamic component.
  late FlutterFlowDynamicModels<Cardfood1Model> cardfood1Models;
  // Models for cardfoodresto dynamic component.
  late FlutterFlowDynamicModels<CardfoodrestoModel> cardfoodrestoModels;
  // Model for resturantNave component.
  late ResturantNaveModel resturantNaveModel;

  @override
  void initState(BuildContext context) {
    cardfoodModel1 = createModel(context, () => CardfoodModel());
    cardfoodModel2 = createModel(context, () => CardfoodModel());
    cardfoodmenueModels = FlutterFlowDynamicModels(() => CardfoodmenueModel());
    cardfood1Models = FlutterFlowDynamicModels(() => Cardfood1Model());
    cardfoodrestoModels = FlutterFlowDynamicModels(() => CardfoodrestoModel());
    resturantNaveModel = createModel(context, () => ResturantNaveModel());
  }

  @override
  void dispose() {
    cardfoodModel1.dispose();
    cardfoodModel2.dispose();
    cardfoodmenueModels.dispose();
    cardfood1Models.dispose();
    cardfoodrestoModels.dispose();
    resturantNaveModel.dispose();
  }
}
