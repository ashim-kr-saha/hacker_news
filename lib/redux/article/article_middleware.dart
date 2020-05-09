import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';
import 'package:articles/ui/article/article_screen.dart';
import 'package:articles/data/models/models.dart';
import 'package:articles/redux/article/article_actions.dart';
import 'package:articles/redux/ui/ui_actions.dart';
import 'package:articles/ui/article/edit/article_edit_vm.dart';
import 'package:articles/ui/article/view/article_view_vm.dart';
import 'package:articles/redux/app/app_state.dart';
import 'package:articles/data/repositories/article_repository.dart';

List<Middleware<AppState>> createStoreArticlesMiddleware([
  ArticleRepository repository = const ArticleRepository(),
]) {
  final viewArticleList = _viewArticleList();
  final viewArticle = _viewArticle();
  final editArticle = _editArticle();
  final loadArticles = _loadArticles(repository);
  final saveArticle = _saveArticle(repository);
  final deleteArticle = _deleteArticle(repository);

  return [
    TypedMiddleware<AppState, ViewArticleList>(viewArticleList),
    TypedMiddleware<AppState, ViewArticle>(viewArticle),
    TypedMiddleware<AppState, EditArticle>(editArticle),
    TypedMiddleware<AppState, LoadArticles>(loadArticles),
    TypedMiddleware<AppState, SaveArticleRequest>(saveArticle),
    TypedMiddleware<AppState, DeleteArticleRequest>(deleteArticle),
  ];
}

Middleware<AppState> _viewArticleList() {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    store.dispatch(UpdateCurrentRoute(ArticleScreen.route));
    Navigator.of(action.context).pushReplacementNamed(ArticleScreen.route);
  };
}

Middleware<AppState> _viewArticle() {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    store.dispatch(UpdateCurrentRoute(ArticleViewScreen.route));
    Navigator.of(action.context).pushNamed(ArticleViewScreen.route);
  };
}

Middleware<AppState> _editArticle() {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    store.dispatch(UpdateCurrentRoute(ArticleEditScreen.route));
    Navigator.of(action.context).pushNamed(ArticleEditScreen.route);
  };
}

Middleware<AppState> _deleteArticle(ArticleRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    var origArticle = store.state.articleState.map[action.articleId];
    repository
        .saveData(store.state.authState, origArticle, EntityAction.delete)
        .then((article) {
      store.dispatch(DeleteArticleSuccess(article));
      if (action.completer != null) {
        action.completer.complete(null);
      }
    }).catchError((error) {
      print(error);
      store.dispatch(DeleteArticleFailure(origArticle));
    });

    next(action);
  };
}

Middleware<AppState> _saveArticle(ArticleRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.saveData(store.state.authState, action.article).then((article) {
      if (action.article.isNew) {
        store.dispatch(AddArticleSuccess(article));
      } else {
        store.dispatch(SaveArticleSuccess(article));
      }
      action.completer.complete(null);
    }).catchError((error) {
      print(error);
      store.dispatch(SaveArticleFailure(error));
    });

    next(action);
  };
}

Middleware<AppState> _loadArticles(ArticleRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    AppState state = store.state;

    if (!state.articleState.isStale && !action.force) {
      next(action);
      return;
    }

    if (state.isLoading) {
      next(action);
      return;
    }

    store.dispatch(LoadArticlesRequest());
    repository.loadList(state.authState).then((data) {
      store.dispatch(LoadArticlesSuccess(data));

      if (action.completer != null) {
        action.completer.complete(null);
      }
    }).catchError((error) {
      print(error);
      store.dispatch(LoadArticlesFailure(error));
    });

    next(action);
  };
}
