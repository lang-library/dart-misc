#! /usr/bin/env -S dart

import 'dart:core';
import 'dart:convert' as convert;
import 'dart:io' as io;
import 'package:path/path.dart' as path;

void setCwd(String $path) {
  print('[Log] setCwd(): ${$path}');
  io.Directory.current = $path;
}

String getCwd() {
  return io.Directory.current.absolute.path;
}

String pathFullName(String $path) {
  return path.normalize(path.absolute($path));
}

String pathDirectoryName(String $path) {
  return path.dirname($path);
}

String pathFileName(String $path) {
  return path.basename($path);
}

String pathBaseName(String $path) {
  return path.basenameWithoutExtension($path);
}

Future<List<String>> directoryFiles(String $path) async {
  final $dir = io.Directory(path.join($path));
  final List<io.FileSystemEntity> $entities = await $dir.list().toList();
  final Iterable<io.File> $files = $entities.whereType<io.File>();
  List<String> result = [];
  $files.toList().forEach((x) {
    result.add(path.normalize(path.absolute(x.path)));
  });
  return result;
}

Future<List<String>> directoryDirs(String $path) async {
  final $dir = io.Directory(path.join($path));
  final List<io.FileSystemEntity> $entities = await $dir.list().toList();
  final Iterable<io.Directory> $dirs = $entities.whereType<io.Directory>();
  List<String> result = [];
  $dirs.toList().forEach((x) {
    result.add(path.normalize(path.absolute(x.path)));
  });
  return result;
}

Future<String> readFileText(String $path) async {
  final $file = io.File($path);
  return await $file.readAsString();
}

Future<List<String>> readFileLines(String $path) async {
  final $file = io.File($path);
  return await $file.readAsLines();
}

List<String> textToLines(String $s) {
  const $splitter = convert.LineSplitter();
  final $lines = $splitter.convert($s);
  return $lines;
}

String? getenv(String $name) {
  return io.Platform.environment[$name];
}
