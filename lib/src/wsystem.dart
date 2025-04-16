#! /usr/bin/env -S dart

import 'dart:core';
import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart' as ffi;

final ffi.DynamicLibrary _msvcrtLib = ffi.DynamicLibrary.open('msvcrt.dll');

final int Function(ffi.Pointer<ffi.Utf16>) _wsystemFunc =
    _msvcrtLib
        .lookup<ffi.NativeFunction<ffi.Int32 Function(ffi.Pointer<ffi.Utf16>)>>(
          '_wsystem',
        )
        .asFunction();

int wsystem(String $commandLine) {
  final $strPtr = $commandLine.toNativeUtf16();
  int $exitCode = _wsystemFunc($strPtr);
  ffi.calloc.free($strPtr);
  return $exitCode;
}
