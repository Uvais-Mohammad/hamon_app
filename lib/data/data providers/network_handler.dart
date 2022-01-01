import 'dart:convert';
import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:hamon_app/data/constants/status_codes.dart';
import 'package:hamon_app/data/models/api_status.dart';
import 'package:http/http.dart' as http;

class NetworkHandler {
  static const String baseUrl = "http://hamon-interviewapi.herokuapp.com";
  static const apikey = "/?api_key=2C812";

  Future get(String url) async {
        try {
      Uri formattedUrl = urlFormatter(url);
      debugPrint("GET: " + formattedUrl.toString());
      var response = await http.get(
        formattedUrl,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        return Success(
            code: response.statusCode, response: jsonDecode(response.body));
      }
      return Failure(code: userInvalidResponse, response: "Invalid Response");
    } on HttpException {
      return Failure(code: noInternet, response: "No Internet");
    } on FormatException {
      return Failure(code: invalidFormat, response: "Invalid Format");
    } catch (e) {
      return Failure(code: unknownError, response: "Unknown Error");
    }
  }

  Future<http.Response> post(String url, Map<String, dynamic> body) async {
    Uri formattedUrl = urlFormatter(url);
    debugPrint("POST: " + formattedUrl.toString());
    var response = await http.post(formattedUrl,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
    return response;
  }

  Future<http.Response> put(String url, Map<String, dynamic> body) async {
    Uri formattedUrl = urlFormatter(url);

    var response = await http.put(formattedUrl,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
    return response;
  }

  Uri urlFormatter(String url) {
    return Uri.parse(baseUrl + url + apikey);
  }
}
