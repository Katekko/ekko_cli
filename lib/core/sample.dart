import 'dart:io';
import 'package:get_cli/commands/create/screen/functions/replace_as_expected.dart';
import 'package:get_cli/common/utils/logger/logger.dart';
import 'package:path/path.dart';

abstract class Sample {
  /// path to create file
  String get path;

  /// content of file
  Future<String> get content;

  /// overwrite file
  bool get overwrite;

  /// create file
  Future<void> create() async {
    File file = await File(replaceAsExpected(path: path));
    if (!await file.exists() || overwrite) {
      await file.create(recursive: true);
      await file.writeAsString(await content);
      LogService.success(basename(path) + ' created');
    }
  }
}
