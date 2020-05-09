import 'dart:async';
import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:articles/redux/article/article_selectors.dart';
import 'package:articles/ui/app/icon_message.dart';
import 'package:articles/data/models/article_model.dart';
import 'package:articles/ui/article/article_list.dart';
import 'package:articles/redux/app/app_state.dart';
import 'package:articles/redux/article/article_actions.dart';

class ArticleListBuilder extends StatelessWidget {
  static final String route = '/articles/edit';
  ArticleListBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ArticleListVM>(
      converter: ArticleListVM.fromStore,
      builder: (context, vm) {
        return ArticleList(
          viewModel: vm,
        );
      },
    );
  }
}

class ArticleListVM {
  final List<int> articleList;
  final BuiltMap<int, ArticleEntity> articleMap;
  final bool isLoading;
  final bool isLoaded;
  final Function(BuildContext, ArticleEntity) onArticleTap;
  final Function(BuildContext, ArticleEntity, DismissDirection) onDismissed;
  final Function(BuildContext) onRefreshed;

  ArticleListVM({
    @required this.articleList,
    @required this.articleMap,
    @required this.isLoading,
    @required this.isLoaded,
    @required this.onArticleTap,
    @required this.onDismissed,
    @required this.onRefreshed,
  });

  static ArticleListVM fromStore(Store<AppState> store) {
    Future<Null> _handleRefresh(BuildContext context) {
      final Completer<Null> completer = new Completer<Null>();
      store.dispatch(LoadArticles(completer, true));
      return completer.future.then((_) {
        Scaffold.of(context).showSnackBar(SnackBar(
            content: IconMessage(
              message: 'Refresh complete',
            ),
            duration: Duration(seconds: 3)));
      });
    }

    return ArticleListVM(
        articleList: memoizedArticleList(store.state.articleState.map,
            store.state.articleState.list, store.state.articleListState),
        articleMap: store.state.articleState.map,
        isLoading: store.state.isLoading,
        isLoaded: store.state.articleState.isLoaded,
        onArticleTap: (context, article) {
          store.dispatch(ViewArticle(article: article, context: context));
        },
        onRefreshed: (context) => _handleRefresh(context),
        onDismissed: (BuildContext context, ArticleEntity article,
            DismissDirection direction) {
          final Completer<Null> completer = new Completer<Null>();
          store.dispatch(DeleteArticleRequest(completer, article.id));
          var message = 'Successfully Deleted Article';
          return completer.future.then((_) {
            Scaffold.of(context).showSnackBar(SnackBar(
                content: IconMessage(
                  message: message,
                ),
                duration: Duration(seconds: 3)));
          });
        });
  }
}
