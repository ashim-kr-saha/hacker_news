// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ArticleState> _$articleStateSerializer =
    new _$ArticleStateSerializer();
Serializer<ArticleUIState> _$articleUIStateSerializer =
    new _$ArticleUIStateSerializer();

class _$ArticleStateSerializer implements StructuredSerializer<ArticleState> {
  @override
  final Iterable<Type> types = const [ArticleState, _$ArticleState];
  @override
  final String wireName = 'ArticleState';

  @override
  Iterable<Object> serialize(Serializers serializers, ArticleState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'map',
      serializers.serialize(object.map,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(int), const FullType(ArticleEntity)])),
      'list',
      serializers.serialize(object.list,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
    ];
    if (object.lastUpdated != null) {
      result
        ..add('lastUpdated')
        ..add(serializers.serialize(object.lastUpdated,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  ArticleState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ArticleStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'lastUpdated':
          result.lastUpdated = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'map':
          result.map.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(int),
                const FullType(ArticleEntity)
              ])) as BuiltMap<dynamic, dynamic>);
          break;
        case 'list':
          result.list.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$ArticleUIStateSerializer
    implements StructuredSerializer<ArticleUIState> {
  @override
  final Iterable<Type> types = const [ArticleUIState, _$ArticleUIState];
  @override
  final String wireName = 'ArticleUIState';

  @override
  Iterable<Object> serialize(Serializers serializers, ArticleUIState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'listUIState',
      serializers.serialize(object.listUIState,
          specifiedType: const FullType(ListUIState)),
    ];
    if (object.selected != null) {
      result
        ..add('selected')
        ..add(serializers.serialize(object.selected,
            specifiedType: const FullType(ArticleEntity)));
    }
    return result;
  }

  @override
  ArticleUIState deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ArticleUIStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'selected':
          result.selected.replace(serializers.deserialize(value,
              specifiedType: const FullType(ArticleEntity)) as ArticleEntity);
          break;
        case 'listUIState':
          result.listUIState.replace(serializers.deserialize(value,
              specifiedType: const FullType(ListUIState)) as ListUIState);
          break;
      }
    }

    return result.build();
  }
}

class _$ArticleState extends ArticleState {
  @override
  final int lastUpdated;
  @override
  final BuiltMap<int, ArticleEntity> map;
  @override
  final BuiltList<int> list;

  factory _$ArticleState([void Function(ArticleStateBuilder) updates]) =>
      (new ArticleStateBuilder()..update(updates)).build();

  _$ArticleState._({this.lastUpdated, this.map, this.list}) : super._() {
    if (map == null) {
      throw new BuiltValueNullFieldError('ArticleState', 'map');
    }
    if (list == null) {
      throw new BuiltValueNullFieldError('ArticleState', 'list');
    }
  }

  @override
  ArticleState rebuild(void Function(ArticleStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArticleStateBuilder toBuilder() => new ArticleStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ArticleState &&
        lastUpdated == other.lastUpdated &&
        map == other.map &&
        list == other.list;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, lastUpdated.hashCode), map.hashCode), list.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ArticleState')
          ..add('lastUpdated', lastUpdated)
          ..add('map', map)
          ..add('list', list))
        .toString();
  }
}

class ArticleStateBuilder
    implements Builder<ArticleState, ArticleStateBuilder> {
  _$ArticleState _$v;

  int _lastUpdated;
  int get lastUpdated => _$this._lastUpdated;
  set lastUpdated(int lastUpdated) => _$this._lastUpdated = lastUpdated;

  MapBuilder<int, ArticleEntity> _map;
  MapBuilder<int, ArticleEntity> get map =>
      _$this._map ??= new MapBuilder<int, ArticleEntity>();
  set map(MapBuilder<int, ArticleEntity> map) => _$this._map = map;

  ListBuilder<int> _list;
  ListBuilder<int> get list => _$this._list ??= new ListBuilder<int>();
  set list(ListBuilder<int> list) => _$this._list = list;

  ArticleStateBuilder();

  ArticleStateBuilder get _$this {
    if (_$v != null) {
      _lastUpdated = _$v.lastUpdated;
      _map = _$v.map?.toBuilder();
      _list = _$v.list?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ArticleState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ArticleState;
  }

  @override
  void update(void Function(ArticleStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ArticleState build() {
    _$ArticleState _$result;
    try {
      _$result = _$v ??
          new _$ArticleState._(
              lastUpdated: lastUpdated, map: map.build(), list: list.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'map';
        map.build();
        _$failedField = 'list';
        list.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ArticleState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ArticleUIState extends ArticleUIState {
  @override
  final ArticleEntity selected;
  @override
  final ListUIState listUIState;

  factory _$ArticleUIState([void Function(ArticleUIStateBuilder) updates]) =>
      (new ArticleUIStateBuilder()..update(updates)).build();

  _$ArticleUIState._({this.selected, this.listUIState}) : super._() {
    if (listUIState == null) {
      throw new BuiltValueNullFieldError('ArticleUIState', 'listUIState');
    }
  }

  @override
  ArticleUIState rebuild(void Function(ArticleUIStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArticleUIStateBuilder toBuilder() =>
      new ArticleUIStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ArticleUIState &&
        selected == other.selected &&
        listUIState == other.listUIState;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, selected.hashCode), listUIState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ArticleUIState')
          ..add('selected', selected)
          ..add('listUIState', listUIState))
        .toString();
  }
}

class ArticleUIStateBuilder
    implements Builder<ArticleUIState, ArticleUIStateBuilder> {
  _$ArticleUIState _$v;

  ArticleEntityBuilder _selected;
  ArticleEntityBuilder get selected =>
      _$this._selected ??= new ArticleEntityBuilder();
  set selected(ArticleEntityBuilder selected) => _$this._selected = selected;

  ListUIStateBuilder _listUIState;
  ListUIStateBuilder get listUIState =>
      _$this._listUIState ??= new ListUIStateBuilder();
  set listUIState(ListUIStateBuilder listUIState) =>
      _$this._listUIState = listUIState;

  ArticleUIStateBuilder();

  ArticleUIStateBuilder get _$this {
    if (_$v != null) {
      _selected = _$v.selected?.toBuilder();
      _listUIState = _$v.listUIState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ArticleUIState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ArticleUIState;
  }

  @override
  void update(void Function(ArticleUIStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ArticleUIState build() {
    _$ArticleUIState _$result;
    try {
      _$result = _$v ??
          new _$ArticleUIState._(
              selected: _selected?.build(), listUIState: listUIState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'selected';
        _selected?.build();
        _$failedField = 'listUIState';
        listUIState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ArticleUIState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
