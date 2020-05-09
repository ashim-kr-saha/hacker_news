import 'package:articles/redux/ui/ui_actions.dart';
import 'package:articles/redux/ui/ui_state.dart';
import 'package:redux/redux.dart';
// STARTER: import - do not remove comment
import 'package:articles/redux/article/article_reducer.dart';

UIState uiReducer(UIState state, action) {
  return state.rebuild((b) => b
    ..currentRoute = currentRouteReducer(state.currentRoute, action)
    // STARTER: reducer - do not remove comment
    ..articleUIState.replace(articleUIReducer(state.articleUIState, action)));
}

Reducer<String> currentRouteReducer = combineReducers([
  TypedReducer<String, UpdateCurrentRoute>(updateCurrentRouteReducer),
]);

String updateCurrentRouteReducer(
    String currentRoute, UpdateCurrentRoute action) {
  return action.route;
}
