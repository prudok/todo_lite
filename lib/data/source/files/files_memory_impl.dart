import 'dart:io';

import 'package:path_provider/path_provider.dart';

import './files.dart';

class FilesMemoryImpl extends Files {
  final Map<String, String> _files = {};

  @override
  Future<void> delete(String path) async {
    _files.remove(path);
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/todos.json');
  }

  Future<File> writeIntoLocalFile(String content) async {
    final file = await _localFile;
    return file.writeAsString(content);
  }

  Future<String?> readFromLocalFile() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      return (contents);
    } catch (error) {
      return ('Could not get data...');
    }
  }

  @override
  Future<String?> read(String path) async {
    return readFromLocalFile();
  }

  @override
  Future<void> write(String path, String content) async {
    writeIntoLocalFile(content);
  }
}
