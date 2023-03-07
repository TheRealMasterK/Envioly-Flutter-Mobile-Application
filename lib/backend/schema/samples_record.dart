import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'samples_record.g.dart';

abstract class SamplesRecord
    implements Built<SamplesRecord, SamplesRecordBuilder> {
  static Serializer<SamplesRecord> get serializer => _$samplesRecordSerializer;

  @BuiltValueField(wireName: 'smpl_timedate')
  DateTime? get smplTimedate;

  @BuiltValueField(wireName: 'smpl_type')
  String? get smplType;

  @BuiltValueField(wireName: 'smpl_volume')
  String? get smplVolume;

  @BuiltValueField(wireName: 'smpl_area')
  String? get smplArea;

  @BuiltValueField(wireName: 'smpl_name')
  String? get smplName;

  @BuiltValueField(wireName: 'smpl_desc')
  String? get smplDesc;

  @BuiltValueField(wireName: 'smpl_photo')
  String? get smplPhoto;

  @BuiltValueField(wireName: 'smpl_id')
  DocumentReference? get smplId;

  @BuiltValueField(wireName: 'smpl_created')
  DateTime? get smplCreated;

  @BuiltValueField(wireName: 'smpl_completed')
  bool? get smplCompleted;

  @BuiltValueField(wireName: 'smpl_location')
  String? get smplLocation;

  @BuiltValueField(wireName: 'smpl_status')
  String? get smplStatus;

  DocumentReference? get inspections;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SamplesRecordBuilder builder) => builder
    ..smplType = ''
    ..smplVolume = ''
    ..smplArea = ''
    ..smplName = ''
    ..smplDesc = ''
    ..smplPhoto = ''
    ..smplCompleted = false
    ..smplLocation = ''
    ..smplStatus = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Samples');

  static Stream<SamplesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SamplesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SamplesRecord._();
  factory SamplesRecord([void Function(SamplesRecordBuilder) updates]) =
      _$SamplesRecord;

  static SamplesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSamplesRecordData({
  DateTime? smplTimedate,
  String? smplType,
  String? smplVolume,
  String? smplArea,
  String? smplName,
  String? smplDesc,
  String? smplPhoto,
  DocumentReference? smplId,
  DateTime? smplCreated,
  bool? smplCompleted,
  String? smplLocation,
  String? smplStatus,
  DocumentReference? inspections,
}) {
  final firestoreData = serializers.toFirestore(
    SamplesRecord.serializer,
    SamplesRecord(
      (s) => s
        ..smplTimedate = smplTimedate
        ..smplType = smplType
        ..smplVolume = smplVolume
        ..smplArea = smplArea
        ..smplName = smplName
        ..smplDesc = smplDesc
        ..smplPhoto = smplPhoto
        ..smplId = smplId
        ..smplCreated = smplCreated
        ..smplCompleted = smplCompleted
        ..smplLocation = smplLocation
        ..smplStatus = smplStatus
        ..inspections = inspections,
    ),
  );

  return firestoreData;
}
