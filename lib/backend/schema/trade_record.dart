import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'trade_record.g.dart';

abstract class TradeRecord implements Built<TradeRecord, TradeRecordBuilder> {
  static Serializer<TradeRecord> get serializer => _$tradeRecordSerializer;

  @nullable
  DocumentReference get user;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  @nullable
  String get error;

  @nullable
  @BuiltValueField(wireName: 'review_risk')
  String get reviewRisk;

  @nullable
  @BuiltValueField(wireName: 'review_entry')
  String get reviewEntry;

  @nullable
  @BuiltValueField(wireName: 'review_scale')
  String get reviewScale;

  @nullable
  @BuiltValueField(wireName: 'review_exit')
  String get reviewExit;

  @nullable
  @BuiltValueField(wireName: 'trade_direction')
  String get tradeDirection;

  @nullable
  @BuiltValueField(wireName: 'trade_type')
  String get tradeType;

  @nullable
  String get contract;

  @nullable
  double get t1;

  @nullable
  double get t2;

  @nullable
  double get t3;

  @nullable
  double get totalGain;

  @nullable
  double get risk;

  @nullable
  double get entry;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TradeRecordBuilder builder) => builder
    ..error = ''
    ..reviewRisk = ''
    ..reviewEntry = ''
    ..reviewScale = ''
    ..reviewExit = ''
    ..tradeDirection = ''
    ..tradeType = ''
    ..contract = ''
    ..t1 = 0.0
    ..t2 = 0.0
    ..t3 = 0.0
    ..totalGain = 0.0
    ..risk = 0.0
    ..entry = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Trade');

  static Stream<TradeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TradeRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TradeRecord._();
  factory TradeRecord([void Function(TradeRecordBuilder) updates]) =
      _$TradeRecord;

  static TradeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTradeRecordData({
  DocumentReference user,
  DateTime createdAt,
  String error,
  String reviewRisk,
  String reviewEntry,
  String reviewScale,
  String reviewExit,
  String tradeDirection,
  String tradeType,
  String contract,
  double t1,
  double t2,
  double t3,
  double totalGain,
  double risk,
  double entry,
}) =>
    serializers.toFirestore(
        TradeRecord.serializer,
        TradeRecord((t) => t
          ..user = user
          ..createdAt = createdAt
          ..error = error
          ..reviewRisk = reviewRisk
          ..reviewEntry = reviewEntry
          ..reviewScale = reviewScale
          ..reviewExit = reviewExit
          ..tradeDirection = tradeDirection
          ..tradeType = tradeType
          ..contract = contract
          ..t1 = t1
          ..t2 = t2
          ..t3 = t3
          ..totalGain = totalGain
          ..risk = risk
          ..entry = entry));
