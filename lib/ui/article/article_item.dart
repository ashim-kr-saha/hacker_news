import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:articles/data/models/article_model.dart';
//import 'package:articles/ui/app/dismissible_entity.dart';

class ArticleItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final ArticleEntity article;

  static final articleItemKey = (int id) => Key('__article_item_${id}__');

  ArticleItem({
    @required this.onDismissed,
    @required this.onTap,
    @required this.article,
  });

  @override
  Widget build(BuildContext context) {
    /*
    return DismissibleEntity(
      entity: article,
      onDismissed: onDismissed,
      onTap: onTap,
      child: ListTile(
        onTap: onTap,
        title: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  article.displayName,
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            ],
          ),
        ),
        // STARTER: subtitle - do not remove comment
subtitle: Text(article.url, maxLines: 4),

      ),
    );
  }
  */

    return ListTile(
      onTap: onTap,
      title: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                article.displayName,
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ],
        ),
      ),
      // STARTER: subtitle - do not remove comment
      subtitle: Text(article.url, maxLines: 4),
    );
  }
}
