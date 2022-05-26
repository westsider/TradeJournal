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
  var t1Double = 0.0;
  var t2Double = 0.0;
  var t3Double = 0.0;
  t1Double = stringToDouble(t1);
  t2Double = stringToDouble(t2);
  t3Double = stringToDouble(t3);

  var sum = t1Double + t2Double + t3Double;
  if (contract == 'micro') {
    sum = sum * 5;
  } else {
    sum = sum * 50;
  }
  var currency = NumberFormat.simpleCurrency().format(sum);
  return currency;
}

String sumProfit(List<DocumentReference> tradeDocs) {
  var t1Double = 0.0;
  var t2Double = 0.0;
  var t3Double = 0.0;
  var total = 0.0;
  String t1srt = "no value;";

  FirebaseFirestore.instance
      .collection("Trade")
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      t1srt = doc["t1_str"];
      String t2srt = doc["t2_str"];
      String t3srt = doc["t3_str"];
      t1Double = stringToDouble(t1srt);
      print('coverted t1 $t1Double');
      t2Double = stringToDouble(t2srt);
      print('coverted t2 $t2Double');
      t3Double = stringToDouble(t3srt);
      print('coverted t3 $t3Double');
      double sum = t1Double + t2Double + t3Double;
      total += sum;
      print('sum: $sum, total $total');
    });
  });
  return total.toString();
}

double stringToDouble(String value) {
  double result = 0.0;
  try {
    result = double.parse(value);
    return result;
  } catch (e) {
    print(e.toString);
  }
}

double sumTrade(
  double t1,
  double t2,
  double t3,
) {
  return t1 + t2 + t3;
}
