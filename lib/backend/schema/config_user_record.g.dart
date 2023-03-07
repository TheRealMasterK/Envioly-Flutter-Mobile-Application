// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_user_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ConfigUserRecord> _$configUserRecordSerializer =
    new _$ConfigUserRecordSerializer();

class _$ConfigUserRecordSerializer
    implements StructuredSerializer<ConfigUserRecord> {
  @override
  final Iterable<Type> types = const [ConfigUserRecord, _$ConfigUserRecord];
  @override
  final String wireName = 'ConfigUserRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ConfigUserRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.keyPublic;
    if (value != null) {
      result
        ..add('keyPublic')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.keySecret;
    if (value != null) {
      result
        ..add('keySecret')
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
  ConfigUserRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConfigUserRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'keyPublic':
          result.keyPublic = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'keySecret':
          result.keySecret = serializers.deserialize(value,
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

class _$ConfigUserRecord extends ConfigUserRecord {
  @override
  final String? keyPublic;
  @override
  final String? keySecret;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ConfigUserRecord(
          [void Function(ConfigUserRecordBuilder)? updates]) =>
      (new ConfigUserRecordBuilder()..update(updates))._build();

  _$ConfigUserRecord._({this.keyPublic, this.keySecret, this.ffRef})
      : super._();

  @override
  ConfigUserRecord rebuild(void Function(ConfigUserRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfigUserRecordBuilder toBuilder() =>
      new ConfigUserRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfigUserRecord &&
        keyPublic == other.keyPublic &&
        keySecret == other.keySecret &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, keyPublic.hashCode), keySecret.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConfigUserRecord')
          ..add('keyPublic', keyPublic)
          ..add('keySecret', keySecret)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ConfigUserRecordBuilder
    implements Builder<ConfigUserRecord, ConfigUserRecordBuilder> {
  _$ConfigUserRecord? _$v;

  String? _keyPublic;
  String? get keyPublic => _$this._keyPublic;
  set keyPublic(String? keyPublic) => _$this._keyPublic = keyPublic;

  String? _keySecret;
  String? get keySecret => _$this._keySecret;
  set keySecret(String? keySecret) => _$this._keySecret = keySecret;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ConfigUserRecordBuilder() {
    ConfigUserRecord._initializeBuilder(this);
  }

  ConfigUserRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _keyPublic = $v.keyPublic;
      _keySecret = $v.keySecret;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConfigUserRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConfigUserRecord;
  }

  @override
  void update(void Function(ConfigUserRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConfigUserRecord build() => _build();

  _$ConfigUserRecord _build() {
    final _$result = _$v ??
        new _$ConfigUserRecord._(
            keyPublic: keyPublic, keySecret: keySecret, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
