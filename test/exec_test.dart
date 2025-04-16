import 'package:misc/misc.dart' as misc;

//final $logger = misc.$$globalLogger;

main()
{
  print('hello');
  //$logger.i('this is log');
  misc.dump('ダンプします');
  misc.dump('ダンプします2', 'タイトル');
  misc.echo('エコーします');
  misc.echo('エコーします2', 'タイトル');
}