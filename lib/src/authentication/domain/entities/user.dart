import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String createdAt;
  final String avatar;
  const User.empty() :
      this(id:  '1',
      createdAt: '_empty.createdAt',
        avatar: '_empty.avatar',
        name: '_empty.name',
      );
  const User(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.avatar});

  @override
  List<Object?> get props =>  [id];
}
