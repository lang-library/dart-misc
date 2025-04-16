#! /usr/bin/env -S dart

import 'dart:core';
import 'dart:io' as io;
import 'package:path/path.dart' as path;

void setCwd(String $path) {
  io.Directory.current = $path;
}

String getCwd() {
  return io.Directory.current.absolute.path;
}

String getFileName(String $path) {
  return path.basename($path);
}

String getBaseName(String $path) {
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
