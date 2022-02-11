import 'package:ekko_cli/core/sample.dart';
import 'package:recase/recase.dart';

class GetScreenSample extends Sample {
  final String _screenDir;
  final String _on;
  final String _name;

  GetScreenSample({
    required String screenDir,
    required String controllerName,
    required String on,
    required String name,
  })  : _screenDir = screenDir,
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

//TODO: Implement $_screenName
class $_screenName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('$_screenName'),
        centerTitle: true,
      ),
      body: Center(child: InitialWidget()),
    );
  }
}
''';
  }
}
