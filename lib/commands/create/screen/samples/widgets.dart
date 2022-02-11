import 'package:ekko_cli/core/sample.dart';

class WidgetsSample extends Sample {
  final String _path;
  final String _controllerName;

  WidgetsSample({
    required String path,
    required String controllerName,
  })  : _path = path,
        _controllerName = controllerName;

  @override
  String get content => '''import 'package:flutter/material.dart';

class InitialWidget extends ViewController<I$_controllerName> {
  @override
  Widget build(BuildContext context) {
    return Text(controller.katekko);
  }
}
''';

  @override
  bool get overwrite => false;

  @override
  String get path => _path;
}