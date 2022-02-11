import 'package:ekko_cli/commands/help/help.dart';
import 'package:ekko_cli/commands/version/version.dart';

import 'commands/create/screen/screen.dart';

final commands = {
  'create': {'screen': () => CreateScreenCommand()},
  'help': () => HelpCommand(),
  'version': () => VersionCommand(),
};
