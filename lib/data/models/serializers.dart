import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:articles/data/models/models.dart';
import 'package:articles/redux/app/app_state.dart';
import 'package:articles/redux/app/data_state.dart';
import 'package:articles/redux/auth/auth_state.dart';
import 'package:articles/redux/ui/ui_state.dart';
import 'package:built_collection/built_collection.dart';
import 'package:articles/redux/ui/list_ui_state.dart';
// STARTER: import - do not remove comment
import 'package:articles/data/models/article_model.dart';
import 'package:articles/redux/article/article_state.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  AppState,
  LoginResponse,
  // STARTER: serializers - do not remove comment
  ArticleEntity,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
