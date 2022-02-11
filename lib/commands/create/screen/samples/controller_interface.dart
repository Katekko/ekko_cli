import 'package:ekko_cli/core/sample.dart';

class ControllerInterfaceSample extends Sample {
  final String _path;
  final String _fileName;
  ControllerInterfaceSample({
    required String path,
    required String fileName,
  })  : _path = path,
        _fileName = fileName;

  @override
  bool get overwrite => false;

  @override
  String get path => _path;

  @override
  String get content => '''
abstract class $_fileName {
  //TODO: Implement $_fileName
  String get katekko;
}
''';
}
