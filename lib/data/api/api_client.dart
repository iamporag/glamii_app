// ignore_for_file: library_prefixes, no_leading_underscores_for_local_identifiers, unnecessary_import, depend_on_referenced_packages, unnecessary_null_comparison, prefer_if_null_operators, empty_catches

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:flutter/foundation.dart' as Foundation;
import 'package:http/http.dart' as Http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../util/app_constants.dart';
import '../response/error_response.dart';

class ApiClient extends GetxService {
  // local vaiable section ==>
  final String appBaseUrl;
  final SharedPreferences sharedPreferences;
  static const String noInternetMessage =
      'Connection to API server failed due to internet connection';
  final int timeoutInSeconds = 120;
  String? token;
  // String? slug;
  Map<String, String>? mainHeaders;

  // api client section
  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    token = sharedPreferences.getString(AppConstants.TOKEN) ?? "";
    // var slugs = sharedPreferences.getString(AppConstants.SLUG) ?? "";
    // slug = slugs;
    debugPrint('Token= $token');
    updateHeader(
        sharedPreferences.getString(AppConstants.LANGUAGE_CODE).toString());
  }

  // header section
  void updateHeader(String languageCode) async {
    // debugPrint('Slug= $slug');
    mainHeaders = {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
      AppConstants.LOCALIZATION_KEY:
          sharedPreferences.getString(AppConstants.LANGUAGE_CODE) ?? 'en',
    };
  }

  // get api data method
  Future<Response> getData(String uri,
      {Map<String, dynamic>? query,
      Map<String, String>? headers,
      bool isPaginate = false}) async {
    try {
      if (Foundation.kDebugMode) {
        if (kDebugMode) {
          print('API Call: $uri\nToken: $token');
        }
      }
      if (kDebugMode) {
        print(appBaseUrl + uri);
      }
      Http.Response _response = await Http.get(
        Uri.parse(isPaginate ? uri : appBaseUrl + uri),
        headers: headers ?? mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));

      if (kDebugMode) {
        print(_response.statusCode);
      }
      Response response = handleResponse(_response);
      if (Foundation.kDebugMode) {
        if (kDebugMode) {
          print(
              'API Response: [${response.statusCode}] $uri\n${response.body}');
        }
      }
      return response;
    } catch (e) {
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  // post api  method
  Future<Response> postData(String uri, dynamic body,
      {Map<String, String>? headers}) async {
    try {
      if (Foundation.kDebugMode) {
        if (kDebugMode) {
          print('API Call: $uri\nToken: $token');
          print('API Body: $body');
        }
      }
      if (kDebugMode) {
        print(appBaseUrl + uri);
      }
      Http.Response _response = await Http.post(
        Uri.parse(appBaseUrl + uri),
        body: jsonEncode(body),
        headers: headers ?? mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      Response response = handleResponse(_response);
      if (kDebugMode) {
        print(response.body);
      }
      if (Foundation.kDebugMode) {
        if (kDebugMode) {
          print(
              'API Response: [${response.statusCode}] $uri\n${response.body}');
        }
      }
      return response;
    } catch (e) {
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  // post multipart api  method
  Future<Response> postMultipartData(
      String uri, Map<String, String> body, List<MultipartBody> multipartBody,
      {Map<String, String>? headers}) async {
    try {
      if (Foundation.kDebugMode) {
        if (kDebugMode) {
          print('API Call: $uri\nToken: $token');
          print('API Body: $body');
        }
      }

      Http.MultipartRequest _request =
          Http.MultipartRequest('POST', Uri.parse(appBaseUrl + uri));
      _request.headers.addAll(headers ?? mainHeaders!);
      for (MultipartBody multipart in multipartBody) {
        if (multipart.file != null) {
          if (Foundation.kIsWeb) {
            Uint8List _list = await multipart.file.readAsBytes();
            Http.MultipartFile _part = Http.MultipartFile(
              multipart.key,
              multipart.file.readAsBytes().asStream(),
              _list.length,
              filename: basename(multipart.file.path),
              contentType: MediaType('image', 'jpg'),
            );
            _request.files.add(_part);
          } else {
            File _file = File(multipart.file.path);
            _request.files.add(Http.MultipartFile(
              multipart.key,
              _file.readAsBytes().asStream(),
              _file.lengthSync(),
              filename: _file.path.split('/').last,
            ));
          }
        }
      }
      _request.fields.addAll(body);
      Http.Response _response =
          await Http.Response.fromStream(await _request.send());
      Response response = handleResponse(_response);
      if (Foundation.kDebugMode) {
        if (kDebugMode) {
          print(
              'API Response: [${response.statusCode}] $uri\n${response.body}');
        }
      }
      return response;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  // put api method
  Future<Response> putData(String uri, dynamic body,
      {Map<String, String>? headers}) async {
    try {
      if (Foundation.kDebugMode) {
        if (kDebugMode) {
          print('API Call: $uri\nToken: $token');
          print('API Body: $body');
        }
      }
      Http.Response _response = await Http.put(
        Uri.parse(appBaseUrl + uri),
        body: jsonEncode(body),
        headers: headers ?? mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      Response response = handleResponse(_response);
      if (Foundation.kDebugMode) {
        if (kDebugMode) {
          print(
              'API Response: [${response.statusCode}] $uri\n${response.body}');
        }
      }
      return response;
    } catch (e) {
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  // delete api method
  Future<Response> deleteData(String uri,
      {Map<String, String>? headers}) async {
    try {
      if (Foundation.kDebugMode) {
        if (kDebugMode) {
          print('API Call: ${appBaseUrl + uri}\nToken: $token');
        }
      }
      Http.Response _response = await Http.delete(
        Uri.parse(appBaseUrl + uri),
        headers: headers ?? mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      Response response = handleResponse(_response);
      if (Foundation.kDebugMode) {
        if (kDebugMode) {
          print(
              'API Response: [${response.statusCode}] $uri\n${response.body}');
        }
      }
      return response;
    } catch (e) {
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  // patch api  method
  Future<Response> patchData(String uri, dynamic body,
      {Map<String, String>? headers}) async {
    try {
      if (Foundation.kDebugMode) {
        if (kDebugMode) {
          print('API Call: $uri\nToken: $token');
          print('API Body: $body');
        }
      }
      if (kDebugMode) {
        print(appBaseUrl + uri);
      }
      Http.Response _response = await Http.patch(
        Uri.parse(appBaseUrl + uri),
        body: jsonEncode(body),
        headers: headers ?? mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      Response response = handleResponse(_response);
      if (kDebugMode) {
        print(response.body);
      }
      if (Foundation.kDebugMode) {
        if (kDebugMode) {
          print(
              'API Response: [${response.statusCode}] $uri\n${response.body}');
        }
      }
      return response;
    } catch (e) {
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> patchMultipartData(
      String uri, Map<String, String> body, List<MultipartBody> multipartBody,
      {Map<String, String>? headers}) async {
    try {
      if (Foundation.kDebugMode) {
        if (kDebugMode) {
          print('API Call: $uri\nToken: $token');
          print('API Body: $body');
        }
      }

      Http.MultipartRequest _request =
          Http.MultipartRequest('PATCH', Uri.parse(appBaseUrl + uri));
      _request.headers.addAll(headers ?? mainHeaders!);
      for (MultipartBody multipart in multipartBody) {
        if (multipart.file != null) {
          if (Foundation.kIsWeb) {
            Uint8List _list = await multipart.file.readAsBytes();
            Http.MultipartFile _part = Http.MultipartFile(
              multipart.key,
              multipart.file.readAsBytes().asStream(),
              _list.length,
              filename: basename(multipart.file.path),
              contentType: MediaType('image', 'jpg'),
            );
            _request.files.add(_part);
          } else {
            File _file = File(multipart.file.path);
            _request.files.add(Http.MultipartFile(
              multipart.key,
              _file.readAsBytes().asStream(),
              _file.lengthSync(),
              filename: _file.path.split('/').last,
            ));
          }
        }
      }
      _request.fields.addAll(body);
      Http.Response _response =
          await Http.Response.fromStream(await _request.send());
      Response response = handleResponse(_response);
      if (Foundation.kDebugMode) {
        if (kDebugMode) {
          print(
              'API Response: [${response.statusCode}] $uri\n${response.body}');
        }
      }
      return response;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

// Response handler section
  Response handleResponse(Http.Response response) {
    dynamic _body;
    try {
      _body = jsonDecode(response.body);
    } catch (e) {}
    Response _response = Response(
      body: _body != null ? _body : response.body,
      bodyString: response.body.toString(),
      headers: response.headers,
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
    );
    if (_response.statusCode != 200 &&
        _response.body != null &&
        _response.body is! String) {
      if (_response.body.toString().startsWith('{errors: [{code:')) {
        ErrorResponse _errorResponse = ErrorResponse.fromJson(_response.body);
        _response = Response(
            statusCode: _response.statusCode,
            body: _response.body,
            statusText: _errorResponse.errors![0].message);
      } else if (_response.body.toString().startsWith('{message')) {
        _response = Response(
            statusCode: _response.statusCode,
            body: _response.body,
            statusText: _response.body['message']);
      }
    } else if (_response.statusCode != 200 && _response.body == null) {
      _response = const Response(statusCode: 0, statusText: noInternetMessage);
    }
    return _response;
  }
}

// Multipart body section
class MultipartBody {
  String key;
  XFile file;

  MultipartBody(this.key, this.file);
}
