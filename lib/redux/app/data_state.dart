import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
// STARTER: import - do not remove comment
import 'package:articles/redux/article/article_state.dart';

part 'data_state.g.dart';

abstract class DataState implements Built<DataState, DataStateBuilder> {
  // STARTER: fields - do not remove comment
  ArticleState get articleState;

  factory DataState() {
    return _$DataState._(
      // STARTER: constructor - do not remove comment
      articleState: ArticleState(),
    );
  }

  DataState._();
  static Serializer<DataState> get serializer => _$dataStateSerializer;
}
