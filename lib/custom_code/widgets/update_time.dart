// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom widget code
class UpdateTime extends StatefulWidget {
  const UpdateTime({
    Key key,
    this.width,
    this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  _UpdateTimeState createState() => _UpdateTimeState();
}

class _UpdateTimeState extends State<UpdateTime> {
  @override
  Widget build(BuildContext context) {
    FFAppState().lastDate = DateTime.now();
    return Container();
  }
}
