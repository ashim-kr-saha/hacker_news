import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:articles/redux/ui/ui_actions.dart';
import 'package:articles/ui/article/article_screen.dart';
import 'package:redux/redux.dart';
import 'package:articles/redux/article/article_actions.dart';
import 'package:articles/data/models/article_model.dart';
import 'package:articles/ui/article/edit/article_edit.dart';
import 'package:articles/redux/app/app_state.dart';
import 'package:articles/ui/app/icon_message.dart';

class ArticleEditScreen extends StatelessWidget {
  static final String route = '/article/edit';
  ArticleEditScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ArticleEditVM>(
      converter: (Store<AppState> store) {
        return ArticleEditVM.fromStore(store);
      },
      builder: (context, vm) {
        return ArticleEdit(
          viewModel: vm,
        );
      },
    );
  }
}

class ArticleEditVM {
  final ArticleEntity article;
  final Function(ArticleEntity) onChanged;
  final Function(BuildContext) onSavePressed;
  final Function onBackPressed;
  final bool isLoading;

  ArticleEditVM({
    @required this.article,
    @required this.onChanged,
    @required this.onSavePressed,
    @required this.onBackPressed,
    @required this.isLoading,
  });

  factory ArticleEditVM.fromStore(Store<AppState> store) {
    final article = store.state.articleUIState.selected;

    return ArticleEditVM(
      isLoading: store.state.isLoading,
      article: article,
      onChanged: (ArticleEntity article) {
        store.dispatch(UpdateArticle(article));
      },
      onBackPressed: () {
        store.dispatch(UpdateCurrentRoute(ArticleScreen.route));
      },
      onSavePressed: (BuildContext context) {
        final Completer<Null> completer = new Completer<Null>();
        store.dispatch(
            SaveArticleRequest(completer: completer, article: article));
        return completer.future.then((_) {
          Scaffold.of(context).showSnackBar(SnackBar(
              content: IconMessage(
                message: article.isNew
                    ? 'Successfully Created Article'
                    : 'Successfully Updated Article',
              ),
              duration: Duration(seconds: 3)));
        });
      },
    );
  }
}
