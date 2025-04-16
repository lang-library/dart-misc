import 'dart:core';
//import 'dart:convert' as convert;
import 'package:misc/misc.dart' as misc;

void echo(dynamic $x, [String? $title]) {
  String $json = ($x is String) ? '`${$x}`' : '${$x}';
  if ($title == null) {
    print($json);
  } else {
    print('${$title} ==> ${$json}');
  }
}

void dump(dynamic $x, [String? $title]) {
  //const $splitter = convert.LineSplitter();
  //final $lines = $splitter.convert(StackTrace.current.toString());
  final $lines = misc.textToLines(StackTrace.current.toString());
  final $lineInfo = '@${$lines[1].replaceAll('#1      ', '')}';
  String $mode = misc.isInDebugMode ? 'DEBUG' : 'RELEASE';
  String $json = ($x is String) ? '`${$x}`' : '${$x}';
  if ($title == null) {
    print('[${$mode}] ${$lineInfo}\n${$json}');
  } else {
    print('[${$mode}] ${$lineInfo}\n${$title} ==> ${$json}');
  }
}
