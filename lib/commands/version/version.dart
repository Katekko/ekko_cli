import 'dart:io';

import 'package:ekko_cli/common/utils/logger/logger.dart';
import 'package:ekko_cli/core/command.dart';
import 'package:yaml/yaml.dart';

class VersionCommand extends Command {
  @override
  String get hint => 'Shows the current CLI version';

  @override
  bool validate() => true;

  @override
  Future<void> execute() async {
    final f = File('pubspec.yaml');
    var text = await f.readAsString();
    Map yaml = loadYaml(text);
    LogService.info('V ${yaml['version']}');
  }
}
