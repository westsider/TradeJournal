import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'trade_type_record.g.dart';

abstract class TradeTypeRecord
    implements Built<TradeTypeRecord, TradeTypeRecordBuilder> {
  static Serializer<TradeTypeRecord> get serializer =>
      _$tradeTypeRecordSerializer;

  @nullable
  bool get join;

  @nullable
  bool get fade;

  @nullable
  bool get none;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TradeTypeRecordBuilder builder) => builder
    ..join = false
    ..fade = false
    ..none = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('trade_type');

  static Stream<TradeTypeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TradeTypeRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TradeTypeRecord._();
  factory TradeTypeRecord([void Function(TradeTypeRecordBuilder) updates]) =
      _$TradeTypeRecord;

  static TradeTypeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTradeTypeRecordData({
  bool join,
  bool fade,
  bool none,
}) =>
    serializers.toFirestore(
        TradeTypeRecord.serializer,
        TradeTypeRecord((t) => t
          ..join = join
          ..fade = fade
          ..none = none));
