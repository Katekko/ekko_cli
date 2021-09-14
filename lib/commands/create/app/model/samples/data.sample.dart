import 'package:ekko_cli/core/sample.dart';

class DataSample extends Sample {
  final String _path;
  final String _fileName;
  DataSample({required String path, required String fileName})
      : _path = path,
        _fileName = fileName;

  String get name => _fileName.split('M')[0];

  @override
  String get content =>
      '''import 'package:json_annotation/json_annotation.dart';
part '$_fileName.data.g.dart';

@JsonSerializable()
class ${_fileName}Data {
  final int id;

  ${_fileName}Data({this.id});

  factory ${_fileName}Data.fromJson(Map<String, dynamic> json) =>
      _\$${_fileName}DataFromJson(json);

  Map<String, dynamic> toJson() => _\$${_fileName}DataToJson(this);
}
''';

  @override
  bool get overwrite => false;

  @override
  String get path => _path;
}
