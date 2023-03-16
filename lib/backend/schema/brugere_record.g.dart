// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brugere_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BrugereRecord> _$brugereRecordSerializer =
    new _$BrugereRecordSerializer();

class _$BrugereRecordSerializer implements StructuredSerializer<BrugereRecord> {
  @override
  final Iterable<Type> types = const [BrugereRecord, _$BrugereRecord];
  @override
  final String wireName = 'BrugereRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, BrugereRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.altNavn;
    if (value != null) {
      result
        ..add('alt_navn')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayNavn;
    if (value != null) {
      result
        ..add('display_navn')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.roomId;
    if (value != null) {
      result
        ..add('room_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.antalSoda;
    if (value != null) {
      result
        ..add('antal_soda')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.antalOl;
    if (value != null) {
      result
        ..add('antal_ol')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.antalCider;
    if (value != null) {
      result
        ..add('antal_cider')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.billede;
    if (value != null) {
      result
        ..add('BILLEDE')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.imgUrl;
    if (value != null) {
      result
        ..add('img_url')
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
  BrugereRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BrugereRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'alt_navn':
          result.altNavn = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_navn':
          result.displayNavn = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'room_id':
          result.roomId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'antal_soda':
          result.antalSoda = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'antal_ol':
          result.antalOl = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'antal_cider':
          result.antalCider = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'BILLEDE':
          result.billede = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'img_url':
          result.imgUrl = serializers.deserialize(value,
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

class _$BrugereRecord extends BrugereRecord {
  @override
  final String? altNavn;
  @override
  final String? displayNavn;
  @override
  final String? roomId;
  @override
  final int? antalSoda;
  @override
  final int? antalOl;
  @override
  final int? antalCider;
  @override
  final String? billede;
  @override
  final String? imgUrl;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$BrugereRecord([void Function(BrugereRecordBuilder)? updates]) =>
      (new BrugereRecordBuilder()..update(updates))._build();

  _$BrugereRecord._(
      {this.altNavn,
      this.displayNavn,
      this.roomId,
      this.antalSoda,
      this.antalOl,
      this.antalCider,
      this.billede,
      this.imgUrl,
      this.ffRef})
      : super._();

  @override
  BrugereRecord rebuild(void Function(BrugereRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BrugereRecordBuilder toBuilder() => new BrugereRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BrugereRecord &&
        altNavn == other.altNavn &&
        displayNavn == other.displayNavn &&
        roomId == other.roomId &&
        antalSoda == other.antalSoda &&
        antalOl == other.antalOl &&
        antalCider == other.antalCider &&
        billede == other.billede &&
        imgUrl == other.imgUrl &&
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
                                $jc($jc(0, altNavn.hashCode),
                                    displayNavn.hashCode),
                                roomId.hashCode),
                            antalSoda.hashCode),
                        antalOl.hashCode),
                    antalCider.hashCode),
                billede.hashCode),
            imgUrl.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BrugereRecord')
          ..add('altNavn', altNavn)
          ..add('displayNavn', displayNavn)
          ..add('roomId', roomId)
          ..add('antalSoda', antalSoda)
          ..add('antalOl', antalOl)
          ..add('antalCider', antalCider)
          ..add('billede', billede)
          ..add('imgUrl', imgUrl)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class BrugereRecordBuilder
    implements Builder<BrugereRecord, BrugereRecordBuilder> {
  _$BrugereRecord? _$v;

  String? _altNavn;
  String? get altNavn => _$this._altNavn;
  set altNavn(String? altNavn) => _$this._altNavn = altNavn;

  String? _displayNavn;
  String? get displayNavn => _$this._displayNavn;
  set displayNavn(String? displayNavn) => _$this._displayNavn = displayNavn;

  String? _roomId;
  String? get roomId => _$this._roomId;
  set roomId(String? roomId) => _$this._roomId = roomId;

  int? _antalSoda;
  int? get antalSoda => _$this._antalSoda;
  set antalSoda(int? antalSoda) => _$this._antalSoda = antalSoda;

  int? _antalOl;
  int? get antalOl => _$this._antalOl;
  set antalOl(int? antalOl) => _$this._antalOl = antalOl;

  int? _antalCider;
  int? get antalCider => _$this._antalCider;
  set antalCider(int? antalCider) => _$this._antalCider = antalCider;

  String? _billede;
  String? get billede => _$this._billede;
  set billede(String? billede) => _$this._billede = billede;

  String? _imgUrl;
  String? get imgUrl => _$this._imgUrl;
  set imgUrl(String? imgUrl) => _$this._imgUrl = imgUrl;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  BrugereRecordBuilder() {
    BrugereRecord._initializeBuilder(this);
  }

  BrugereRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _altNavn = $v.altNavn;
      _displayNavn = $v.displayNavn;
      _roomId = $v.roomId;
      _antalSoda = $v.antalSoda;
      _antalOl = $v.antalOl;
      _antalCider = $v.antalCider;
      _billede = $v.billede;
      _imgUrl = $v.imgUrl;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BrugereRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BrugereRecord;
  }

  @override
  void update(void Function(BrugereRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BrugereRecord build() => _build();

  _$BrugereRecord _build() {
    final _$result = _$v ??
        new _$BrugereRecord._(
            altNavn: altNavn,
            displayNavn: displayNavn,
            roomId: roomId,
            antalSoda: antalSoda,
            antalOl: antalOl,
            antalCider: antalCider,
            billede: billede,
            imgUrl: imgUrl,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
