import 'dart:core';
import 'dart:convert' as convert;
import 'package:misc/misc.dart';

void echo(dynamic $x, [String? $title]) {
  String $json = '${$x}';
  if ($title == null) {
    print($json);
  } else {
    print('${$title} ==> ${$json}');
  }
}

void dump(dynamic $x, [String? $title]) {
  const $splitter = convert.LineSplitter();
  final $lines = $splitter.convert(StackTrace.current.toString());
  final $lineInfo = '@${$lines[1].replaceAll('#1      ', '')}';
  String $mode = isInDebugMode ? 'DEBUG' : 'RELEASE';
  String $json = '${$x}';
  if ($title == null) {
    print('[${$mode}] ${$lineInfo} ${$json}');
  } else {
    print('[${$mode}] ${$lineInfo} ${$title} ==> ${$json}');
  }
}
