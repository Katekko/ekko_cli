import 'package:get_cli/commands/help/help.dart';
import 'package:get_cli/commands/version/version.dart';

import 'commands/create/screen/screen.dart';

final commands = {
  'create': {
    'screen': () => CreateScreenCommand(),
  },
  'help': () => HelpCommand(),
  'version': () => VersionCommand(),
};
