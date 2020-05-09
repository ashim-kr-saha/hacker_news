import 'package:memoize/memoize.dart';
import 'package:built_collection/built_collection.dart';
import 'package:articles/data/models/article_model.dart';
import 'package:articles/redux/ui/list_ui_state.dart';

var memoizedArticleList = memo3((BuiltMap<int, ArticleEntity> articleMap,
        BuiltList<int> articleList, ListUIState articleListState) =>
    visibleArticlesSelector(articleMap, articleList, articleListState));

List<int> visibleArticlesSelector(BuiltMap<int, ArticleEntity> articleMap,
    BuiltList<int> articleList, ListUIState articleListState) {
  var list = articleList.where((articleId) {
    var article = articleMap[articleId];
    return article.matchesSearch(articleListState.search);
  }).toList();

  list.sort((articleAId, articleBId) {
    var articleA = articleMap[articleAId];
    var articleB = articleMap[articleBId];
    return articleA.compareTo(
        articleB, articleListState.sortField, articleListState.sortAscending);
  });

  return list;
}
