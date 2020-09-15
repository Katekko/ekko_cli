import 'package:get_cli/core/sample.dart';
import 'package:get_cli/core/utils/pubspec_utils.dart';
import 'package:meta/meta.dart';

class GetScreenSample extends Sample {
  String _screenDir;
  String _controllerName;
  String _controllerDir;
  String _screenName;
  GetScreenSample({
    @required String screenName,
    @required String screenDir,
    @required String controllerName,
    @required String controllerDir,
  }) {
    _screenDir = screenDir;
    _controllerName = controllerName;
    _controllerDir = _controllerDir;
    _screenName = screenName;
  }

  String get _controller => 'GetView<$_controllerName>';

  Future<String> get import async =>
      '''\nimport  'package:${await PubspecUtils.getProjectName()}/$_controllerDir';''';

  @override
  Future<String> get content async {
    return '''import 'package:flutter/material.dart';
import 'package:get/get.dart';
${await import}

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
          style: TextStyle(fontSize:20),
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
