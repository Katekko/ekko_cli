import 'package:ekko_cli/core/sample.dart';
import 'package:recase/recase.dart';

class BindingSample extends Sample {
  final String _path;
  final String _name;
  final String _controllerImport;

  BindingSample({
    required String path,
    required String name,
    required String controllerImport,
  })  : _path = path,
        _name = name,
        _controllerImport = controllerImport;

  @override
  String get content => '''import 'package:get_server/get_server.dart';

import '$_controllerImport';

class ${_name.pascalCase}ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<${_name.pascalCase}Controller>(
      () => ${_name.pascalCase}Controller(),
    );
  }
}
''';

  @override
  bool get overwrite => false;

  @override
  String get path => _path;
}
