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

  // Future<AuthenticateUserBody> validateBody({
  //   @required Map<dynamic, dynamic> payload,
  // }) async {
  //   try {
  //     if (payload == null) throw InvalidBodyException(field: 'payload');

  //     var body = AuthenticateUserBody.fromJson(payload);
  //     if (body.login?.isEmpty ?? true) {
  //       throw InvalidBodyException(field: 'login');
  //     } else if (body.password?.isEmpty ?? true) {
  //       throw InvalidBodyException(field: 'password');
  //     }

  //     return body;
  //   } catch (err) {
  //     rethrow;
  //   }
  // }

  // Future<UserModel> authenticateUser({
  //   @required String login,
  //   @required String password,
  // }) async {
  //   var user = await _authDomainService.authenticateUser(
  //     login: login,
  //     password: password,
  //   );

  //   return user;
  // }

  // String generateToken({@required UserModel user}) {
  //   try {
  //     final claimSet = JwtClaim(
  //       subject: user.id.toString(),
  //       issuer: 'https://gyanburuworld.com/',
  //       issuedAt: DateTime.now(),
  //       expiry: DateTime.now().add(Duration(days: 3)),
  //     );

  //     var token = TokenUtil.generateToken(claim: claimSet);

  //     return token;
  //   } catch (err) {
  //     rethrow;
  //   }
  // }

  // AuthenticateUserResponse createResponse({
  //   @required UserModel user,
  //   @required String token,
  // }) {
  //   var response = AuthenticateUserResponse(
  //     success: true,
  //     data: DataResponse(user: user.toData(), token: token),
  //   );

  //   return response;
  // }

  // AuthenticateUserResponse createErrorResponse(
  //   BuildContext context,
  //   dynamic exception,
  // ) {
  //   String error;
  //   switch (exception.runtimeType) {
  //     case InvalidBodyException:
  //       context.statusCode(400);
  //       error = exception.toString();
  //       break;
  //     case AuthenticationFailedException:
  //       context.statusCode(404);
  //       error = 'User and/or password is wrong';
  //       break;
  //     default:
  //       context.statusCode(500);
  //       error = exception.toString();
  //       break;
  //   }

  //   return AuthenticateUserResponse(success: false, error: error);
  // }
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
}
''';

  @override
  bool get overwrite => false;

  @override
  String get path => _path;
}
