import 'dart:io';
import 'dart:convert';

void main(List<String> args) {
  var data = 'Hello Bos';

  List<int> dataToSend = utf8.encode(data);
  int port = 3000;

  //Server

  RawDatagramSocket.bind(InternetAddress.LOOPBACK_IP_V4, port).then((RawDatagramSocket udpSocket) {
    udpSocket.listen((RawSocketEvent event) {
      if (event == RawSocketEvent.READ) {
      Datagram dg = udpSocket.receive();
      print(utf8.decode(dg.data)); 
      }
    });

    //client

    udpSocket.send(dataToSend, InternetAddress.ANY_IP_V4, port);
    print('Terkirim!');
  });
}