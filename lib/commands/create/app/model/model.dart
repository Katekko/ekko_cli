import 'package:ekko_cli/commands/create/create.dart';
import 'package:ekko_cli/common/utils/logger/logger.dart';
import 'package:ekko_cli/core/command.dart';
import 'package:ekko_cli/ekko_cli.dart';
import 'package:recase/recase.dart';

import 'samples/model.sample.dart';

class CreateModelCommand extends Command with CreateMixin {
  @override
  Future<void> execute() async {
    final splitName = EkkoCli.arguments[2].split(':');
    final on = EkkoCli.arguments.length == 5 ? EkkoCli.arguments[4] : null;
    final hasModelName = splitName.length == 2;
    if (on != null) {
      if (hasModelName) {
        final baseFolderDomain = 'lib/domain/${on.snakeCase}';
        final modelName = '${name.pascalCase}Model';
        final modelDir = '$baseFolderDomain/${name.snakeCase}.model.dart';

        await ModelSample(fileName: modelName, path: modelDir).create();
      } else {
        LogService.error(
          'Declare a name for your screen: ekko app create screen:"Name of your Screen"',
        );
      }
    } else {
      LogService.error(
        'Declare where your model will stay: ekko app create model:"Name of your model" on "where"',
      );
    }
  }

  @override
  String get hint => 'Create a new screen with binding and routes';

  @override
  bool validate() => true;
}
