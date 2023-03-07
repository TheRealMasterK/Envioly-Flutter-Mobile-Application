import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'config_user_record.g.dart';

abstract class ConfigUserRecord
    implements Built<ConfigUserRecord, ConfigUserRecordBuilder> {
  static Serializer<ConfigUserRecord> get serializer =>
      _$configUserRecordSerializer;

  String? get keyPublic;

  String? get keySecret;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(ConfigUserRecordBuilder builder) => builder
    ..keyPublic = ''
    ..keySecret = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('configUser')
          : FirebaseFirestore.instance.collectionGroup('configUser');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('configUser').doc();

  static Stream<ConfigUserRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ConfigUserRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ConfigUserRecord._();
  factory ConfigUserRecord([void Function(ConfigUserRecordBuilder) updates]) =
      _$ConfigUserRecord;

  static ConfigUserRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createConfigUserRecordData({
  String? keyPublic,
  String? keySecret,
}) {
  final firestoreData = serializers.toFirestore(
    ConfigUserRecord.serializer,
    ConfigUserRecord(
      (c) => c
        ..keyPublic = keyPublic
        ..keySecret = keySecret,
    ),
  );

  return firestoreData;
}
