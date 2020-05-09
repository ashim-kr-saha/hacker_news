import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:articles/redux/article/article_actions.dart';
import 'package:articles/data/models/article_model.dart';
import 'package:articles/data/models/models.dart';
import 'package:articles/ui/article/view/article_view.dart';
import 'package:articles/redux/app/app_state.dart';
import 'package:articles/ui/app/icon_message.dart';

class ArticleViewScreen extends StatelessWidget {
  static final String route = '/article/view';
  ArticleViewScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ArticleViewVM>(
      converter: (Store<AppState> store) {
        return ArticleViewVM.fromStore(store);
      },
      builder: (context, vm) {
        return ArticleView(
          viewModel: vm,
        );
      },
    );
  }
}

class ArticleViewVM {
  final ArticleEntity article;
  final Function(BuildContext, EntityAction) onActionSelected;
  final Function(BuildContext) onEditPressed;
  final bool isLoading;

  ArticleViewVM({
    @required this.article,
    @required this.onActionSelected,
    @required this.onEditPressed,
    @required this.isLoading,
  });

  factory ArticleViewVM.fromStore(Store<AppState> store) {
    final article = store.state.articleUIState.selected;

    return ArticleViewVM(
        isLoading: store.state.isLoading,
        article: article,
        onEditPressed: (BuildContext context) {
          store.dispatch(EditArticle(article: article, context: context));
        },
        onActionSelected: (BuildContext context, EntityAction action) {
          final Completer<Null> completer = new Completer<Null>();
          var message;
          switch (action) {
            case EntityAction.delete:
              store.dispatch(DeleteArticleRequest(completer, article.id));
              message = 'Successfully Deleted Article';
              break;
          }
          if (message != null) {
            return completer.future.then((_) {
              Scaffold.of(context).showSnackBar(SnackBar(
                  content: IconMessage(
                    message: message,
                  ),
                  duration: Duration(seconds: 3)));
            });
          }
        });
  }
}
