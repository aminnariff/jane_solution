import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String getDomain() {
    // live Api
    // return "https://partner.winner.com.my/";
    // staging Api
    return "https://winnerpartner.rksv.dev/";
  }

  Map<String, String> getAuthenticatedUserHeaders(token) {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token.replaceAll('"', '')}',
    };
  }

  Map<String, String> getUnauthenticatedUserHeaders(token) {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  getApiResponse(
      {bool primaryApi = true,
      bool autheticatedUser = true,
      required String url,
      data,
      String method = 'post'}) async {
    final SharedPreferences prefs = await _prefs;
    String? token = prefs.getString('token');
    late final http.Response response;
    String fullUrl = primaryApi ? '${getDomain()}$url' : url;
    Map<String, String> headers = (autheticatedUser)
        ? getAuthenticatedUserHeaders(token)
        : getUnauthenticatedUserHeaders(token);
    try {
      if (method == 'post') {
        if (data != null) {
          response = await http
              .post(
                Uri.parse(fullUrl),
                headers: headers,
                body: json.encode(data),
              )
              .timeout(
                const Duration(seconds: 30),
              );
        } else if (data == null) {
          response = await http.post(
            Uri.parse(fullUrl),
            headers: headers,
          );
        }
      } else if (method == 'get') {
        response = await http.get(
          Uri.parse(fullUrl),
          headers: headers,
        );
      } else if (method == 'put') {
        response = await http.put(
          Uri.parse(fullUrl),
          headers: headers,
          body: json.encode(data),
        );
      }
    } on TimeoutException catch (e) {
      debugPrint('Timeout Error: $e');
      // MyApp().getConnectionError('Looks like the server is taking too long to respond, please try again in sometime');
    } on SocketException catch (e) {
      debugPrint('Socket Error: $e');
      // MyApp().getConnectionError('Internet connection is now offline');
    } on HttpException catch (e) {
      debugPrint('Http Error: $e');
      // MyApp().getConnectionError('Looks like the server is taking too long to respond, please try again in sometime');
    } on Error catch (e) {
      debugPrint('General Error: $e');
      // MyApp().getConnectionError('Looks like the server is taking too long to respond, please try again in sometime');
    }

    return response;
  }
}
