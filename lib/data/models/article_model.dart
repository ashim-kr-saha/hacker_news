import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:articles/data/models/models.dart';

part 'article_model.g.dart';

class ArticleFields {
  // STARTER: fields - do not remove comment
  static const String title = 'title';

  static const String url = 'url';
}

abstract class ArticleEntity extends Object
    with BaseEntity
    implements Built<ArticleEntity, ArticleEntityBuilder> {
  // STARTER: properties - do not remove comment
  String get title;

  String get url;

  static int counter = 0;
  factory ArticleEntity() {
    return _$ArticleEntity._(
      id: 0,
      // STARTER: constructor - do not remove comment
      title: '',

      url: '',
    );
  }

  String get displayName {
    // STARTER: display name - do not remove comment
    return title;
  }

  int compareTo(ArticleEntity article, String sortField, bool sortAscending) {
    int response = 0;
    ArticleEntity articleA = sortAscending ? this : article;
    ArticleEntity articleB = sortAscending ? article : this;

    switch (sortField) {
      // STARTER: sort switch - do not remove comment
      case ArticleFields.title:
        response = articleA.title.compareTo(articleB.title);
        break;

      case ArticleFields.url:
        response = articleA.url.compareTo(articleB.url);
        break;
    }

    if (response == 0) {
      // STARTER: sort default - do not remove comment
      return articleA.title.compareTo(articleB.title);
    } else {
      return response;
    }
  }

  bool matchesSearch(String search) {
    if (search == null || search.isEmpty) {
      return true;
    }

    search = search.toLowerCase();

    // STARTER: search - do not remove comment
    if (title.toLowerCase().contains(search)) {
      return true;
    }

    if (url.toLowerCase().contains(search)) {
      return true;
    }

    return false;
  }

  ArticleEntity._();
  static Serializer<ArticleEntity> get serializer => _$articleEntitySerializer;
}
