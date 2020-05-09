import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:articles/ui/home/home_screen.dart';
// STARTER: import - do not remove comment
import 'package:articles/redux/article/article_state.dart';

part 'ui_state.g.dart';

abstract class UIState implements Built<UIState, UIStateBuilder> {
  String get currentRoute;

  // STARTER: properties - do not remove comment
  ArticleUIState get articleUIState;

  factory UIState() {
    return _$UIState._(
      //currentRoute: LoginScreen.route,
      currentRoute: HomeScreen.route,
      // STARTER: constructor - do not remove comment
      articleUIState: ArticleUIState(),
    );
  }

  UIState._();
  static Serializer<UIState> get serializer => _$uIStateSerializer;
}
