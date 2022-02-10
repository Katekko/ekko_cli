import 'package:ekko_cli/commands.dart';
import 'package:ekko_cli/common/utils/logger/logger.dart';
import 'package:ekko_cli/core/command.dart';

class HelpCommand extends Command {
  @override
  String get hint => 'Show this help';

  @override
  bool validate() => true;

  String _getCommandsHelp(Map commands, int index) {
    var result = '';
    commands.forEach((key, value) {
      if (value is Map) {
        result += '\n' + '  ' * index + key + ':';
        result += _getCommandsHelp(value, index + 1);
        result += '\n';
      } else if (value is Function) {
        final command = value() as Command;
        result += '\n' + '  ' * index + key + ': ' + command.hint;
      }
    });
    return result;
  }

  @override
  Future<void> execute() async {
    final commandsHelp = _getCommandsHelp(commands, 0);
    LogService.info('''
List available commands:
$commandsHelp
''');
  }
}
