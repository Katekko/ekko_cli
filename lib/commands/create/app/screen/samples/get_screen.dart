import 'package:ekko_cli/core/sample.dart';
import 'package:meta/meta.dart';

class GetScreenSample extends Sample {
  String _screenDir;
  String _screenName;
  String _controllerName;
  String _controllerImport;

  GetScreenSample({
    @required String screenName,
    @required String screenDir,
    @required String controllerName,
    @required String controllerImport,
  }) {
    _screenDir = screenDir;
    _controllerName = controllerName;
    _controllerImport = controllerImport;
    _screenName = screenName;
  }

  String get _controller => 'GetView<$_controllerName>';

  @override
  String get content {
    return '''import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '${_controllerImport}';

class $_screenName extends $_controller {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_screenName'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          '$_screenName is working', 
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
''';
  }

  @override
  bool get overwrite => false;

  @override
  String get path => _screenDir;
}
