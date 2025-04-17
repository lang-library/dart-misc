import 'dart:core';
//import 'dart:convert' as convert;
import 'package:misc/misc.dart' as misc;
import 'package:sys/sys.dart' as sys;

void echo(dynamic $x, [String? $title]) {
  String $json = ($x is String) ? '`${$x}`' : '${$x}';
  if ($title == null) {
    print($json);
  } else {
    print('${$title} ==> ${$json}');
  }
}

void dump(dynamic $x, [String? $title]) {
  final $lines = sys.textToLines(StackTrace.current.toString());
  final $lineInfo = '@${$lines[1].replaceAll('#1      ', '')}';
  String $mode = misc.isInDebugMode ? 'DEBUG' : 'RELEASE';
  String $json = ($x is String) ? '`${$x}`' : '${$x}';
  if ($title == null) {
    print('[${$mode}] ${$lineInfo}\n${$json}');
  } else {
    print('[${$mode}] ${$lineInfo}\n${$title} ==> ${$json}');
  }
}
