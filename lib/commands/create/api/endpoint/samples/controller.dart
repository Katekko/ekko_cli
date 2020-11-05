import 'package:ekko_cli/core/sample.dart';
import 'package:meta/meta.dart';
import 'package:recase/recase.dart';

class ControllerSample extends Sample {
  String _path;
  String _name;
  ControllerSample({@required String path, @required String name}) {
    _path = path;
    _name = name;
  }

  @override
  String get content => '''import 'package:get_server/get_server.dart';
import 'package:meta/meta.dart';

import 'dto/${_name.snakeCase}.body.dart';
import 'dto/${_name.snakeCase}.response.dart';

class ${_name.pascalCase}Controller extends GetxController {
  Future<${_name.pascalCase}Body> validateBody({
    @required Map<dynamic, dynamic> payload,
  }) async {
    try {
      if (payload == null) throw InvalidBodyException(field: 'payload');

      var body = ${_name.pascalCase}Body.fromJson(payload);

      // TODO: Validate body: 
      // if (body.login?.isEmpty ?? true) {
      //   throw InvalidBodyException(field: 'login');
      // } else if (body.password?.isEmpty ?? true) {
      //   throw InvalidBodyException(field: 'password');
      // }

      return body;
    } catch (err) {
      rethrow;
    }
  }


  ${_name.pascalCase}Response createResponse() {
    var response = ${_name.pascalCase}Response(
      success: true, 
      data: DataResponse(),
    );
    return response;
  }

  ${_name.pascalCase}Response createErrorResponse(
    BuildContext context,
    dynamic exception,
  ) {
    String error;
    switch (exception.runtimeType) {
      case InvalidBodyException:
        context.statusCode(400);
        error = exception.toString();
        break;
      default:
        context.statusCode(500);
        error = exception.toString();
        break;
    }

    return ${_name.pascalCase}Response(success: false, error: error);
  }
}
''';

  @override
  bool get overwrite => false;

  @override
  String get path => _path;
}
