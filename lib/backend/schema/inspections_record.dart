import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'inspections_record.g.dart';

abstract class InspectionsRecord
    implements Built<InspectionsRecord, InspectionsRecordBuilder> {
  static Serializer<InspectionsRecord> get serializer =>
      _$inspectionsRecordSerializer;

  @BuiltValueField(wireName: 'ins_date')
  DateTime? get insDate;

  @BuiltValueField(wireName: 'ins_propertyPhoto')
  String? get insPropertyPhoto;

  @BuiltValueField(wireName: 'ins_map')
  LatLng? get insMap;

  @BuiltValueField(wireName: 'ins_clientName')
  String? get insClientName;

  @BuiltValueField(wireName: 'ins_street')
  String? get insStreet;

  @BuiltValueField(wireName: 'ins_city')
  String? get insCity;

  @BuiltValueField(wireName: 'ins_state')
  String? get insState;

  @BuiltValueField(wireName: 'ins_zipcode')
  String? get insZipcode;

  @BuiltValueField(wireName: 'ins_phone')
  String? get insPhone;

  @BuiltValueField(wireName: 'ins_email')
  String? get insEmail;

  DocumentReference? get user;

  @BuiltValueField(wireName: 'ins_InspectorName')
  String? get insInspectorName;

  @BuiltValueField(wireName: 'ins_signature')
  String? get insSignature;

  @BuiltValueField(wireName: 'ins_pay')
  bool? get insPay;

  @BuiltValueField(wireName: 'ins_photos')
  BuiltList<String>? get insPhotos;

  @BuiltValueField(wireName: 'ins_completed')
  bool? get insCompleted;

  bool? get finish;

  @BuiltValueField(wireName: 'ins_unit')
  String? get insUnit;

  @BuiltValueField(wireName: 'ins_pdf')
  String? get insPdf;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(InspectionsRecordBuilder builder) => builder
    ..insPropertyPhoto = ''
    ..insClientName = ''
    ..insStreet = ''
    ..insCity = ''
    ..insState = ''
    ..insZipcode = ''
    ..insPhone = ''
    ..insEmail = ''
    ..insInspectorName = ''
    ..insSignature = ''
    ..insPay = false
    ..insPhotos = ListBuilder()
    ..insCompleted = false
    ..finish = false
    ..insUnit = ''
    ..insPdf = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Inspections');

  static Stream<InspectionsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<InspectionsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  InspectionsRecord._();
  factory InspectionsRecord([void Function(InspectionsRecordBuilder) updates]) =
      _$InspectionsRecord;

  static InspectionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createInspectionsRecordData({
  DateTime? insDate,
  String? insPropertyPhoto,
  LatLng? insMap,
  String? insClientName,
  String? insStreet,
  String? insCity,
  String? insState,
  String? insZipcode,
  String? insPhone,
  String? insEmail,
  DocumentReference? user,
  String? insInspectorName,
  String? insSignature,
  bool? insPay,
  bool? insCompleted,
  bool? finish,
  String? insUnit,
  String? insPdf,
}) {
  final firestoreData = serializers.toFirestore(
    InspectionsRecord.serializer,
    InspectionsRecord(
      (i) => i
        ..insDate = insDate
        ..insPropertyPhoto = insPropertyPhoto
        ..insMap = insMap
        ..insClientName = insClientName
        ..insStreet = insStreet
        ..insCity = insCity
        ..insState = insState
        ..insZipcode = insZipcode
        ..insPhone = insPhone
        ..insEmail = insEmail
        ..user = user
        ..insInspectorName = insInspectorName
        ..insSignature = insSignature
        ..insPay = insPay
        ..insPhotos = null
        ..insCompleted = insCompleted
        ..finish = finish
        ..insUnit = insUnit
        ..insPdf = insPdf,
    ),
  );

  return firestoreData;
}
