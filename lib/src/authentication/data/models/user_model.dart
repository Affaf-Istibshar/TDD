import 'dart:convert';

import 'package:testdrivndevelopment/core/utils/typedef.dart';
import 'package:testdrivndevelopment/src/authentication/domain/entities/user.dart';

// extends the user entity
class UserModel extends User {
  const UserModel({
    //parent class User getting parameters from there
    required super.avatar,
    required super.name,
    required super.createdAt,
    required super.id,
  });

  const UserModel.empty():
        this(
        id: '1',
        avatar: '_empty.avatar',
        createdAt: '_empty.createdAt',
        name: '_empty.name',
      );

  //when data received as json , String source from json
  //factory constructor
  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source) as DataMap);

  //copyWith method.. take each property of the class .. recreate new version of objects
  // make sure to make them nullable,,, returns a user model... what property we have what we change
UserModel copyWith({
    String? avatar,
  String? id,
  String? name,
  String? createdAt,
}) {
  //return a new userModel
  return UserModel(
      avatar: avatar ?? this.avatar,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id);
}
  //entity is blueprint and models are extensions of entities...
  UserModel.fromMap(DataMap map)
      : this(
          avatar: map['avatar'] as String,
          id: map['id'] as String,
          name: map['name'] as String,
          createdAt: map['createdAt'],
        );
  //sending data to server DataMap to server.... toMap
  DataMap toMap() => {
    'id': id,
    'avatar' : avatar,
    'createdAt' : createdAt,
    'name': name,
  };
  //what about (toJson , toMap)
  // map in Json format...
String toJson() => jsonEncode(toMap());

// void main() {
//   const user = UserModel.empty();
//   final newUser = user.copyWith(name: 'Sana');
// }
}
