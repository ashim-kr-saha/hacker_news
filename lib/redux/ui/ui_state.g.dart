// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ui_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UIState> _$uIStateSerializer = new _$UIStateSerializer();

class _$UIStateSerializer implements StructuredSerializer<UIState> {
  @override
  final Iterable<Type> types = const [UIState, _$UIState];
  @override
  final String wireName = 'UIState';

  @override
  Iterable<Object> serialize(Serializers serializers, UIState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'currentRoute',
      serializers.serialize(object.currentRoute,
          specifiedType: const FullType(String)),
      'articleUIState',
      serializers.serialize(object.articleUIState,
          specifiedType: const FullType(ArticleUIState)),
    ];

    return result;
  }

  @override
  UIState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UIStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'currentRoute':
          result.currentRoute = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'articleUIState':
          result.articleUIState.replace(serializers.deserialize(value,
              specifiedType: const FullType(ArticleUIState)) as ArticleUIState);
          break;
      }
    }

    return result.build();
  }
}

class _$UIState extends UIState {
  @override
  final String currentRoute;
  @override
  final ArticleUIState articleUIState;

  factory _$UIState([void Function(UIStateBuilder) updates]) =>
      (new UIStateBuilder()..update(updates)).build();

  _$UIState._({this.currentRoute, this.articleUIState}) : super._() {
    if (currentRoute == null) {
      throw new BuiltValueNullFieldError('UIState', 'currentRoute');
    }
    if (articleUIState == null) {
      throw new BuiltValueNullFieldError('UIState', 'articleUIState');
    }
  }

  @override
  UIState rebuild(void Function(UIStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UIStateBuilder toBuilder() => new UIStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UIState &&
        currentRoute == other.currentRoute &&
        articleUIState == other.articleUIState;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, currentRoute.hashCode), articleUIState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UIState')
          ..add('currentRoute', currentRoute)
          ..add('articleUIState', articleUIState))
        .toString();
  }
}

class UIStateBuilder implements Builder<UIState, UIStateBuilder> {
  _$UIState _$v;

  String _currentRoute;
  String get currentRoute => _$this._currentRoute;
  set currentRoute(String currentRoute) => _$this._currentRoute = currentRoute;

  ArticleUIStateBuilder _articleUIState;
  ArticleUIStateBuilder get articleUIState =>
      _$this._articleUIState ??= new ArticleUIStateBuilder();
  set articleUIState(ArticleUIStateBuilder articleUIState) =>
      _$this._articleUIState = articleUIState;

  UIStateBuilder();

  UIStateBuilder get _$this {
    if (_$v != null) {
      _currentRoute = _$v.currentRoute;
      _articleUIState = _$v.articleUIState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UIState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UIState;
  }

  @override
  void update(void Function(UIStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UIState build() {
    _$UIState _$result;
    try {
      _$result = _$v ??
          new _$UIState._(
              currentRoute: currentRoute,
              articleUIState: articleUIState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'articleUIState';
        articleUIState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UIState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
