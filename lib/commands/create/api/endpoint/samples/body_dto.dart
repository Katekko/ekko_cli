import 'package:ekko_cli/core/sample.dart';
import 'package:recase/recase.dart';

class BodyDtoSample extends Sample {
  final String _path;
  final String _fileName;
  BodyDtoSample({required String path, required String fileName})
      : _path = path,
        _fileName = fileName;

  @override
  String get content =>
      '''import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part '${_fileName.snakeCase}.body.g.dart';

@JsonSerializable()
class ${_fileName.pascalCase}Body {
  const ${_fileName.pascalCase}Body();

  factory ${_fileName.pascalCase}Body.fromJson(json) =>
      _\$${_fileName.pascalCase}BodyFromJson(json);

  Map<String, dynamic> toJson() => _\$${_fileName.pascalCase}BodyToJson(this);
}
''';

  @override
  bool get overwrite => false;

  @override
  String get path => _path;
}
