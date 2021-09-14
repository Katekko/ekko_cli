import 'dart:io';

import 'package:ekko_cli/common/utils/logger/logger.dart';

class PubspecUtils {
  static final _pubspec = File('pubspec.yaml');

  static Future<String> getProjectName() async {
    var name = '';
    try {
      var lines = _pubspec.readAsLinesSync();
      name = lines
          .firstWhere((line) => line.startsWith('name:'))
          .split(':')
          .last
          .trim();
    } on FileSystemException catch (e) {
      _onFileSystemError(e);
    } catch (e) {
      _logException(e.runtimeType.toString());
    }
    return name;
  }

  static void _onFileSystemError(FileSystemException e) {
    if (e.osError?.errorCode == 2) {
      LogService.error(
        'pubspec.yaml not found in current directory, '
        'are you in the root folder of your project?',
      );
      return;
    } else if (e.osError?.errorCode == 13) {
      LogService.error('You are not allowed to access pubspec.yaml');
      return;
    }
    _logException(e.message);
  }

  static void _logException(String msg) {
    LogService.error(
      '''Unexpected error occurred:
$msg
''',
    );
  }
}
