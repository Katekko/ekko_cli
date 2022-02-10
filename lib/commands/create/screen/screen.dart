import 'package:ekko_cli/commands/create/create.dart';
import 'package:ekko_cli/common/utils/logger/logger.dart';
import 'package:ekko_cli/core/command.dart';
import 'package:ekko_cli/core/functions/add_export.dart';
import 'package:recase/recase.dart';

import 'functions/add_route.dart';
import 'samples/get_binding.dart';
import 'samples/get_controller.dart';
import 'samples/get_screen.dart';

class CreateScreenCommand extends Command with CreateMixin {
  @override
  String get hint => 'Create a new screen with binding and routes';

  @override
  bool validate() {
    if (hasName) {
      if (withOn) {
        return true;
      } else {
        LogService.error(
          'Declare a location for your screen: ekko create screen:home on <location>',
        );
      }
    } else {
      LogService.error(
        'Declare a name for your screen: ekko create screen:"Name of your Screen"',
      );
    }

    return false;
  }

  @override
  Future<void> execute() async {
    final controllerName = '${name.pascalCase}Controller';
    final controllerBindingName = '${name.pascalCase}ControllerBinding';

    final base = 'lib/presentation/${on.snakeCase}/';
    final screens = '$base/screens';
    final controllers = '$base/controllers';
    final widgets = '$base/widgets';

    final screenDir = '$screens/${name.snakeCase}.screen.dart';
    final controllerDir = '$controllers/${name.snakeCase}.controller.dart';
    final widgetsDir = '$widgets/initial.widget.dart';

    final screensExportsDir = '$screens/screens.dart';
    final controllersExportsDir = '$controllers/controllers.dart';

    final controllerBindingDir =
        'lib/infrastructure/navigation/bindings/controllers/${name.snakeCase}_controller.binding.dart';

    await GetScreenSample(
      screenDir: screenDir,
      controllerName: controllerName,
      name: name,
      on: on,
    ).create();

    await addExport(
      path: '$screens/screens.dart',
      line: 'export \'${name.snakeCase}.screen.dart\';',
    );

    await addExport(
      path: 'lib/presentation/screens.dart',
      line: 'export \'${on.snakeCase}/screens/screens.dart\';',
    );

    await ControllerSample(
      path: controllerDir,
      fileName: controllerName,
      on: on,
      name: name,
    ).create();

    // await addRoute(name);

    // await BindingSample(
    //   path: controllerBindingDir,
    //   bindingName: controllerBindingName,
    //   controllerName: controllerName,
    //   controllerImport:
    //       './../../../../presentation/${name.snakeCase}/controllers/${name.snakeCase}.controller.dart',
    // ).create();

    // await addExport(
    //   path:
    //       'lib/infrastructure/navigation/bindings/controllers/controllers_bindings.dart',
    //   line: '''export '${name.snakeCase}.controller.binding.dart';''',
    // );
  }
}
