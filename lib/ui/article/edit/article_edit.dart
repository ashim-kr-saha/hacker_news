import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:articles/ui/app/form_card.dart';
import 'package:articles/ui/article/edit/article_edit_vm.dart';
import 'package:articles/ui/app/save_icon_button.dart';

class ArticleEdit extends StatefulWidget {
  final ArticleEditVM viewModel;

  ArticleEdit({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  @override
  _ArticleEditState createState() => _ArticleEditState();
}

class _ArticleEditState extends State<ArticleEdit> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // STARTER: controllers - do not remove comment
  final _titleController = TextEditingController();

  final _urlController = TextEditingController();

  var _controllers = [];

  @override
  void didChangeDependencies() {
    _controllers = [
      // STARTER: array - do not remove comment
      _titleController,

      _urlController,
    ];

    _controllers.forEach((controller) => controller.removeListener(_onChanged));

    var article = widget.viewModel.article;
    // STARTER: read value - do not remove comment
    _titleController.text = article.title;

    _urlController.text = article.url;

    _controllers.forEach((controller) => controller.addListener(_onChanged));

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controllers.forEach((controller) {
      controller.removeListener(_onChanged);
      controller.dispose();
    });

    super.dispose();
  }

  _onChanged() {
    var article = widget.viewModel.article.rebuild((b) => b
      // STARTER: set value - do not remove comment
      ..title = _titleController.text.trim()
      ..url = _urlController.text.trim());
    if (article != widget.viewModel.article) {
      widget.viewModel.onChanged(article);
    }
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = widget.viewModel;

    return WillPopScope(
      onWillPop: () async {
        viewModel.onBackPressed();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(viewModel.article.isNew
              ? 'New Article'
              : viewModel.article.displayName),
          actions: <Widget>[
            Builder(builder: (BuildContext context) {
              return SaveIconButton(
                isLoading: viewModel.isLoading,
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }

                  viewModel.onSavePressed(context);
                },
              );
            }),
          ],
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              FormCard(
                children: <Widget>[
                  // STARTER: widgets - do not remove comment
                  TextFormField(
                    controller: _titleController,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                  ),

                  TextFormField(
                    controller: _urlController,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Url',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
