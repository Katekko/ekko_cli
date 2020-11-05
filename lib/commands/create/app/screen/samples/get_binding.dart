import 'package:ekko_cli/core/sample.dart';
import 'package:recase/recase.dart';
import 'package:meta/meta.dart';

class BindingSample extends Sample {
  String _path;
  String _controllerName;
  String _controllerImport;
  String _bindingName;

  BindingSample({
    @required String path,
    @required String controllerName,
    @required String controllerImport,
    @required String bindingName,
  }) {
    _path = path;
    _controllerName = controllerName;
    _controllerImport = controllerImport;
    _bindingName = bindingName;
  }

  @override
  String get content => '''import 'package:get/get.dart';

import '$_controllerImport';

class $_bindingName extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<${_controllerName.pascalCase}>(
      () => ${_controllerName.pascalCase}(),
    );
  }
}
''';

  @override
  bool get overwrite => false;

  @override
  String get path => _path;
}
