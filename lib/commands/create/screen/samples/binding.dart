import 'package:ekko_cli/core/sample.dart';
import 'package:recase/recase.dart';

class BindingSample extends Sample {
  final String _path;
  final String _controllerName;
  final String _controllerImport;
  final String _bindingName;

  BindingSample({
    required String path,
    required String controllerName,
    required String controllerImport,
    required String bindingName,
  })  : _path = path,
        _controllerName = controllerName,
        _controllerImport = controllerImport,
        _bindingName = bindingName;

  @override
  String get content => '''import 'package:get/get.dart';

import '$_controllerImport';

class $_bindingName extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<I${_controllerName.pascalCase}>(makeController);
  }
}

IHomeController makeController() {
  return HomeController();
}
''';

  @override
  bool get overwrite => false;

  @override
  String get path => _path;
}
