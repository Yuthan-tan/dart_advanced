import 'package:collection/collection.dart';
import 'package:pointycastle/pointycastle.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

void main(List<String> args) {
  final key = randomBytes(16);
  final params = new KeyParameter(key);
  
  BlockCipher cipher = new BlockCipher("AES");
  cipher.init(true, params);

  String plaintext = 'Hello World';
  Uint8List plain_data = createUint8ListFromString(plaintext.padRight(cipher.blockSize));
  Uint8List encrypted_Data = cipher.process(plain_data);

  cipher.reset();
  cipher.init(false, params);
  Uint8List decrypted_data = cipher.process(encrypted_Data);

  displayUint8List('Plain Text', plain_data);
  displayUint8List('Encrypted Data', encrypted_Data);
  displayUint8List('Descrypted Data', decrypted_data);

  Function eq = const ListEquality().equals;
  assert (eq(plain_data, decrypted_data));
  
  print(utf8.decode(decrypted_data).trim());
}
//dari tutorial ke 2
Uint8List createUint8ListFromString(String value) => new Uint8List.fromList(utf8.encode(value));

//dari tutorial ke 2
void displayUint8List(String title, Uint8List value) {
  print(title);
  print(value);
  print(base64.encode(value));
  print('');
}

//dari tutorial ke 3
Uint8List randomBytes(int length) {
  final rnd = new SecureRandom("AES/CTR/AUTO-SEED-PRNG");

  final key = new Uint8List(16);
  final keyParam = new KeyParameter(key);
  final params = new ParametersWithIV(keyParam, new Uint8List(16));

  rnd.seed(params);
  var random = new Random();
  for(int i = 0; i < random.nextInt(255); i++) {
    rnd.nextUint8();
  }

  var bytes = rnd.nextBytes(length);
  return bytes;
}