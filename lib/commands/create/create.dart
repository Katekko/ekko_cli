import 'package:get_cli/get_cli.dart';

mixin CreateMixin {
  final _args = GetCli.arguments;

  bool get withOn => _args.length > 3 && _args[3] == 'on';
  String get on => GetCli.arguments[4];

  String get name {
    return _args[1].split(':')[1];
  }
}
