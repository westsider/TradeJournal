import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String combineTargets(
  String t1,
  String t2,
  String t3,
  String contract,
) {
  var t1Double = double.parse(t1);
  var t2Double = double.parse(t2);
  var t3Double = double.parse(t3);
  var sum = t1Double + t2Double + t3Double;
  if (contract == 'micro') {
    sum = sum * 5;
  } else {
    sum = sum * 50;
  }
  var currency = NumberFormat.simpleCurrency().format(sum);
  return currency;
}
