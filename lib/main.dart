import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:articles/redux/app/app_middleware.dart';
import 'package:articles/redux/app/app_state.dart';
import 'package:articles/redux/app/app_reducer.dart';
import 'package:articles/redux/auth/auth_middleware.dart';
import 'package:articles/ui/app/init.dart';
import 'package:articles/ui/auth/login_vm.dart';
import 'package:articles/ui/home/home_screen.dart';
// STARTER: import - do not remove comment
import 'package:articles/ui/article/article_screen.dart';
import 'package:articles/ui/article/edit/article_edit_vm.dart';
import 'package:articles/ui/article/view/article_view_vm.dart';
import 'package:articles/redux/article/article_actions.dart';
import 'package:articles/redux/article/article_middleware.dart';

void main() {
  final store = Store<AppState>(appReducer,
      initialState: AppState(),
      middleware: []
        ..addAll(createStoreAuthMiddleware())
        ..addAll(createStorePersistenceMiddleware())
        // STARTER: middleware - do not remove comment
        ..addAll(createStoreArticlesMiddleware())
        ..addAll([
          LoggingMiddleware.printer(),
        ]));

  runApp(SampleReduxApp(store: store));
}

class SampleReduxApp extends StatefulWidget {
  final Store<AppState> store;

  SampleReduxApp({Key key, this.store}) : super(key: key);

  @override
  _SampleReduxAppState createState() => _SampleReduxAppState();
}

class _SampleReduxAppState extends State<SampleReduxApp> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store,
      child: MaterialApp(
        title: 'Sample App',
        routes: {
          InitScreen.route: (context) => InitScreen(),
          LoginScreen.route: (context) => LoginScreen(),
          HomeScreen.route: (context) => HomeScreen(),
          // STARTER: routes - do not remove comment
          ArticleScreen.route: (context) {
            widget.store.dispatch(LoadArticles());
            return ArticleScreen();
          },
          ArticleViewScreen.route: (context) => ArticleViewScreen(),
          ArticleEditScreen.route: (context) => ArticleEditScreen(),
        },
      ),
    );
  }
}
