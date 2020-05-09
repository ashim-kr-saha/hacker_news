import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:built_collection/built_collection.dart';
import 'package:articles/data/models/article_model.dart';
import 'package:articles/redux/app/app_actions.dart';

class ViewArticleList implements PersistUI {
  final BuildContext context;
  ViewArticleList(this.context);
}

class ViewArticle implements PersistUI {
  final ArticleEntity article;
  final BuildContext context;
  ViewArticle({this.article, this.context});
}

class EditArticle implements PersistUI {
  final ArticleEntity article;
  final BuildContext context;
  EditArticle({this.article, this.context});
}

class LoadArticles {
  final Completer completer;
  final bool force;

  LoadArticles([this.completer, this.force = false]);
}

class LoadArticlesRequest implements StartLoading {}

class LoadArticlesFailure implements StopLoading {
  final dynamic error;
  LoadArticlesFailure(this.error);

  @override
  String toString() {
    return 'LoadArticlesFailure{error: $error}';
  }
}

class LoadArticlesSuccess implements StopLoading, PersistData {
  final BuiltList<ArticleEntity> articles;
  LoadArticlesSuccess(this.articles);

  @override
  String toString() {
    return 'LoadArticlesSuccess{articles: $articles}';
  }
}

class UpdateArticle implements PersistUI {
  final ArticleEntity article;
  UpdateArticle(this.article);
}

class SaveArticleRequest implements StartLoading {
  final Completer completer;
  final ArticleEntity article;
  SaveArticleRequest({this.completer, this.article});
}

class AddArticleSuccess implements StopLoading, PersistData {
  final ArticleEntity article;
  AddArticleSuccess(this.article);
}

class SaveArticleSuccess implements StopLoading, PersistData {
  final ArticleEntity article;

  SaveArticleSuccess(this.article);
}

class SaveArticleFailure implements StopLoading {
  final String error;
  SaveArticleFailure(this.error);
}

class DeleteArticleRequest implements StartLoading {
  final Completer completer;
  final int articleId;

  DeleteArticleRequest(this.completer, this.articleId);
}

class DeleteArticleSuccess implements StopLoading, PersistData {
  final ArticleEntity article;
  DeleteArticleSuccess(this.article);
}

class DeleteArticleFailure implements StopLoading {
  final ArticleEntity article;
  DeleteArticleFailure(this.article);
}

class SearchArticles {
  final String search;
  SearchArticles(this.search);
}

class SortArticles implements PersistUI {
  final String field;
  SortArticles(this.field);
}
