// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ArticleEntity> _$articleEntitySerializer =
    new _$ArticleEntitySerializer();

class _$ArticleEntitySerializer implements StructuredSerializer<ArticleEntity> {
  @override
  final Iterable<Type> types = const [ArticleEntity, _$ArticleEntity];
  @override
  final String wireName = 'ArticleEntity';

  @override
  Iterable<Object> serialize(Serializers serializers, ArticleEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  ArticleEntity deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ArticleEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ArticleEntity extends ArticleEntity {
  @override
  final String title;
  @override
  final String url;
  @override
  final int id;

  factory _$ArticleEntity([void Function(ArticleEntityBuilder) updates]) =>
      (new ArticleEntityBuilder()..update(updates)).build();

  _$ArticleEntity._({this.title, this.url, this.id}) : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('ArticleEntity', 'title');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('ArticleEntity', 'url');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('ArticleEntity', 'id');
    }
  }

  @override
  ArticleEntity rebuild(void Function(ArticleEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArticleEntityBuilder toBuilder() => new ArticleEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ArticleEntity &&
        title == other.title &&
        url == other.url &&
        id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, title.hashCode), url.hashCode), id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ArticleEntity')
          ..add('title', title)
          ..add('url', url)
          ..add('id', id))
        .toString();
  }
}

class ArticleEntityBuilder
    implements Builder<ArticleEntity, ArticleEntityBuilder> {
  _$ArticleEntity _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  ArticleEntityBuilder();

  ArticleEntityBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _url = _$v.url;
      _id = _$v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ArticleEntity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ArticleEntity;
  }

  @override
  void update(void Function(ArticleEntityBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ArticleEntity build() {
    final _$result =
        _$v ?? new _$ArticleEntity._(title: title, url: url, id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
