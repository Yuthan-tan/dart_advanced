import 'dart:io';

void main(List<String> args) {
  print('OS : ${Platform.operatingSystem} ${Platform.version}');

  if (Platform.isWindows) {
    print('Berjalan Kode Linux');
  } else {
    print('Berjalan dengan normal');

    print('Path: ${Platform.script.path}');
    print('dart: ${Platform.executable}');

    print('Env:');

    Platform.environment.keys.forEach((key) {
      print('${key} ${Platform.environment[key]}');
    });
  }
}


