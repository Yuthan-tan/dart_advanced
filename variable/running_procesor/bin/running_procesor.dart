import 'dart:io';

void main(List<String> args) {
  Process.run('notepad', ['C:\windows\System32\notepad.exe']).then((ProcessResult result) {
    print(result.stdout);
    print('Exit code: ${result.exitCode}');
  });
}