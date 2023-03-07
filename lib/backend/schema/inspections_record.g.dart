// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspections_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InspectionsRecord> _$inspectionsRecordSerializer =
    new _$InspectionsRecordSerializer();

class _$InspectionsRecordSerializer
    implements StructuredSerializer<InspectionsRecord> {
  @override
  final Iterable<Type> types = const [InspectionsRecord, _$InspectionsRecord];
  @override
  final String wireName = 'InspectionsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, InspectionsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.insDate;
    if (value != null) {
      result
        ..add('ins_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.insPropertyPhoto;
    if (value != null) {
      result
        ..add('ins_propertyPhoto')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.insMap;
    if (value != null) {
      result
        ..add('ins_map')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.insClientName;
    if (value != null) {
      result
        ..add('ins_clientName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.insStreet;
    if (value != null) {
      result
        ..add('ins_street')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.insCity;
    if (value != null) {
      result
        ..add('ins_city')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.insState;
    if (value != null) {
      result
        ..add('ins_state')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.insZipcode;
    if (value != null) {
      result
        ..add('ins_zipcode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.insPhone;
    if (value != null) {
      result
        ..add('ins_phone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.insEmail;
    if (value != null) {
      result
        ..add('ins_email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.insInspectorName;
    if (value != null) {
      result
        ..add('ins_InspectorName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.insSignature;
    if (value != null) {
      result
        ..add('ins_signature')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.insPay;
    if (value != null) {
      result
        ..add('ins_pay')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.insPhotos;
    if (value != null) {
      result
        ..add('ins_photos')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.insCompleted;
    if (value != null) {
      result
        ..add('ins_completed')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.finish;
    if (value != null) {
      result
        ..add('finish')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.insUnit;
    if (value != null) {
      result
        ..add('ins_unit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.insPdf;
    if (value != null) {
      result
        ..add('ins_pdf')
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
  InspectionsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InspectionsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ins_date':
          result.insDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'ins_propertyPhoto':
          result.insPropertyPhoto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ins_map':
          result.insMap = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'ins_clientName':
          result.insClientName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ins_street':
          result.insStreet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ins_city':
          result.insCity = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ins_state':
          result.insState = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ins_zipcode':
          result.insZipcode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ins_phone':
          result.insPhone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ins_email':
          result.insEmail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'ins_InspectorName':
          result.insInspectorName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ins_signature':
          result.insSignature = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ins_pay':
          result.insPay = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'ins_photos':
          result.insPhotos.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'ins_completed':
          result.insCompleted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'finish':
          result.finish = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'ins_unit':
          result.insUnit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ins_pdf':
          result.insPdf = serializers.deserialize(value,
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

class _$InspectionsRecord extends InspectionsRecord {
  @override
  final DateTime? insDate;
  @override
  final String? insPropertyPhoto;
  @override
  final LatLng? insMap;
  @override
  final String? insClientName;
  @override
  final String? insStreet;
  @override
  final String? insCity;
  @override
  final String? insState;
  @override
  final String? insZipcode;
  @override
  final String? insPhone;
  @override
  final String? insEmail;
  @override
  final DocumentReference<Object?>? user;
  @override
  final String? insInspectorName;
  @override
  final String? insSignature;
  @override
  final bool? insPay;
  @override
  final BuiltList<String>? insPhotos;
  @override
  final bool? insCompleted;
  @override
  final bool? finish;
  @override
  final String? insUnit;
  @override
  final String? insPdf;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$InspectionsRecord(
          [void Function(InspectionsRecordBuilder)? updates]) =>
      (new InspectionsRecordBuilder()..update(updates))._build();

  _$InspectionsRecord._(
      {this.insDate,
      this.insPropertyPhoto,
      this.insMap,
      this.insClientName,
      this.insStreet,
      this.insCity,
      this.insState,
      this.insZipcode,
      this.insPhone,
      this.insEmail,
      this.user,
      this.insInspectorName,
      this.insSignature,
      this.insPay,
      this.insPhotos,
      this.insCompleted,
      this.finish,
      this.insUnit,
      this.insPdf,
      this.ffRef})
      : super._();

  @override
  InspectionsRecord rebuild(void Function(InspectionsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InspectionsRecordBuilder toBuilder() =>
      new InspectionsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InspectionsRecord &&
        insDate == other.insDate &&
        insPropertyPhoto == other.insPropertyPhoto &&
        insMap == other.insMap &&
        insClientName == other.insClientName &&
        insStreet == other.insStreet &&
        insCity == other.insCity &&
        insState == other.insState &&
        insZipcode == other.insZipcode &&
        insPhone == other.insPhone &&
        insEmail == other.insEmail &&
        user == other.user &&
        insInspectorName == other.insInspectorName &&
        insSignature == other.insSignature &&
        insPay == other.insPay &&
        insPhotos == other.insPhotos &&
        insCompleted == other.insCompleted &&
        finish == other.finish &&
        insUnit == other.insUnit &&
        insPdf == other.insPdf &&
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
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc(0, insDate.hashCode),
                                                                                insPropertyPhoto.hashCode),
                                                                            insMap.hashCode),
                                                                        insClientName.hashCode),
                                                                    insStreet.hashCode),
                                                                insCity.hashCode),
                                                            insState.hashCode),
                                                        insZipcode.hashCode),
                                                    insPhone.hashCode),
                                                insEmail.hashCode),
                                            user.hashCode),
                                        insInspectorName.hashCode),
                                    insSignature.hashCode),
                                insPay.hashCode),
                            insPhotos.hashCode),
                        insCompleted.hashCode),
                    finish.hashCode),
                insUnit.hashCode),
            insPdf.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InspectionsRecord')
          ..add('insDate', insDate)
          ..add('insPropertyPhoto', insPropertyPhoto)
          ..add('insMap', insMap)
          ..add('insClientName', insClientName)
          ..add('insStreet', insStreet)
          ..add('insCity', insCity)
          ..add('insState', insState)
          ..add('insZipcode', insZipcode)
          ..add('insPhone', insPhone)
          ..add('insEmail', insEmail)
          ..add('user', user)
          ..add('insInspectorName', insInspectorName)
          ..add('insSignature', insSignature)
          ..add('insPay', insPay)
          ..add('insPhotos', insPhotos)
          ..add('insCompleted', insCompleted)
          ..add('finish', finish)
          ..add('insUnit', insUnit)
          ..add('insPdf', insPdf)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class InspectionsRecordBuilder
    implements Builder<InspectionsRecord, InspectionsRecordBuilder> {
  _$InspectionsRecord? _$v;

  DateTime? _insDate;
  DateTime? get insDate => _$this._insDate;
  set insDate(DateTime? insDate) => _$this._insDate = insDate;

  String? _insPropertyPhoto;
  String? get insPropertyPhoto => _$this._insPropertyPhoto;
  set insPropertyPhoto(String? insPropertyPhoto) =>
      _$this._insPropertyPhoto = insPropertyPhoto;

  LatLng? _insMap;
  LatLng? get insMap => _$this._insMap;
  set insMap(LatLng? insMap) => _$this._insMap = insMap;

  String? _insClientName;
  String? get insClientName => _$this._insClientName;
  set insClientName(String? insClientName) =>
      _$this._insClientName = insClientName;

  String? _insStreet;
  String? get insStreet => _$this._insStreet;
  set insStreet(String? insStreet) => _$this._insStreet = insStreet;

  String? _insCity;
  String? get insCity => _$this._insCity;
  set insCity(String? insCity) => _$this._insCity = insCity;

  String? _insState;
  String? get insState => _$this._insState;
  set insState(String? insState) => _$this._insState = insState;

  String? _insZipcode;
  String? get insZipcode => _$this._insZipcode;
  set insZipcode(String? insZipcode) => _$this._insZipcode = insZipcode;

  String? _insPhone;
  String? get insPhone => _$this._insPhone;
  set insPhone(String? insPhone) => _$this._insPhone = insPhone;

  String? _insEmail;
  String? get insEmail => _$this._insEmail;
  set insEmail(String? insEmail) => _$this._insEmail = insEmail;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  String? _insInspectorName;
  String? get insInspectorName => _$this._insInspectorName;
  set insInspectorName(String? insInspectorName) =>
      _$this._insInspectorName = insInspectorName;

  String? _insSignature;
  String? get insSignature => _$this._insSignature;
  set insSignature(String? insSignature) => _$this._insSignature = insSignature;

  bool? _insPay;
  bool? get insPay => _$this._insPay;
  set insPay(bool? insPay) => _$this._insPay = insPay;

  ListBuilder<String>? _insPhotos;
  ListBuilder<String> get insPhotos =>
      _$this._insPhotos ??= new ListBuilder<String>();
  set insPhotos(ListBuilder<String>? insPhotos) =>
      _$this._insPhotos = insPhotos;

  bool? _insCompleted;
  bool? get insCompleted => _$this._insCompleted;
  set insCompleted(bool? insCompleted) => _$this._insCompleted = insCompleted;

  bool? _finish;
  bool? get finish => _$this._finish;
  set finish(bool? finish) => _$this._finish = finish;

  String? _insUnit;
  String? get insUnit => _$this._insUnit;
  set insUnit(String? insUnit) => _$this._insUnit = insUnit;

  String? _insPdf;
  String? get insPdf => _$this._insPdf;
  set insPdf(String? insPdf) => _$this._insPdf = insPdf;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  InspectionsRecordBuilder() {
    InspectionsRecord._initializeBuilder(this);
  }

  InspectionsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _insDate = $v.insDate;
      _insPropertyPhoto = $v.insPropertyPhoto;
      _insMap = $v.insMap;
      _insClientName = $v.insClientName;
      _insStreet = $v.insStreet;
      _insCity = $v.insCity;
      _insState = $v.insState;
      _insZipcode = $v.insZipcode;
      _insPhone = $v.insPhone;
      _insEmail = $v.insEmail;
      _user = $v.user;
      _insInspectorName = $v.insInspectorName;
      _insSignature = $v.insSignature;
      _insPay = $v.insPay;
      _insPhotos = $v.insPhotos?.toBuilder();
      _insCompleted = $v.insCompleted;
      _finish = $v.finish;
      _insUnit = $v.insUnit;
      _insPdf = $v.insPdf;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InspectionsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InspectionsRecord;
  }

  @override
  void update(void Function(InspectionsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InspectionsRecord build() => _build();

  _$InspectionsRecord _build() {
    _$InspectionsRecord _$result;
    try {
      _$result = _$v ??
          new _$InspectionsRecord._(
              insDate: insDate,
              insPropertyPhoto: insPropertyPhoto,
              insMap: insMap,
              insClientName: insClientName,
              insStreet: insStreet,
              insCity: insCity,
              insState: insState,
              insZipcode: insZipcode,
              insPhone: insPhone,
              insEmail: insEmail,
              user: user,
              insInspectorName: insInspectorName,
              insSignature: insSignature,
              insPay: insPay,
              insPhotos: _insPhotos?.build(),
              insCompleted: insCompleted,
              finish: finish,
              insUnit: insUnit,
              insPdf: insPdf,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'insPhotos';
        _insPhotos?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'InspectionsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
