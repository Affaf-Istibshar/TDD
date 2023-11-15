// user models don't depend on anything at all
// Three question to follow....
// Don't MOCK anything ... no need to create mock version of dependency....

//models should be sub classes of entity

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:testdrivndevelopment/core/utils/typedef.dart';
import 'package:testdrivndevelopment/src/authentication/data/models/user_model.dart';
import 'package:testdrivndevelopment/src/authentication/domain/entities/user.dart';

import '../../../../fixture/fixture_reader.dart';

void main() {
  const tModel = UserModel.empty();
  test('should be subclass of [User] entity',
          () {
    //Arrange

    // Act nothing to act on, no fun to call
    //Assert
       expect(tModel, isA<User>());
          });

  final tJson = fixture('user.json');
  final tMap = jsonDecode(tJson) as DataMap;

  group('fromMap', () { 
    test('should return a [UserModel] with correct data',
            () {
      //Arrange

      //Act
         final result = UserModel.fromMap(tMap);
         expect(result, equals(tModel));
      //Assert
            });
  });
  group('fromJson', () {
    test('should return a [UserModel] with correct data',
            () {
          //Arrange

          //Act
          final result = UserModel.fromJson(tJson);
          expect(result, equals(tModel));
          //Assert
        });
  });
  group('toMap', () {
    test('should return a [Map] with right data',
        () {
          //Act
          final result = tModel.toMap();
          expect(result, equals(tMap));
        });
  });
  group('toJson', () {
    test('should return a [Json] with right data ',
        () {
          //Act
          final result = tModel.toJson();
          final tJson = jsonEncode(
              {
                "id": "1",
                "avatar": "_empty.avatar",
                "createdAt": "_empty.createdAt",
              "name": "_empty.name",
              }
          );
          //Assert
          expect(result, tJson);
        });
  });
  group('copyWith', () {
    test('should return a [UserModel] with different data ',
        () {
      //Arrange

          // Act
    final result = tModel.copyWith(name: 'Paul');

          //Assert
          expect(result.name, equals('Paul'));
        });
  });

}

