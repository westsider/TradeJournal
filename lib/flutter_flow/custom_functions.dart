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

int getRunningTotal(
  List<TradeRecord> data,
  int index,
) {
  var maxIndex = index;
  if (maxIndex == -1 || index >= data.length) {
    // Pass index of -1 if you want a grand total across all indexes
    maxIndex = data.length - 1;
  }

  var total = 0.0;
  for (var i = 0; i <= maxIndex; i++) {
    total += data[i].totalGain;
  }

  return total.toInt();
}

String getWinPct(
  List<TradeRecord> data,
  int index,
) {
  var maxIndex = index;
  if (maxIndex == -1 || index >= data.length) {
    // Pass index of -1 if you want a grand total across all indexes
    maxIndex = data.length - 1;
  }
  var winCount = 0.0;
  for (var i = 0; i <= maxIndex; i++) {
    if (data[i].totalGain > 0.0) {
      winCount += 1.0;
    }
  }
  double decimalWIns = (winCount / data.length) * 100.0;
  String winPct = decimalWIns.toStringAsFixed(2);
  return '$winPct %';
}

double largestWinner(
  List<TradeRecord> data,
  int index,
) {
  var maxIndex = index;
  if (maxIndex == -1 || index >= data.length) {
    // Pass index of -1 if you want a grand total across all indexes
    maxIndex = data.length - 1;
  }
  double largestWinner = 0.0;
  for (var i = 0; i <= maxIndex; i++) {
    double thisGain = data[i].totalGain;
    if (thisGain > largestWinner) {
      largestWinner = thisGain;
    }
    print('index $maxIndex, gain: $thisGain, largest winner: $largestWinner');
  }
  return largestWinner;
}

double largestLooser(
  List<TradeRecord> data,
  int index,
) {
  var maxIndex = index;
  if (maxIndex == -1 || index >= data.length) {
    // Pass index of -1 if you want a grand total across all indexes
    maxIndex = data.length - 1;
  }
  double largestLoser = 0.0;
  for (var i = 0; i <= maxIndex; i++) {
    double thisGain = data[i].totalGain;
    if (thisGain < largestLoser) {
      largestLoser = thisGain;
    }
    print('index $maxIndex, gain: $thisGain, largest winner: $largestLoser');
  }
  return largestLoser;
}
