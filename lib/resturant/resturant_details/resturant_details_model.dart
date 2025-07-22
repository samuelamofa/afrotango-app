import '/flutter_flow/flutter_flow_util.dart';
import '/resturant/card/cardreview/cardreview_widget.dart';
import '/index.dart';
import 'resturant_details_widget.dart' show ResturantDetailsWidget;
import 'package:flutter/material.dart';

class ResturantDetailsModel extends FlutterFlowModel<ResturantDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // Models for cardreview dynamic component.
  late FlutterFlowDynamicModels<CardreviewModel> cardreviewModels;

  @override
  void initState(BuildContext context) {
    cardreviewModels = FlutterFlowDynamicModels(() => CardreviewModel());
  }

  @override
  void dispose() {
    cardreviewModels.dispose();
  }
}
