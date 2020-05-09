import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:articles/ui/article/article_item.dart';
import 'package:articles/ui/article/article_list_vm.dart';

class ArticleList extends StatelessWidget {
  final ArticleListVM viewModel;

  ArticleList({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!viewModel.isLoaded) {
      return Center(child: CircularProgressIndicator());
    }

    return _buildListView(context);
  }

  Widget _buildListView(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => viewModel.onRefreshed(context),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: viewModel.articleList.length,
          itemBuilder: (BuildContext context, index) {
            var articleId = viewModel.articleList[index];
            var article = viewModel.articleMap[articleId];
            return Column(children: <Widget>[
              ArticleItem(
                article: article,
                onDismissed: (DismissDirection direction) =>
                    viewModel.onDismissed(context, article, direction),
                onTap: () => viewModel.onArticleTap(context, article),
              ),
              Divider(
                height: 1.0,
              ),
            ]);
          }),
    );
  }
}
