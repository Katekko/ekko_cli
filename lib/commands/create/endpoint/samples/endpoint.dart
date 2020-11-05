import 'package:ekko_cli/core/sample.dart';
import 'package:meta/meta.dart';

class EndpointSample extends Sample {
  String _endpointDir;
  String _endpointName;
  String _controllerName;
  String _controllerImport;

  EndpointSample({
    @required String screenName,
    @required String screenDir,
    @required String controllerName,
    @required String controllerImport,
  }) {
    _endpointDir = screenDir;
    _controllerName = controllerName;
    _controllerImport = controllerImport;
    _endpointName = screenName;
  }

  String get _controller => 'GetView<$_controllerName>';

// import 'dart:async';

// import 'package:get_server/get_server.dart';

// import 'authenticate_user.controller.dart';

// class AuthenticateUserEndpoint extends GetView<AuthenticateUserController> {
//   @override
//   FutureOr<Widget> build(BuildContext context) async {
//     try {
//       var payload = await context.request.payload();

//       var body = await controller.validateBody(payload: payload);

//       var user = await controller.authenticateUser(
//         login: body.login,
//         password: body.password,
//       );

//       var token = controller.generateToken(user: user);

//       var response = controller.createResponse(user: user, token: token);

//       return Json(response);
//     } catch (err) {
//       var errorResponse = controller.createErrorResponse(context, err);
//       return Json(errorResponse);
//     }
//   }
// }

  @override
  String get content {
    return '''import 'dart:async';

import 'package:get_server/get_server.dart';

import '${_controllerImport}';

class $_endpointName extends $_controller {
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
