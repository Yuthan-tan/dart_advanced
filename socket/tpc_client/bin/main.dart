import 'dart:io';

void main(List<String> args) async {
  var socket = await Socket.connect('127.0.0.1', 3000);
  print('Terhubung');
  socket.write('Hallo Bos');
  print('terkirim, tutup');
  await socket.close();
  print('Tutup');
  exit(0);

}