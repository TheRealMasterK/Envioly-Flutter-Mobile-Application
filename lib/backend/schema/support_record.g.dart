// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SupportRecord> _$supportRecordSerializer =
    new _$SupportRecordSerializer();

class _$SupportRecordSerializer implements StructuredSerializer<SupportRecord> {
  @override
  final Iterable<Type> types = const [SupportRecord, _$SupportRecord];
  @override
  final String wireName = 'SupportRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, SupportRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.user;
    if (value != null) {
      result
        ..add('User')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.userName;
    if (value != null) {
      result
        ..add('UserName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('Message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.time;
    if (value != null) {
      result
        ..add('Time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  SupportRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SupportRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'User':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'UserName':
          result.userName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$SupportRecord extends SupportRecord {
  @override
  final DocumentReference<Object?>? user;
  @override
  final String? userName;
  @override
  final String? message;
  @override
  final DateTime? time;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SupportRecord([void Function(SupportRecordBuilder)? updates]) =>
      (new SupportRecordBuilder()..update(updates))._build();

  _$SupportRecord._(
      {this.user, this.userName, this.message, this.time, this.ffRef})
      : super._();

  @override
  SupportRecord rebuild(void Function(SupportRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SupportRecordBuilder toBuilder() => new SupportRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SupportRecord &&
        user == other.user &&
        userName == other.userName &&
        message == other.message &&
        time == other.time &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, user.hashCode), userName.hashCode),
                message.hashCode),
            time.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SupportRecord')
          ..add('user', user)
          ..add('userName', userName)
          ..add('message', message)
          ..add('time', time)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SupportRecordBuilder
    implements Builder<SupportRecord, SupportRecordBuilder> {
  _$SupportRecord? _$v;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  String? _userName;
  String? get userName => _$this._userName;
  set userName(String? userName) => _$this._userName = userName;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  DateTime? _time;
  DateTime? get time => _$this._time;
  set time(DateTime? time) => _$this._time = time;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SupportRecordBuilder() {
    SupportRecord._initializeBuilder(this);
  }

  SupportRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user;
      _userName = $v.userName;
      _message = $v.message;
      _time = $v.time;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SupportRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SupportRecord;
  }

  @override
  void update(void Function(SupportRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SupportRecord build() => _build();

  _$SupportRecord _build() {
    final _$result = _$v ??
        new _$SupportRecord._(
            user: user,
            userName: userName,
            message: message,
            time: time,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
