// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'samples_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SamplesRecord> _$samplesRecordSerializer =
    new _$SamplesRecordSerializer();

class _$SamplesRecordSerializer implements StructuredSerializer<SamplesRecord> {
  @override
  final Iterable<Type> types = const [SamplesRecord, _$SamplesRecord];
  @override
  final String wireName = 'SamplesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, SamplesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.smplTimedate;
    if (value != null) {
      result
        ..add('smpl_timedate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.smplType;
    if (value != null) {
      result
        ..add('smpl_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.smplVolume;
    if (value != null) {
      result
        ..add('smpl_volume')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.smplArea;
    if (value != null) {
      result
        ..add('smpl_area')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.smplName;
    if (value != null) {
      result
        ..add('smpl_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.smplDesc;
    if (value != null) {
      result
        ..add('smpl_desc')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.smplPhoto;
    if (value != null) {
      result
        ..add('smpl_photo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.smplId;
    if (value != null) {
      result
        ..add('smpl_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.smplCreated;
    if (value != null) {
      result
        ..add('smpl_created')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.smplCompleted;
    if (value != null) {
      result
        ..add('smpl_completed')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.smplLocation;
    if (value != null) {
      result
        ..add('smpl_location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.smplStatus;
    if (value != null) {
      result
        ..add('smpl_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.inspections;
    if (value != null) {
      result
        ..add('inspections')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  SamplesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SamplesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'smpl_timedate':
          result.smplTimedate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'smpl_type':
          result.smplType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'smpl_volume':
          result.smplVolume = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'smpl_area':
          result.smplArea = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'smpl_name':
          result.smplName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'smpl_desc':
          result.smplDesc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'smpl_photo':
          result.smplPhoto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'smpl_id':
          result.smplId = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'smpl_created':
          result.smplCreated = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'smpl_completed':
          result.smplCompleted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'smpl_location':
          result.smplLocation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'smpl_status':
          result.smplStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'inspections':
          result.inspections = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$SamplesRecord extends SamplesRecord {
  @override
  final DateTime? smplTimedate;
  @override
  final String? smplType;
  @override
  final String? smplVolume;
  @override
  final String? smplArea;
  @override
  final String? smplName;
  @override
  final String? smplDesc;
  @override
  final String? smplPhoto;
  @override
  final DocumentReference<Object?>? smplId;
  @override
  final DateTime? smplCreated;
  @override
  final bool? smplCompleted;
  @override
  final String? smplLocation;
  @override
  final String? smplStatus;
  @override
  final DocumentReference<Object?>? inspections;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SamplesRecord([void Function(SamplesRecordBuilder)? updates]) =>
      (new SamplesRecordBuilder()..update(updates))._build();

  _$SamplesRecord._(
      {this.smplTimedate,
      this.smplType,
      this.smplVolume,
      this.smplArea,
      this.smplName,
      this.smplDesc,
      this.smplPhoto,
      this.smplId,
      this.smplCreated,
      this.smplCompleted,
      this.smplLocation,
      this.smplStatus,
      this.inspections,
      this.ffRef})
      : super._();

  @override
  SamplesRecord rebuild(void Function(SamplesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SamplesRecordBuilder toBuilder() => new SamplesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SamplesRecord &&
        smplTimedate == other.smplTimedate &&
        smplType == other.smplType &&
        smplVolume == other.smplVolume &&
        smplArea == other.smplArea &&
        smplName == other.smplName &&
        smplDesc == other.smplDesc &&
        smplPhoto == other.smplPhoto &&
        smplId == other.smplId &&
        smplCreated == other.smplCreated &&
        smplCompleted == other.smplCompleted &&
        smplLocation == other.smplLocation &&
        smplStatus == other.smplStatus &&
        inspections == other.inspections &&
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
                                                            0,
                                                            smplTimedate
                                                                .hashCode),
                                                        smplType.hashCode),
                                                    smplVolume.hashCode),
                                                smplArea.hashCode),
                                            smplName.hashCode),
                                        smplDesc.hashCode),
                                    smplPhoto.hashCode),
                                smplId.hashCode),
                            smplCreated.hashCode),
                        smplCompleted.hashCode),
                    smplLocation.hashCode),
                smplStatus.hashCode),
            inspections.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SamplesRecord')
          ..add('smplTimedate', smplTimedate)
          ..add('smplType', smplType)
          ..add('smplVolume', smplVolume)
          ..add('smplArea', smplArea)
          ..add('smplName', smplName)
          ..add('smplDesc', smplDesc)
          ..add('smplPhoto', smplPhoto)
          ..add('smplId', smplId)
          ..add('smplCreated', smplCreated)
          ..add('smplCompleted', smplCompleted)
          ..add('smplLocation', smplLocation)
          ..add('smplStatus', smplStatus)
          ..add('inspections', inspections)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SamplesRecordBuilder
    implements Builder<SamplesRecord, SamplesRecordBuilder> {
  _$SamplesRecord? _$v;

  DateTime? _smplTimedate;
  DateTime? get smplTimedate => _$this._smplTimedate;
  set smplTimedate(DateTime? smplTimedate) =>
      _$this._smplTimedate = smplTimedate;

  String? _smplType;
  String? get smplType => _$this._smplType;
  set smplType(String? smplType) => _$this._smplType = smplType;

  String? _smplVolume;
  String? get smplVolume => _$this._smplVolume;
  set smplVolume(String? smplVolume) => _$this._smplVolume = smplVolume;

  String? _smplArea;
  String? get smplArea => _$this._smplArea;
  set smplArea(String? smplArea) => _$this._smplArea = smplArea;

  String? _smplName;
  String? get smplName => _$this._smplName;
  set smplName(String? smplName) => _$this._smplName = smplName;

  String? _smplDesc;
  String? get smplDesc => _$this._smplDesc;
  set smplDesc(String? smplDesc) => _$this._smplDesc = smplDesc;

  String? _smplPhoto;
  String? get smplPhoto => _$this._smplPhoto;
  set smplPhoto(String? smplPhoto) => _$this._smplPhoto = smplPhoto;

  DocumentReference<Object?>? _smplId;
  DocumentReference<Object?>? get smplId => _$this._smplId;
  set smplId(DocumentReference<Object?>? smplId) => _$this._smplId = smplId;

  DateTime? _smplCreated;
  DateTime? get smplCreated => _$this._smplCreated;
  set smplCreated(DateTime? smplCreated) => _$this._smplCreated = smplCreated;

  bool? _smplCompleted;
  bool? get smplCompleted => _$this._smplCompleted;
  set smplCompleted(bool? smplCompleted) =>
      _$this._smplCompleted = smplCompleted;

  String? _smplLocation;
  String? get smplLocation => _$this._smplLocation;
  set smplLocation(String? smplLocation) => _$this._smplLocation = smplLocation;

  String? _smplStatus;
  String? get smplStatus => _$this._smplStatus;
  set smplStatus(String? smplStatus) => _$this._smplStatus = smplStatus;

  DocumentReference<Object?>? _inspections;
  DocumentReference<Object?>? get inspections => _$this._inspections;
  set inspections(DocumentReference<Object?>? inspections) =>
      _$this._inspections = inspections;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SamplesRecordBuilder() {
    SamplesRecord._initializeBuilder(this);
  }

  SamplesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _smplTimedate = $v.smplTimedate;
      _smplType = $v.smplType;
      _smplVolume = $v.smplVolume;
      _smplArea = $v.smplArea;
      _smplName = $v.smplName;
      _smplDesc = $v.smplDesc;
      _smplPhoto = $v.smplPhoto;
      _smplId = $v.smplId;
      _smplCreated = $v.smplCreated;
      _smplCompleted = $v.smplCompleted;
      _smplLocation = $v.smplLocation;
      _smplStatus = $v.smplStatus;
      _inspections = $v.inspections;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SamplesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SamplesRecord;
  }

  @override
  void update(void Function(SamplesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SamplesRecord build() => _build();

  _$SamplesRecord _build() {
    final _$result = _$v ??
        new _$SamplesRecord._(
            smplTimedate: smplTimedate,
            smplType: smplType,
            smplVolume: smplVolume,
            smplArea: smplArea,
            smplName: smplName,
            smplDesc: smplDesc,
            smplPhoto: smplPhoto,
            smplId: smplId,
            smplCreated: smplCreated,
            smplCompleted: smplCompleted,
            smplLocation: smplLocation,
            smplStatus: smplStatus,
            inspections: inspections,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
