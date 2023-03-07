import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'support_record.g.dart';

abstract class SupportRecord
    implements Built<SupportRecord, SupportRecordBuilder> {
  static Serializer<SupportRecord> get serializer => _$supportRecordSerializer;

  @BuiltValueField(wireName: 'User')
  DocumentReference? get user;

  @BuiltValueField(wireName: 'UserName')
  String? get userName;

  @BuiltValueField(wireName: 'Message')
  String? get message;

  @BuiltValueField(wireName: 'Time')
  DateTime? get time;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SupportRecordBuilder builder) => builder
    ..userName = ''
    ..message = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Support');

  static Stream<SupportRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SupportRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SupportRecord._();
  factory SupportRecord([void Function(SupportRecordBuilder) updates]) =
      _$SupportRecord;

  static SupportRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSupportRecordData({
  DocumentReference? user,
  String? userName,
  String? message,
  DateTime? time,
}) {
  final firestoreData = serializers.toFirestore(
    SupportRecord.serializer,
    SupportRecord(
      (s) => s
        ..user = user
        ..userName = userName
        ..message = message
        ..time = time,
    ),
  );

  return firestoreData;
}
