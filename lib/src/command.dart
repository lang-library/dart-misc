import 'package:misc/misc.dart' as misc;

int command(String $cmd, List<String> $cmdArgs) {
  String $commandLine = $cmd;
  for (int i = 0; i < $cmdArgs.length; i++) {
    $commandLine += ' "${$cmdArgs[i]}"';
  }
  print('[Log] command(): ${$commandLine}');
  return misc.wsystem($commandLine);
}
