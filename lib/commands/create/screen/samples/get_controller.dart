import 'package:ekko_cli/core/sample.dart';

class ControllerSample extends Sample {
  final String _path;
  final String _fileName;
  final String _on;
  final String _name;
  ControllerSample({
    required String path,
    required String fileName,
    required String on,
    required String name,
  })  : _path = path,
        _fileName = fileName,
        _on = on,
        _name = name;

  @override
  String get content =>
      '''import 'lib/domain/core/abstractions/presentation/$_on/${_name}_controller.interface.dart';

class $_fileName implements I$_fileName {
  //TODO: Implement $_fileName
}
''';

  @override
  bool get overwrite => false;

  @override
  String get path => _path;
}
