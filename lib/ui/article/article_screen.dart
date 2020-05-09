import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:articles/ui/app/app_search.dart';
import 'package:articles/ui/app/app_search_button.dart';
import 'package:articles/redux/app/app_state.dart';
import 'package:articles/data/models/models.dart';
import 'package:articles/data/models/article_model.dart';
import 'package:articles/ui/article/article_list_vm.dart';
import 'package:articles/redux/article/article_actions.dart';
import 'package:articles/ui/app/app_drawer_vm.dart';
import 'package:articles/ui/app/app_bottom_bar.dart';

class ArticleScreen extends StatelessWidget {
  static final String route = '/article';

  @override
  Widget build(BuildContext context) {
    var store = StoreProvider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: AppSearch(
          entityType: EntityType.article,
          onSearchChanged: (value) {
            store.dispatch(SearchArticles(value));
          },
        ),
        actions: [
          AppSearchButton(
            entityType: EntityType.article,
            onSearchPressed: (value) {
              store.dispatch(SearchArticles(value));
            },
          ),
        ],
      ),
      drawer: AppDrawerBuilder(),
      body: ArticleListBuilder(),
      bottomNavigationBar: AppBottomBar(
        entityType: EntityType.article,
        onSelectedSortField: (value) {
          store.dispatch(SortArticles(value));
        },
        sortFields: [
          // STARTER: sort - do not remove comment
          ArticleFields.title,

          ArticleFields.url,
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorDark,
        onPressed: () {
          store.dispatch(
              EditArticle(article: ArticleEntity(), context: context));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        tooltip: 'New Article',
      ),
    );
  }
}
