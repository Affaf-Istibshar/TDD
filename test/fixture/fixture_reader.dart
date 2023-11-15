import 'dart:io';

String fixture(String fileName) =>
    File('test/fixture/$fileName').readAsStringSync();
