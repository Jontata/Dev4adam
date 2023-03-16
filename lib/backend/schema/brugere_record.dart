import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'brugere_record.g.dart';

abstract class BrugereRecord
    implements Built<BrugereRecord, BrugereRecordBuilder> {
  static Serializer<BrugereRecord> get serializer => _$brugereRecordSerializer;

  @BuiltValueField(wireName: 'alt_navn')
  String? get altNavn;

  @BuiltValueField(wireName: 'display_navn')
  String? get displayNavn;

  @BuiltValueField(wireName: 'room_id')
  String? get roomId;

  @BuiltValueField(wireName: 'antal_soda')
  int? get antalSoda;

  @BuiltValueField(wireName: 'antal_ol')
  int? get antalOl;

  @BuiltValueField(wireName: 'antal_cider')
  int? get antalCider;

  @BuiltValueField(wireName: 'BILLEDE')
  String? get billede;

  @BuiltValueField(wireName: 'img_url')
  String? get imgUrl;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(BrugereRecordBuilder builder) => builder
    ..altNavn = ''
    ..displayNavn = ''
    ..roomId = ''
    ..antalSoda = 0
    ..antalOl = 0
    ..antalCider = 0
    ..billede = ''
    ..imgUrl = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('brugere');

  static Stream<BrugereRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<BrugereRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  BrugereRecord._();
  factory BrugereRecord([void Function(BrugereRecordBuilder) updates]) =
      _$BrugereRecord;

  static BrugereRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createBrugereRecordData({
  String? altNavn,
  String? displayNavn,
  String? roomId,
  int? antalSoda,
  int? antalOl,
  int? antalCider,
  String? billede,
  String? imgUrl,
}) {
  final firestoreData = serializers.toFirestore(
    BrugereRecord.serializer,
    BrugereRecord(
      (b) => b
        ..altNavn = altNavn
        ..displayNavn = displayNavn
        ..roomId = roomId
        ..antalSoda = antalSoda
        ..antalOl = antalOl
        ..antalCider = antalCider
        ..billede = billede
        ..imgUrl = imgUrl,
    ),
  );

  return firestoreData;
}
