import 'package:misc/misc.dart' as misc;

final _logger = misc.$globalLogger;

int command(String $cmd, List<String> $cmdArgs) {
  String $commandLine = $cmd;
  for (int i = 0; i < $cmdArgs.length; i++) {
    $commandLine += ' "${$cmdArgs[i]}"';
  }
  _logger.i('command(): ${$commandLine}');
  return misc.wsystem($commandLine);
}

void tryCommand(String $cmd, List<String> $cmdArgs) {
  final $exitCode = command($cmd, $cmdArgs);
  if ($exitCode != 0) {
    throw '${$cmd} ${$cmdArgs} returned ${$exitCode}';
  }
}