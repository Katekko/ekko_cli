import 'package:ekko_cli/core/sample.dart';
import 'package:recase/recase.dart';

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
  bool get overwrite => false;

  @override
  String get path => _path;

  @override
  String get content =>
      '''import '../../../domain/core/abstractions/presentation/controllers/$_on/${_name.snakeCase}_controller.interface.dart';

class $_fileName implements I$_fileName {
  //TODO: Implement $_fileName

  final _katekko = 'katekko';

  @override
  String get katekko => _katekko;
}
''';
}
