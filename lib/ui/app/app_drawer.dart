import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:articles/redux/app/app_state.dart';
import 'package:articles/redux/ui/ui_actions.dart';
import 'package:articles/ui/app/app_drawer_vm.dart';
import 'package:articles/ui/home/home_screen.dart';
import 'package:redux/redux.dart';
// STARTER: import - do not remove comment
import 'package:articles/redux/article/article_actions.dart';

class AppDrawer extends StatelessWidget {
  final AppDrawerVM viewModel;

  AppDrawer({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Store<AppState> store = StoreProvider.of<AppState>(context);
    NavigatorState navigator = Navigator.of(context);

    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            child: DrawerHeader(
              child: Container(),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              store.dispatch(UpdateCurrentRoute(HomeScreen.route));
              navigator.pushReplacementNamed(HomeScreen.route);
            },
          ),
          // STARTER: menu - do not remove comment
          ListTile(
            leading: Icon(Icons.widgets),
            title: Text('Articles'),
            onTap: () => store.dispatch(ViewArticleList(context)),
          ),

          AboutListTile(
            applicationName: '',
            icon: Icon(Icons.info_outline),
          ),
        ],
      ),
    );
  }
}
