import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:articles/constants.dart';
import 'package:articles/data/models/article_model.dart';
import 'package:articles/redux/ui/entity_ui_state.dart';
import 'package:articles/redux/ui/list_ui_state.dart';

part 'article_state.g.dart';

abstract class ArticleState
    implements Built<ArticleState, ArticleStateBuilder> {
  @nullable
  int get lastUpdated;

  BuiltMap<int, ArticleEntity> get map;
  BuiltList<int> get list;

  factory ArticleState() {
    return _$ArticleState._(
      map: BuiltMap<int, ArticleEntity>(),
      list: BuiltList<int>(),
    );
  }

  bool get isStale {
    if (!isLoaded) {
      return true;
    }

    return DateTime.now().millisecondsSinceEpoch - lastUpdated >
        kMillisecondsToRefreshData;
  }

  bool get isLoaded {
    return lastUpdated != null;
  }

  ArticleState._();
  static Serializer<ArticleState> get serializer => _$articleStateSerializer;
}

abstract class ArticleUIState extends Object
    with EntityUIState
    implements Built<ArticleUIState, ArticleUIStateBuilder> {
  @nullable
  ArticleEntity get selected;

  bool get isSelectedNew => selected.isNew;

  factory ArticleUIState() {
    return _$ArticleUIState._(
      listUIState: ListUIState(''),
      selected: ArticleEntity(),
    );
  }

  ArticleUIState._();
  static Serializer<ArticleUIState> get serializer =>
      _$articleUIStateSerializer;
}
