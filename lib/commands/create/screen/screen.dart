import 'package:ekko_cli/commands/create/create.dart';
import 'package:ekko_cli/common/utils/logger/logger.dart';
import 'package:ekko_cli/core/command.dart';
import 'package:ekko_cli/core/functions/add_export.dart';
import 'package:ekko_cli/ekko_cli.dart';
import 'package:recase/recase.dart';

import 'functions/add_route.dart';
import 'samples/get_binding.dart';
import 'samples/get_controller.dart';
import 'samples/get_screen.dart';

class CreateScreenCommand extends Command with CreateMixin {
  @override
  Future<void> execute() async {
    var split = EkkoCli.arguments[1].split(':');
    var hasScreenName = split.length == 2;
    if (hasScreenName) {
      var baseFolderPresentation = 'lib/presentation/${name.snakeCase}';

      var screenName = '${name.pascalCase}Screen';
      var controllerName = '${name.pascalCase}Controller';
      var controllerBindingName = '${name.pascalCase}ControllerBinding';

      var screenDir = '$baseFolderPresentation/${name.snakeCase}.screen.dart';
      var controllerDir =
          '$baseFolderPresentation/controllers/${name.snakeCase}.controller.dart';
      var controllerBindingDir =
          'lib/infrastructure/navigation/bindings/controllers/${name.snakeCase}.controller.binding.dart';

      await GetScreenSample(
        screenDir: screenDir,
        screenName: screenName,
        controllerImport: './controllers/${name.snakeCase}.controller.dart',
        controllerName: controllerName,
      ).create();

      await addExport(
        path: 'lib/presentation/screens.dart',
        line: 'export \'./${name.snakeCase}/${name.snakeCase}.screen.dart\';',
      );

      await ControllerSample(
        path: controllerDir,
        fileName: controllerName,
      ).create();

      await addRoute(name);

      await BindingSample(
        path: controllerBindingDir,
        bindingName: controllerBindingName,
        controllerName: controllerName,
        controllerImport:
            './../../../../presentation/${name.snakeCase}/controllers/${name.snakeCase}.controller.dart',
      ).create();

      await addExport(
        path:
            'lib/infrastructure/navigation/bindings/controllers/controllers_bindings.dart',
        line: '''export '${name.snakeCase}.controller.binding.dart';''',
      );
    } else {
      LogService.error(
        'Declare a name for your screen: get create screen:"Name of your Screen"',
      );
    }
  }

  @override
  String get hint => 'Create a new screen with binding and routes';

  @override
  bool validate() => true;
}
