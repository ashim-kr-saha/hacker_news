import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:articles/ui/app/actions_menu_button.dart';
import 'package:articles/ui/article/view/article_view_vm.dart';
import 'package:articles/ui/app/form_card.dart';

class ArticleView extends StatefulWidget {
  final ArticleViewVM viewModel;

  ArticleView({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  @override
  _ArticleViewState createState() => new _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  Widget build(BuildContext context) {
    var viewModel = widget.viewModel;
    var article = viewModel.article;

    return Scaffold(
      appBar: AppBar(
        title: Text(article.displayName),
        actions: article.isNew
            ? []
            : [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    viewModel.onEditPressed(context);
                  },
                ),
                ActionMenuButton(
                  isLoading: viewModel.isLoading,
                  entity: article,
                  onSelected: viewModel.onActionSelected,
                )
              ],
      ),
      body: FormCard(children: [
        // STARTER: widgets - do not remove comment
        Text(article.title, style: Theme.of(context).textTheme.title),
        SizedBox(height: 12.0),

        Text(article.url),
      ]),
    );
  }
}
