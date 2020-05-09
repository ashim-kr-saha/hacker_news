// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DataState> _$dataStateSerializer = new _$DataStateSerializer();

class _$DataStateSerializer implements StructuredSerializer<DataState> {
  @override
  final Iterable<Type> types = const [DataState, _$DataState];
  @override
  final String wireName = 'DataState';

  @override
  Iterable<Object> serialize(Serializers serializers, DataState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'articleState',
      serializers.serialize(object.articleState,
          specifiedType: const FullType(ArticleState)),
    ];

    return result;
  }

  @override
  DataState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DataStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'articleState':
          result.articleState.replace(serializers.deserialize(value,
              specifiedType: const FullType(ArticleState)) as ArticleState);
          break;
      }
    }

    return result.build();
  }
}

class _$DataState extends DataState {
  @override
  final ArticleState articleState;

  factory _$DataState([void Function(DataStateBuilder) updates]) =>
      (new DataStateBuilder()..update(updates)).build();

  _$DataState._({this.articleState}) : super._() {
    if (articleState == null) {
      throw new BuiltValueNullFieldError('DataState', 'articleState');
    }
  }

  @override
  DataState rebuild(void Function(DataStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DataStateBuilder toBuilder() => new DataStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DataState && articleState == other.articleState;
  }

  @override
  int get hashCode {
    return $jf($jc(0, articleState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DataState')
          ..add('articleState', articleState))
        .toString();
  }
}

class DataStateBuilder implements Builder<DataState, DataStateBuilder> {
  _$DataState _$v;

  ArticleStateBuilder _articleState;
  ArticleStateBuilder get articleState =>
      _$this._articleState ??= new ArticleStateBuilder();
  set articleState(ArticleStateBuilder articleState) =>
      _$this._articleState = articleState;

  DataStateBuilder();

  DataStateBuilder get _$this {
    if (_$v != null) {
      _articleState = _$v.articleState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DataState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DataState;
  }

  @override
  void update(void Function(DataStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DataState build() {
    _$DataState _$result;
    try {
      _$result = _$v ?? new _$DataState._(articleState: articleState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'articleState';
        articleState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DataState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
