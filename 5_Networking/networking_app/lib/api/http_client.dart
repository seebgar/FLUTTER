import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:networking_app/api/parsers/json_parser.dart';

class RequestREST {
  final String api;
  final Map<String, String> data;

  const RequestREST({
    @required this.api,
    this.data = const {},
  });

  /// HTTP dio Client
  /// Static because the client wont change
  /// If the cliente changes (different APIs) ->
  /// Define the client as a property and inject via class constructor
  static final _client = Dio(
    BaseOptions(
      baseUrl: "http://royalcondor.herokuapp.com/",
      connectTimeout: 3000,
      receiveTimeout: 3000,
      headers: <String, String>{
        "token": "Bearer ",
      },
    ),
  );

  Future<T> executeGet<T>(JsonParser<T> parser) async {
    final response = await _client.get<String>(api);
    return parser.parseFromJson(response.data);
  }

  Future<T> executePost<T>(JsonParser<T> parser) async {
    final formData = FormData.fromMap(data);
    final response = await _client.post<String>(
      api,
      data: formData,
    );

    return parser.parseFromJson(response.data);
  }
}
