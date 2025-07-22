// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

Future<double> convertToAlignmentX(
  BuildContext context,
  double localPositionX,
  double handleSize,
) async {
  RenderBox? renderBox = context.findRenderObject() as RenderBox?;
  if (renderBox == null) return 0;
  double dragWidgetWidth = renderBox.size.width;
  dragWidgetWidth -= handleSize;
  localPositionX -= handleSize / 2;
  double normalizedX = (localPositionX / dragWidgetWidth).clamp(0, 1);
  double alignmentX = -1 + normalizedX * 2;
  return alignmentX.clamp(-1.0, 1.0);
}
