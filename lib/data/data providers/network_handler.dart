import 'dart:convert';
import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:hamon_app/data/constants/status_codes.dart';
import 'package:hamon_app/data/models/api_status.dart';
import 'package:http/http.dart' as http;

class NetworkHandler {
  static const String baseUrl = "http://hamon-interviewapi.herokuapp.com";
  static const apikey = "?api_key=2C812";

  Future get(String url) async {
    try {
      Uri formattedUrl = urlFormatter(url);
      debugPrint("GET: " + formattedUrl.toString());
      var response = await http.get(
        formattedUrl,
        headers: {
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

  Future patch(String url, Map<String, dynamic> body) async {
    try {
      Uri formattedUrl = urlFormatter(url);
      debugPrint("PATCH: " + formattedUrl.toString());
      // var formData = FormData();
      // formData.append('subject', body['subject']);
      // print(formData.toString());

      // var response = await http.patch(formattedUrl, body: formData, headers: {
      //   'Accept': 'application/json',
      //   'Content-Type': 'multipart/form-data'
      // });
      var request = http.MultipartRequest('PATCH', formattedUrl)
        ..fields['subject'] = body['subject'];
      await request.send();
      var response = await http.get(
        formattedUrl,
        headers: {
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
      // throw e;
      print(e);
      return Failure(code: unknownError, response: "Unknown Error");
    }
  }

  Uri urlFormatter(String url) {
    return Uri.parse(baseUrl + url + apikey);
  }
}
