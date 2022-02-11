import 'package:ekko_cli/core/sample.dart';
import 'package:recase/recase.dart';

class BindingTestSample extends Sample {
  final String _path;
  final String _name;

  BindingTestSample({
    required String path,
    required String name,
  })  : _path = path,
        _name = name;

  @override
  bool get overwrite => false;

  @override
  String get path => _path;

  @override
  String get content => '''import 'package:test/test.dart';

void main() {
  test('Should return the correct controller', () {
    final controller = make${_name.pascalCase}Controller();
    expect(controller, isA<${_name.pascalCase}Controller>());
  });
}
''';
}
