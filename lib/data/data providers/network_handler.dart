import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class NetworkHandler {
  static const String baseUrl = "http://";
  static const String ip = "192.168.1.12";
  static const String port = ":5000";
  static const String api = "/api";
  static const String loginUrl = baseUrl + ip + port + "/api/login";

  Future<http.Response> get(String url) async {
    Uri formattedUrl = urlFormatter(url);
    debugPrint("GET: " + formattedUrl.toString());
    var response = await http.get(
      formattedUrl,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
    );
    return response;
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
    return Uri.parse(baseUrl + ip + port + api + url);
  }
}
