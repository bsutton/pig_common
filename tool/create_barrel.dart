#! /home/bsutton/.dswitch/active/dart

import 'dart:io';

import 'package:dcli/dcli.dart';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Usage: dart generate_barrel.dart <relative_path>');
    return;
  }

  final relativePath = truepath(arguments[0]);
  final directory = Directory(relativePath);

  if (!directory.existsSync()) {
    print('Error: Directory "$relativePath" does not exist.');
    return;
  }

  final directoryName = directory.uri.pathSegments
      .where((segment) => segment.isNotEmpty)
      .last; // Get the directory name
  final barrelFileName = '$directoryName.g.dart';
  final barrelFilePath = '${directory.path}/$barrelFileName';
  final barrelFile = File(barrelFilePath);

  // Collect all Dart files except the barrel file itself
  final dartFiles = directory
      .listSync()
      .whereType<File>()
      .where((file) =>
          file.path.endsWith('.dart') && !file.path.endsWith(barrelFileName))
      .toList();

  if (dartFiles.isEmpty) {
    print('No Dart files found in "$relativePath".');
    return;
  }

  // Generate export statements
  final exports = dartFiles.map((file) {
    final fileName = file.uri.pathSegments.last;
    return "export '$fileName';";
  }).join('\n');

  // Write the barrel file
  barrelFile.writeAsStringSync('// Generated file. Do not modify.\n\n$exports');
  print('Barrel file created: $barrelFilePath');
}
