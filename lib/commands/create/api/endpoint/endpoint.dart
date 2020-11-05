import 'package:ekko_cli/commands/create/create.dart';
import 'package:ekko_cli/common/utils/logger/logger.dart';
import 'package:ekko_cli/core/command.dart';
import 'package:ekko_cli/core/functions/add_export.dart';
import 'package:recase/recase.dart';

import 'samples/body_dto.dart';
import 'samples/controller.dart';
import 'samples/endpoint.dart';
import 'samples/response_dto.dart';

class CreateEndpointCommand extends Command with CreateMixin {
  @override
  Future<void> execute() async {
    var hasEndpointName = name != null;
    if (hasEndpointName) {
      if (withOn) {
        var baseFolderPresentation =
            'lib/presentation/endpoints/$on/${name.snakeCase}';

        var screenDir =
            '$baseFolderPresentation/${name.snakeCase}.endpoint.dart';
        var controllerDir =
            '$baseFolderPresentation/${name.snakeCase}.controller.dart';

        var dtoResponseDir =
            '$baseFolderPresentation/dto/${name.snakeCase}.response.dart';
        var dtoBodyDir =
            '$baseFolderPresentation/dto/${name.snakeCase}.body.dart';

        await EndpointSample(screenDir: screenDir, name: name).create();

        await addExport(
          path: 'lib/presentation/endpoint.dart',
          line:
              'export \'endpoints/$on/${name.snakeCase}/${name.snakeCase}.endpoint.dart\';',
        );

        await ControllerSample(path: controllerDir, name: name).create();
        await ResponseDtoSample(path: dtoResponseDir, fileName: name).create();
        await BodyDtoSample(path: dtoBodyDir, fileName: name).create();

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
      } else {
        LogService.error(
          'You need to choose the controller that will hold the endpoint: ekko api create endpoint:"Name of your endpoint" on AnyController',
        );
      }
    } else {
      LogService.error(
        'Choose a name for your endpoint: ekko api create endpoint:"Name of your endpoint" on AnyController',
      );
    }
  }

  @override
  String get hint => 'Create a new screen with binding and routes';

  @override
  bool validate() => true;
}
