import 'dart:async';
import 'package:http/http.dart' as http;

void main(List<String> args) async {
  var url = 'http://httpbin.org/';
  var response = await http.get(Uri.parse('http://httpbin.org/'));
  print('Response status ${response.statusCode}');
  print('Response body ${response.body}');
}