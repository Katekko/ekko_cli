import 'package:ekko_cli/commands.dart';
import 'package:ekko_cli/commands/help/help.dart';
import 'package:ekko_cli/common/utils/logger/logger.dart';
import 'package:ekko_cli/core/command.dart';

class EkkoCli {
  final List<String> _arguments;

  EkkoCli(this._arguments) {
    _instance = this;
  }

  static EkkoCli? _instance;
  static EkkoCli? get to => _instance;

  static List<String> get arguments => to?._arguments ?? [];

  Command findCommand() => _findCommand(0, commands);

  Command _findCommand(int currentIndex, Map commands) {
    try {
      final currentArgument = arguments[currentIndex].split(':').first;
      final command = commands[currentArgument];
      if (command == null) throw Exception();
      if (command is Function) return command();
      return _findCommand(currentIndex += 1, command);
    } on RangeError catch (_) {
      return HelpCommand();
    } catch (e) {
      LogService.error('command not found');
      return HelpCommand();
    }
  }
}
