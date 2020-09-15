import 'package:get_cli/commands/create/create.dart';
import 'package:get_cli/common/utils/logger/logger.dart';
import 'package:get_cli/core/command.dart';
import 'package:recase/recase.dart';

import '../../../get_cli.dart';
import 'samples/get_screen.dart';

class CreateScreenCommand extends Command with CreateMixin {
  @override
  Future<void> execute() async {
    // get create screen:"Home"
    var split = GetCli.arguments[1].split(':');
    var hasScreenName = split.length == 2;
    if (hasScreenName) {
      var baseFolderPresentation = 'lib/presentation/';
      var screenDir =
          '$baseFolderPresentation/${name.snakeCase}/${name.snakeCase}.screen.dart';
      var controllerDir =
          '$baseFolderPresentation/${name.snakeCase}/controllers/${name.snakeCase}.controller.dart';

      await GetScreenSample(
        screenDir: '$screenDir',
        screenName: '${name.pascalCase}Screen',
        controllerDir: '$controllerDir',
        controllerName: '${name.pascalCase}Controller',
      ).create();
    } else {
      LogService.error(
        'Declare a name for your screen: get create screen:"Name of your Screen"',
      );
    }
    // String name = isProject ? 'home' : this.name;
    // String baseFolder = 'lib/presentation/';
    // String screenDir = '${name.snakeCase}/${name.snakeCase}.screen.dart';
    // String controllerDir =
    //     'presentation/${name.snakeCase}/controllers/${name.snakeCase}.controller.dart';
    // String bindingDir =
    //     'lib/infrastructure/navigation/bindings/controllers/${name.snakeCase}.controller.binding.dart';

    // await GetViewSample('$baseFolder/$screenDir', '${name.pascalCase}Screen',
    //         '${name.pascalCase}Controller', controllerDir)
    //     .create();

    // await addExport('lib/presentation/screens.dart', 'export \'$screenDir\';');
    // await BindingSample(bindingDir, name, '${name.pascalCase}ControllerBinding',
    //         controllerDir)
    //     .create();
    // await addExport(
    //     'lib/infrastructure/navigation/bindings/controllers/controllers_bindings.dart',
    //     '''export '${name.snakeCase}.controller.binding.dart';''');

    // await ControllerSample('lib/$controllerDir', name).create();

    // await arcAddRoute(name);
  }

  @override
  String get hint => 'Create a screen';

  @override
  bool validate() => true;
}
