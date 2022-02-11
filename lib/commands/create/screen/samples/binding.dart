import 'package:ekko_cli/core/sample.dart';
import 'package:recase/recase.dart';

class BindingSample extends Sample {
  final String _path;
  final String _controllerName;
  final String _bindingName;
  final String _name;
  final String _on;

  BindingSample({
    required String path,
    required String controllerName,
    required String bindingName,
    required String name,
    required String on,
  })  : _path = path,
        _controllerName = controllerName,
        _bindingName = bindingName,
        _on = on,
        _name = name;

  @override
  bool get overwrite => false;

  @override
  String get path => _path;

  @override
  String get content => '''import 'package:get/get.dart';

import '../../../../domain/core/abstractions/presentation/controllers/$_on/${_name.snakeCase}_controller.interface.dart';
import '../../../../presentation/$_on/controllers/controllers.dart';

class $_bindingName extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<I${_controllerName.pascalCase}>(make${_controllerName.pascalCase});
  }
}

I${_controllerName.pascalCase} make${_controllerName.pascalCase}() {
  return ${_controllerName.pascalCase}();
}
''';
}
