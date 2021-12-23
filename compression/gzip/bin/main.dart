import 'dart:io';
import 'dart:convert';

void main(List<String> args) {
  String data = '';
  for (int i = 0; i < 100; i++) {
    data = data + 'Hello Vollld!!!!\r\n';
  }
  var original = utf8.encode(data);
  var compressed = gzip.encode(original);
  var decompress = gzip.decode(compressed);

  print('Original ${original.length}bytes');
  print('Original ${compressed.length}bytes');
  print('Original ${decompress.length}bytes');

  String decoded = utf8.decode(decompress);
  assert(data == decoded);
  print(decoded);
}