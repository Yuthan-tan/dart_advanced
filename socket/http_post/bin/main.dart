import 'package:http/http.dart' as http;

void main(List<String> args) async {
  var url = 'http://httpbin.org/post';
  var response = await http.post(url, body: 'name=Yuthan&color=red');
  print('Response status ${response.statusCode}');
  print('Response body ${response.body}');
}