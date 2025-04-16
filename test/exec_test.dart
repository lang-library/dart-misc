import 'package:misc/misc.dart' as misc;

//final $logger = misc.$$globalLogger;

void main() async
{
  print('hello');
  //$logger.i('this is log');
  misc.dump('ダンプします');
  misc.dump('ダンプします2', 'タイトル');
  misc.echo('エコーします');
  misc.echo('エコーします2', 'タイトル');
  misc.setCwd(r'C:\Windows');
  misc.dump(misc.getCwd());
  misc.dump(misc.getFileName(r'C:\Windows\xyz.dll'));
  misc.dump(misc.getBaseName(r'C:\Windows\xyz.dll'));
  misc.dump(await misc.directoryFiles(r'C:\Windows'));
  misc.dump(await misc.directoryDirs(r'C:\Windows'));
  misc.dump(await misc.directoryFiles(r'.'));
  misc.dump(await misc.directoryDirs(r'.'));
}