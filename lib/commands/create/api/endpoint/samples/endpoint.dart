import 'package:ekko_cli/core/sample.dart';
import 'package:recase/recase.dart';

class EndpointSample extends Sample {
  final String _endpointDir;
  final String _name;

  EndpointSample({
    required String screenDir,
    required String name,
  })  : _endpointDir = screenDir,
        _name = name;

  String get _controller => 'GetView<${_name.pascalCase}Controller>';

  @override
  String get content {
    return '''import 'dart:async';

import 'package:get_server/get_server.dart';

import '${_name.snakeCase}.controller.dart';

class ${_name.pascalCase}Endpoint extends $_controller {
  @override
  FutureOr<Widget> build(BuildContext context) async {
     try {
       var query = await context.request.query;
       var payload = await context.request.payload();
       var body = await controller.validateBody(payload: payload);

       // TODO: Your actions here

       var response = controller.createResponse();
       return Json(response);
     } catch (err) {
       var errorResponse = controller.createErrorResponse(context, err);
       return Json(errorResponse);
     }
  }
}
''';
  }

  @override
  bool get overwrite => false;

  @override
  String get path => _endpointDir;
}
