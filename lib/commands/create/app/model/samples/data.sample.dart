import 'package:ekko_cli/core/sample.dart';
import 'package:recase/recase.dart';

class DataSample extends Sample {
  final String _path;
  final String _fileName;
  final Map<String, String>? _attributs;
  DataSample({
    required String path,
    required String fileName,
    Map<String, String>? attributs,
  })  : _path = path,
        _fileName = fileName,
        _attributs = attributs;

  String get name => _fileName.split('D')[0];

  String get getAttributs {
    var str = '';
    if (_attributs != null) {
      for (final key in _attributs!.keys) {
        str += '''\n  final $key ${_attributs![key]};''';
      }
    }
    return str;
  }

  String get getConstructor {
    var str = '';
    if (_attributs != null) {
      for (final key in _attributs!.keys) {
        str += ', required this.${_attributs![key]}';
      }
    }
    return str;
  }

  @override
  String get content =>
      '''import 'package:json_annotation/json_annotation.dart';

part '${name.snakeCase}.data.g.dart';

@JsonSerializable()
class $_fileName {
  final int id;
  $getAttributs
  const $_fileName({required this.id$getConstructor});

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
