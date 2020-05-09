import 'package:redux/redux.dart';
import 'package:articles/data/models/article_model.dart';
import 'package:articles/redux/ui/entity_ui_state.dart';
import 'package:articles/redux/ui/list_ui_state.dart';
import 'package:articles/redux/article/article_actions.dart';
import 'package:articles/redux/article/article_state.dart';

EntityUIState articleUIReducer(ArticleUIState state, action) {
  return state.rebuild((b) => b
    ..listUIState.replace(articleListReducer(state.listUIState, action))
    ..selected.replace(editingReducer(state.selected, action)));
}

final editingReducer = combineReducers<ArticleEntity>([
  TypedReducer<ArticleEntity, SaveArticleSuccess>(_updateEditing),
  TypedReducer<ArticleEntity, AddArticleSuccess>(_updateEditing),
  TypedReducer<ArticleEntity, ViewArticle>(_updateEditing),
  TypedReducer<ArticleEntity, EditArticle>(_updateEditing),
  TypedReducer<ArticleEntity, UpdateArticle>(_updateEditing),
]);

/*
ArticleEntity  _clearEditing(ArticleEntity article, action) {
  return ArticleEntity();
}
*/

ArticleEntity _updateEditing(ArticleEntity article, action) {
  return action.article;
}

final articleListReducer = combineReducers<ListUIState>([
  TypedReducer<ListUIState, SortArticles>(_sortArticles),
  TypedReducer<ListUIState, SearchArticles>(_searchArticles),
]);

ListUIState _searchArticles(
    ListUIState articleListState, SearchArticles action) {
  return articleListState.rebuild((b) => b..search = action.search);
}

ListUIState _sortArticles(ListUIState articleListState, SortArticles action) {
  return articleListState.rebuild((b) => b
    ..sortAscending = b.sortField != action.field || !b.sortAscending
    ..sortField = action.field);
}

final articlesReducer = combineReducers<ArticleState>([
  TypedReducer<ArticleState, SaveArticleSuccess>(_updateArticle),
  TypedReducer<ArticleState, AddArticleSuccess>(_addArticle),
  TypedReducer<ArticleState, LoadArticlesSuccess>(_setLoadedArticles),
  TypedReducer<ArticleState, LoadArticlesFailure>(_setNoArticles),
  TypedReducer<ArticleState, DeleteArticleRequest>(_deleteArticleRequest),
  TypedReducer<ArticleState, DeleteArticleSuccess>(_deleteArticleSuccess),
  TypedReducer<ArticleState, DeleteArticleFailure>(_deleteArticleFailure),
]);

ArticleState _deleteArticleRequest(
    ArticleState articleState, DeleteArticleRequest action) {
  var article = articleState.map[action.articleId].rebuild((b) => b);

  return articleState.rebuild((b) => b..map[action.articleId] = article);
}

ArticleState _deleteArticleSuccess(
    ArticleState articleState, DeleteArticleSuccess action) {
  return articleState
      .rebuild((b) => b..map[action.article.id] = action.article);
}

ArticleState _deleteArticleFailure(
    ArticleState articleState, DeleteArticleFailure action) {
  return articleState
      .rebuild((b) => b..map[action.article.id] = action.article);
}

ArticleState _addArticle(ArticleState articleState, AddArticleSuccess action) {
  return articleState.rebuild((b) => b
    ..map[action.article.id] = action.article
    ..list.add(action.article.id));
}

ArticleState _updateArticle(
    ArticleState articleState, SaveArticleSuccess action) {
  return articleState
      .rebuild((b) => b..map[action.article.id] = action.article);
}

ArticleState _setNoArticles(
    ArticleState articleState, LoadArticlesFailure action) {
  return articleState;
}

ArticleState _setLoadedArticles(
    ArticleState articleState, LoadArticlesSuccess action) {
  return articleState.rebuild((b) => b
    ..lastUpdated = DateTime.now().millisecondsSinceEpoch
    ..map.addAll(Map.fromIterable(
      action.articles,
      key: (item) => item.id,
      value: (item) => item,
    ))
    ..list.replace(action.articles.map((article) => article.id).toList()));
}
