import 'package:ekko_cli/common/utils/logger/logger.dart';
import 'package:ekko_cli/core/command.dart';

class VersionCommand extends Command {
  @override
  String get hint => 'Shows the current CLI version';

  @override
  Future<void> execute() async {
    LogService.info('current version...');
  }

  @override
  bool validate() => true;
}
