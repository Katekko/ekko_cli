import 'package:ekko_cli/commands/help/help.dart';
import 'package:ekko_cli/commands/version/version.dart';

import 'commands/create/api/endpoint/endpoint.dart';
import 'commands/create/app/screen/screen.dart';

final commands = {
  'app': {
    'create': {
      'screen': () => CreateScreenCommand(),
    },
  },
  'api': {
    'create': {
      'endpoint': () => CreateEndpointCommand(),
    }
  },
  'help': () => HelpCommand(),
  'version': () => VersionCommand(),
};
