import 'dart:core';
import 'dart:convert' as convert;
import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart' as ffi;

class NativeJsonApi {
  final String $$dllName;
  late final ffi.DynamicLibrary $$lib;
  late final ffi.Pointer<ffi.Utf8> Function(
    ffi.Pointer<ffi.Utf8>,
    ffi.Pointer<ffi.Utf8>,
  )
  $$callFunc;

  NativeJsonApi(this.$$dllName) {
    $$lib = ffi.DynamicLibrary.open($$dllName);
    $$callFunc =
        $$lib
            .lookup<
              ffi.NativeFunction<
                ffi.Pointer<ffi.Utf8> Function(
                  ffi.Pointer<ffi.Utf8>,
                  ffi.Pointer<ffi.Utf8>,
                )
              >
            >('Call')
            .asFunction();
  }

  dynamic call(String $name, dynamic $input) {
    String $args = convert.jsonEncode($input);
    final $namePtr = $name.toNativeUtf8();
    final $argsPtr = $args.toNativeUtf8();
    dynamic $result = convert.jsonDecode(
      $$callFunc($namePtr, $argsPtr).toDartString(),
    );
    ffi.calloc.free($namePtr);
    ffi.calloc.free($argsPtr);
    if ($result is String) {
      throw $result;
    }
    return $result[0];
  }
}
