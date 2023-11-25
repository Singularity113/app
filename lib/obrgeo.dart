import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> getAddress(data) async {
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    'Authorization': 'Token 4a11a4f8096e027a67d12ca7453f345f965299cc',
  };

  final url = Uri.parse(
      'https://suggestions.dadata.ru/suggestions/api/4_1/rs/geolocate/address');
  final resp = await http.post(url, headers: headers, body: json.encode(data));
  return resp.body;
}