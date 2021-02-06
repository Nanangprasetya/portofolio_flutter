import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:provider_http_req/Model/dtoPost.dart';
import 'package:provider_http_req/Provider/provider.dart';

class PostApi extends ProviderPost {
  final _url = "https://jsonplaceholder.typicode.com/posts";

  @override
  Future<List<DtoPost>> getPost({int start, int limit}) async {
    final response = await http.get(_url + "?_start=$start&_limit=$limit");

    if (response.statusCode != 200) {
      throw Exception('error fetching posts');
    }
    try {
      List<dynamic> _body = json.decode(response.body);
      return _body.map((e) => DtoPost.fromJson(e)).toList();
    } on SocketException {
      throw Exception('No Internet connection');
    } on TimeoutException {
      throw Exception("Connection timeout");
    }
  }

  @override
  Future<DtoPost> getPostbyId(int id) async {
     final response = await http.get(_url + "/$id");

    if (response.statusCode != 200) {
      throw Exception('error fetching posts');
    }
    try {
      dynamic _body = json.decode(response.body);
      return DtoPost.fromJson(_body);
    } on SocketException {
      throw Exception('No Internet connection');
    } on TimeoutException {
      throw Exception("Connection timeout");
    }
  }

  
}
