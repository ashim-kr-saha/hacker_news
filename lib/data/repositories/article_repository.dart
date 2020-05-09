import 'dart:async';
import 'dart:core';
import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:articles/data/models/models.dart';
import 'package:articles/data/models/serializers.dart';
import 'package:articles/redux/auth/auth_state.dart';
import 'package:articles/data/models/article_model.dart';
import 'package:articles/data/web_client.dart';
import 'package:articles/constants.dart';

class ArticleRepository {
  final WebClient webClient;

  const ArticleRepository({
    this.webClient = const WebClient(),
  });

  Future<BuiltList<ArticleEntity>> loadList(AuthState auth) async {
    final response = await webClient.get(kApiUrl + '/news');

    var list = new BuiltList<ArticleEntity>(response.map((article) {
      return serializers.deserializeWith(ArticleEntity.serializer, article);
    }));

    return list;
  }

  Future saveData(AuthState auth, ArticleEntity article,
      [EntityAction action]) async {
    var data = serializers.serializeWith(ArticleEntity.serializer, article);
    var response;

    if (article.isNew) {
      response = await webClient.post(kApiUrl + '/articles', json.encode(data));
    } else {
      var url = kApiUrl + '/articles/' + article.id.toString();
      response = await webClient.put(url, json.encode(data));
    }

    return serializers.deserializeWith(ArticleEntity.serializer, response);
  }
}
