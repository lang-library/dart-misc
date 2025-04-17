import 'dart:io' as io;
import 'package:logger/logger.dart'as logger;

// This will show all logs even in release mode. (NOT a good idea)
class _MyFilter extends logger.LogFilter {
  @override
  bool shouldLog(logger.LogEvent event) {
    return true;
  }
}

class _MyeOutput extends logger.LogOutput {
  @override
  void output(logger.OutputEvent event) {
    for (var line in event.lines) {
      //print(line);
      io.stderr.writeln(line);
    }
  }
}

// デフォルトでリリースビルドは出力しない、デバッグビルドはすべてログ出力する動作になっている
final $globalLogger = logger.Logger(filter: _MyFilter(), output: _MyeOutput());
