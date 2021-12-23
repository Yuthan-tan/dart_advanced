import 'dart:convert';
import 'dart:io';

void main(List<String> args) {
  // Linux
  Process.start('consol', ['dir']).then((Process process) {
    // process.stdout.transform(UTF8.decoder).listen((data) {
    //   print(data);
    // });

    process.stdout.transform(utf8.decoder).listen((data) {
      print(data);
      // Send to the process
      process.stdin.write('Hello World');

      // stop the process
      Process.killPid(process.pid);

      // get the exit code
      process.exitCode.then((int code) {
        print('Exit code: ${code}');

        // exit
        exit(0);
      });
    });
  });
}