// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PaymentsRecord> _$paymentsRecordSerializer =
    new _$PaymentsRecordSerializer();

class _$PaymentsRecordSerializer
    implements StructuredSerializer<PaymentsRecord> {
  @override
  final Iterable<Type> types = const [PaymentsRecord, _$PaymentsRecord];
  @override
  final String wireName = 'PaymentsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PaymentsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.amount;
    if (value != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tax;
    if (value != null) {
      result
        ..add('tax')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.vendorName;
    if (value != null) {
      result
        ..add('vendor_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.receiptImg;
    if (value != null) {
      result
        ..add('receipt_img')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.checkNumber;
    if (value != null) {
      result
        ..add('check_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.confirmCode;
    if (value != null) {
      result
        ..add('confirm_code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  PaymentsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PaymentsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tax':
          result.tax = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'vendor_name':
          result.vendorName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'receipt_img':
          result.receiptImg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'check_number':
          result.checkNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'confirm_code':
          result.confirmCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$PaymentsRecord extends PaymentsRecord {
  @override
  final String? name;
  @override
  final double? amount;
  @override
  final String? status;
  @override
  final double? tax;
  @override
  final DateTime? createdAt;
  @override
  final String? vendorName;
  @override
  final String? receiptImg;
  @override
  final String? checkNumber;
  @override
  final String? confirmCode;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PaymentsRecord([void Function(PaymentsRecordBuilder)? updates]) =>
      (new PaymentsRecordBuilder()..update(updates))._build();

  _$PaymentsRecord._(
      {this.name,
      this.amount,
      this.status,
      this.tax,
      this.createdAt,
      this.vendorName,
      this.receiptImg,
      this.checkNumber,
      this.confirmCode,
      this.ffRef})
      : super._();

  @override
  PaymentsRecord rebuild(void Function(PaymentsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaymentsRecordBuilder toBuilder() =>
      new PaymentsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaymentsRecord &&
        name == other.name &&
        amount == other.amount &&
        status == other.status &&
        tax == other.tax &&
        createdAt == other.createdAt &&
        vendorName == other.vendorName &&
        receiptImg == other.receiptImg &&
        checkNumber == other.checkNumber &&
        confirmCode == other.confirmCode &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc($jc(0, name.hashCode), amount.hashCode),
                                    status.hashCode),
                                tax.hashCode),
                            createdAt.hashCode),
                        vendorName.hashCode),
                    receiptImg.hashCode),
                checkNumber.hashCode),
            confirmCode.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaymentsRecord')
          ..add('name', name)
          ..add('amount', amount)
          ..add('status', status)
          ..add('tax', tax)
          ..add('createdAt', createdAt)
          ..add('vendorName', vendorName)
          ..add('receiptImg', receiptImg)
          ..add('checkNumber', checkNumber)
          ..add('confirmCode', confirmCode)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PaymentsRecordBuilder
    implements Builder<PaymentsRecord, PaymentsRecordBuilder> {
  _$PaymentsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  double? _tax;
  double? get tax => _$this._tax;
  set tax(double? tax) => _$this._tax = tax;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _vendorName;
  String? get vendorName => _$this._vendorName;
  set vendorName(String? vendorName) => _$this._vendorName = vendorName;

  String? _receiptImg;
  String? get receiptImg => _$this._receiptImg;
  set receiptImg(String? receiptImg) => _$this._receiptImg = receiptImg;

  String? _checkNumber;
  String? get checkNumber => _$this._checkNumber;
  set checkNumber(String? checkNumber) => _$this._checkNumber = checkNumber;

  String? _confirmCode;
  String? get confirmCode => _$this._confirmCode;
  set confirmCode(String? confirmCode) => _$this._confirmCode = confirmCode;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PaymentsRecordBuilder() {
    PaymentsRecord._initializeBuilder(this);
  }

  PaymentsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _amount = $v.amount;
      _status = $v.status;
      _tax = $v.tax;
      _createdAt = $v.createdAt;
      _vendorName = $v.vendorName;
      _receiptImg = $v.receiptImg;
      _checkNumber = $v.checkNumber;
      _confirmCode = $v.confirmCode;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaymentsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PaymentsRecord;
  }

  @override
  void update(void Function(PaymentsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaymentsRecord build() => _build();

  _$PaymentsRecord _build() {
    final _$result = _$v ??
        new _$PaymentsRecord._(
            name: name,
            amount: amount,
            status: status,
            tax: tax,
            createdAt: createdAt,
            vendorName: vendorName,
            receiptImg: receiptImg,
            checkNumber: checkNumber,
            confirmCode: confirmCode,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
