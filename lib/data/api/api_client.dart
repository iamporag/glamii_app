import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../util/app_constants.dart';
import '../model/response/error_response.dart';

class ApiClient extends GetxService {
  // Local variables
  final String appBaseUrl;
  final SharedPreferences sharedPreferences;
  static const String noInternetMessage =
      'Connection to API server failed due to internet connection';
  final int timeoutInSeconds = 120;
  String? token;
  Map<String, String>? _mainHeaders;

  // Constructor
  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    token = sharedPreferences.getString(AppConstants.TOKEN) ?? "";
    debugPrint('Token: $token');
    updateHeader(
        token!, sharedPreferences.getString(AppConstants.LANGUAGE_CODE) ?? "");
  }

  // Update headers
  void updateHeader(String token, String languageCode) {
    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
      AppConstants.LOCALIZATION_KEY: languageCode
    };
  }

  // GET request
  Future<Response> getData(String uri,
      {Map<String, dynamic>? query, Map<String, String>? headers}) async {
    try {
      debugPrint('API Call: $uri\nToken: $token');
      final fullUri = Uri.parse('$appBaseUrl$uri');
      final response = await http
          .get(fullUri, headers: headers ?? _mainHeaders)
          .timeout(Duration(seconds: timeoutInSeconds));

      debugPrint('Response status: ${response.statusCode}');
      return handleResponse(response);
    } catch (e) {
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  // POST request
  Future<Response> postData(String uri, dynamic body,
      {Map<String, String>? headers}) async {
    try {
      debugPrint('API Call: $uri\nToken: $token\nBody: $body');
      final response = await http
          .post(
            Uri.parse('$appBaseUrl$uri'),
            body: jsonEncode(body),
            headers: headers ?? _mainHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));

      return handleResponse(response);
    } catch (e) {
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  // POST multipart request
  Future<Response> postMultipartData(
      String uri, Map<String, String> body, List<MultipartBody> multipartBody,
      {Map<String, String>? headers}) async {
    try {
      debugPrint('API Call: $uri\nToken: $token\nBody: $body');

      final request =
          http.MultipartRequest('POST', Uri.parse('$appBaseUrl$uri'));
      request.headers.addAll(headers ?? _mainHeaders!);

      for (var multipart in multipartBody) {
        if (kIsWeb) {
          Uint8List list = await multipart.file.readAsBytes();
          final part = http.MultipartFile.fromBytes(
            multipart.key,
            list,
            filename: basename(multipart.file.path),
            contentType: MediaType('image', 'jpg'),
          );
          request.files.add(part);
        } else {
          final file = File(multipart.file.path);
          request.files.add(http.MultipartFile(
            multipart.key,
            file.readAsBytes().asStream(),
            file.lengthSync(),
            filename: basename(file.path),
          ));
        }
      }

      request.fields.addAll(body);
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      return handleResponse(response);
    } catch (e) {
      debugPrint(e.toString());
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  // PUT request
  Future<Response> putData(String uri, dynamic body,
      {Map<String, String>? headers}) async {
    try {
      debugPrint('API Call: $uri\nToken: $token\nBody: $body');
      final response = await http
          .put(
            Uri.parse('$appBaseUrl$uri'),
            body: jsonEncode(body),
            headers: headers ?? _mainHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));

      return handleResponse(response);
    } catch (e) {
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  // DELETE request
  Future<Response> deleteData(String uri,
      {Map<String, String>? headers}) async {
    try {
      debugPrint('API Call: $uri\nToken: $token');
      final response = await http
          .delete(
            Uri.parse('$appBaseUrl$uri'),
            headers: headers ?? _mainHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));

      return handleResponse(response);
    } catch (e) {
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  // Handle response
  Response handleResponse(http.Response response) {
    dynamic body;
    try {
      body = jsonDecode(response.body);
    } catch (e) {
      body = response.body;
    }

    Response apiResponse = Response(
      body: body ?? response.body,
      bodyString: response.body.toString(),
      headers: response.headers,
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
    );

    if (response.statusCode != 200 && body != null && body is! String) {
      if (body.toString().startsWith('{errors: [{code:')) {
        ErrorResponse errorResponse = ErrorResponse.fromJson(body);
        apiResponse = Response(
          statusCode: response.statusCode,
          body: body,
          statusText: errorResponse.errors![0].message,
        );
      } else if (body.toString().startsWith('{message')) {
        apiResponse = Response(
          statusCode: response.statusCode,
          body: body,
          statusText: body['message'],
        );
      }
    } else if (response.statusCode != 200 && body == null) {
      apiResponse =
          const Response(statusCode: 0, statusText: noInternetMessage);
    }

    return apiResponse;
  }
}

// Multipart body class
class MultipartBody {
  String key;
  File file;

  MultipartBody(this.key, this.file);
}
