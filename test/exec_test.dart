import 'package:misc/misc.dart' as misc;

//final $logger = misc.$$globalLogger;

void main() async
{
  try {
    print('hello');
    //$logger.i('this is log');
    misc.dump('ダンプします');
    misc.dump('ダンプします2', 'タイトル');
    misc.echo('エコーします');
    misc.echo('エコーします2', 'タイトル');
    misc.setCwd(r'C:\Windows');
    misc.dump(misc.getCwd());
    misc.dump(misc.pathFullName(r'aaa.txt'));
    misc.dump(misc.pathFileName(r'C:\Windows\xyz.dll'));
    misc.dump(misc.pathBaseName(r'C:\Windows\xyz.dll'));
    misc.dump(misc.pathDirectoryName(r'C:\Windows\xyz.dll'));
    misc.dump(await misc.directoryFiles(r'C:\Windows'));
    misc.dump(await misc.directoryDirs(r'C:\Windows'));
    misc.dump(await misc.directoryFiles(r'.'));
    misc.dump(await misc.directoryDirs(r'.'));
    misc.dump(await misc.readFileText(r'D:/home11/dart/git/dart-misc/pubspec.yaml'));
    misc.dump(await misc.readFileLines(r'D:/home11/dart/git/dart-misc/pubspec.yaml'));
    misc.dump(misc.getenv('HOME'));
    misc.command('dir', []);
    misc.tryCommand('dirxxx', []);
    misc.$globalLogger.i([11, 22, 33]);
  } catch ($e, $stacktrace) {
    misc.dump($e, 'Exception');
    misc.dump($stacktrace, 'Stacktrace');
  }
}