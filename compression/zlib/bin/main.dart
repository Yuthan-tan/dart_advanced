import 'dart:io';
import 'dart:convert';

void main(List<String> args) {

  int zlib = testCompress(ZLIB);
  int gzip = testCompress(GZIP);

  print('zlib = ${zlib}');
  print('gzip = ${gzip}');
  
}
String generateData(){
  String data = '';
  for (int i = 0; i < 1000; i++) {
    data = data + 'Hello World\r\n';
  }
  return data;
}

int testCompress(var codec){
  String data = generateData();

  List original = utf8.encode(data);
  List compressed = codec.encode(original);
  List descompressed = codec.decode(compressed);

  print('Testing ${codec.toString()}');
  print('Original ${original.length}');
  print('Compressed ${compressed.length}');
  print('Descompressed ${descompressed.length}');

  print('');

  String decoded = utf8.decode(descompressed);
  assert(data == decoded);

  return compressed.length;
}