import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/post.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, {this.statusCode});

  @override
  String toString() => message;
}

class PostService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/posts';
  static const Duration _timeout = Duration(seconds: 15);

  // Helper: parse response or throw
  List<Post> _parsePosts(http.Response response) {
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    }
    throw ApiException(
      'Failed to load posts',
      statusCode: response.statusCode,
    );
  }

  Post _parsePost(http.Response response, {int? expectedStatus}) {
    final code = expectedStatus ?? 200;
    if (response.statusCode == code ||
        response.statusCode == 200 ||
        response.statusCode == 201) {
      final data = json.decode(response.body);
      return Post.fromJson(data);
    }
    throw ApiException(
      'Request failed (${response.statusCode})',
      statusCode: response.statusCode,
    );
  }

  // GET all posts
  Future<List<Post>> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl)).timeout(_timeout);
      return _parsePosts(response);
    } on SocketException {
      throw ApiException('No internet connection. Please check your network.');
    } on HttpException {
      throw ApiException('Could not reach the server. Try again later.');
    } on FormatException {
      throw ApiException('Received invalid data from server.');
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An unexpected error occurred: $e');
    }
  }

  // GET single post
  Future<Post> fetchPost(int id) async {
    try {
      final response =
          await http.get(Uri.parse('$_baseUrl/$id')).timeout(_timeout);
      return _parsePost(response);
    } on SocketException {
      throw ApiException('No internet connection.');
    } on FormatException {
      throw ApiException('Received invalid data from server.');
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An unexpected error occurred: $e');
    }
  }

  // POST create
  Future<Post> createPost(Post post) async {
    try {
      final response = await http
          .post(
            Uri.parse(_baseUrl),
            headers: {'Content-Type': 'application/json; charset=UTF-8'},
            body: json.encode(post.toJson()),
          )
          .timeout(_timeout);
      return _parsePost(response, expectedStatus: 201);
    } on SocketException {
      throw ApiException('No internet connection.');
    } on FormatException {
      throw ApiException('Received invalid data from server.');
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An unexpected error occurred: $e');
    }
  }

  // PUT update
  Future<Post> updatePost(Post post) async {
    try {
      final response = await http
          .put(
            Uri.parse('$_baseUrl/${post.id}'),
            headers: {'Content-Type': 'application/json; charset=UTF-8'},
            body: json.encode(post.toJson()),
          )
          .timeout(_timeout);
      return _parsePost(response);
    } on SocketException {
      throw ApiException('No internet connection.');
    } on FormatException {
      throw ApiException('Received invalid data from server.');
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An unexpected error occurred: $e');
    }
  }

  // DELETE
  Future<void> deletePost(int id) async {
    try {
      final response =
          await http.delete(Uri.parse('$_baseUrl/$id')).timeout(_timeout);
      if (response.statusCode != 200) {
        throw ApiException(
          'Failed to delete post',
          statusCode: response.statusCode,
        );
      }
    } on SocketException {
      throw ApiException('No internet connection.');
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('An unexpected error occurred: $e');
    }
  }
}
