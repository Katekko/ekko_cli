import 'package:ekko_cli/core/sample.dart';
import 'package:meta/meta.dart';
import 'package:recase/recase.dart';

class ResponseDtoSample extends Sample {
  String _path;
  String _fileName;
  ResponseDtoSample({@required String path, @required String fileName}) {
    _path = path;
    _fileName = fileName;
  }

  @override
  String get content =>
      '''import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part '${_fileName.snakeCase}.response.g.dart';

@JsonSerializable()
class ${_fileName.pascalCase}Response {
  final bool success;
  final DataResponse data;
  final String error;

  const ${_fileName.pascalCase}Response({@required this.success, this.data, this.error});

  factory ${_fileName.pascalCase}Response.fromJson(json) =>
      _\$${_fileName.pascalCase}ResponseFromJson(json);

  Map<String, dynamic> toJson() => _\$${_fileName.pascalCase}ResponseToJson(this);
}

@JsonSerializable()
class DataResponse {
  const DataResponse();
  factory DataResponse.fromJson(json) => _\$DataResponseFromJson(json);
  Map<String, dynamic> toJson() => _\$DataResponseToJson(this);
}
''';

  @override
  bool get overwrite => false;

  @override
  String get path => _path;
}
