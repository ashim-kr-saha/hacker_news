import 'package:articles/redux/app/data_state.dart';
// STARTER: import - do not remove comment
import 'package:articles/redux/article/article_reducer.dart';

DataState dataReducer(DataState state, action) {
  return state.rebuild((b) => b
    // STARTER: reducer - do not remove comment
    ..articleState.replace(articlesReducer(state.articleState, action)));
}
