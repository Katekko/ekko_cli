import 'package:ekko_cli/core/sample.dart';
import 'package:recase/recase.dart';

class GetScreenSample extends Sample {
  final String _screenDir;
  final String _controllerName;
  final String _on;
  final String _name;

  GetScreenSample({
    required String screenDir,
    required String controllerName,
    required String on,
    required String name,
  })  : _screenDir = screenDir,
        _controllerName = controllerName,
        _on = on,
        _name = name;

  String get _screenName => '${_name.pascalCase}Screen';

  @override
  bool get overwrite => false;

  @override
  String get path => _screenDir;

  @override
  String get content {
    return '''import 'package:flutter/material.dart';
import '../widgets/$_on/initial.widget.dart';
import '../../shared/view_controller.interface.dart';

class $_screenName extends ViewController<I$_controllerName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_screenName'),
        centerTitle: true,
      ),
      body: Center(child: InitialWidget()),
    );
  }
}
''';
  }
}
