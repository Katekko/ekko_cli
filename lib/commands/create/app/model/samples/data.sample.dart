import 'package:ekko_cli/core/sample.dart';
import 'package:recase/recase.dart';

class DataSample extends Sample {
  final String _path;
  final String _fileName;
  DataSample({required String path, required String fileName})
      : _path = path,
        _fileName = fileName;

  String get name => _fileName.split('D')[0];

  @override
  String get content =>
      '''import 'package:json_annotation/json_annotation.dart';

part '${name.snakeCase}.data.g.dart';

@JsonSerializable()
class $_fileName {
  final int id;
  const $_fileName({required this.id});

  factory $_fileName.fromJson(Map<String, dynamic> json) =>
      _\$${_fileName}FromJson(json);

  Map<String, dynamic> toJson() => _\$${_fileName}ToJson(this);
}
''';

  @override
  bool get overwrite => false;

  @override
  String get path => _path;
}
