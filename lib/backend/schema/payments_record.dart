import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'payments_record.g.dart';

abstract class PaymentsRecord
    implements Built<PaymentsRecord, PaymentsRecordBuilder> {
  static Serializer<PaymentsRecord> get serializer =>
      _$paymentsRecordSerializer;

  String? get name;

  double? get amount;

  String? get status;

  double? get tax;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'vendor_name')
  String? get vendorName;

  @BuiltValueField(wireName: 'receipt_img')
  String? get receiptImg;

  @BuiltValueField(wireName: 'check_number')
  String? get checkNumber;

  @BuiltValueField(wireName: 'confirm_code')
  String? get confirmCode;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(PaymentsRecordBuilder builder) => builder
    ..name = ''
    ..amount = 0.0
    ..status = ''
    ..tax = 0.0
    ..vendorName = ''
    ..receiptImg = ''
    ..checkNumber = ''
    ..confirmCode = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Payments')
          : FirebaseFirestore.instance.collectionGroup('Payments');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Payments').doc();

  static Stream<PaymentsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PaymentsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PaymentsRecord._();
  factory PaymentsRecord([void Function(PaymentsRecordBuilder) updates]) =
      _$PaymentsRecord;

  static PaymentsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPaymentsRecordData({
  String? name,
  double? amount,
  String? status,
  double? tax,
  DateTime? createdAt,
  String? vendorName,
  String? receiptImg,
  String? checkNumber,
  String? confirmCode,
}) {
  final firestoreData = serializers.toFirestore(
    PaymentsRecord.serializer,
    PaymentsRecord(
      (p) => p
        ..name = name
        ..amount = amount
        ..status = status
        ..tax = tax
        ..createdAt = createdAt
        ..vendorName = vendorName
        ..receiptImg = receiptImg
        ..checkNumber = checkNumber
        ..confirmCode = confirmCode,
    ),
  );

  return firestoreData;
}
