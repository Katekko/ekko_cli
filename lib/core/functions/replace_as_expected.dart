import 'dart:io';

import 'package:meta/meta.dart';

String replaceAsExpected({@required String path, String replaceChar}) {
  if (path.contains('\\')) {
    if (Platform.isLinux || Platform.isMacOS) {
      return path.replaceAll('\\', '/');
    } else {
      return path;
    }
  } else if (path.contains('/')) {
    if (Platform.isWindows) {
      return path.replaceAll('/', '\\\\');
    } else {
      return path;
    }
  } else {
    return path;
  }
}
