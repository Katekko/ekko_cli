import 'package:ekko_cli/core/sample.dart';

class ModelSample extends Sample {
  final String _path;
  final String _fileName;
  ModelSample({required String path, required String fileName})
      : _path = path,
        _fileName = fileName;

  String get name => _fileName.split('M')[0];

  @override
  String get content => '''
class $_fileName {
  //TODO: Implement $_fileName
  
  final int id;
  const $_fileName({required this.id});

  factory $_fileName.fromData(${name}Data data) {
    return $_fileName(id: data.id);
  }

  factory $_fileName.fromDao(${name}Dao dao) {
    return $_fileName(id: dao.id);
  }

  ${name}Dao toDao() {
    return ${name}Dao(id: id);
  }
}
''';

  @override
  bool get overwrite => false;

  @override
  String get path => _path;
}
