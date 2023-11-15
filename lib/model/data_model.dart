import 'package:hive_flutter/hive_flutter.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class UserdataModal {
  @HiveField(0)
  String name;
  @HiveField(1)
  String age;
  @HiveField(2)
  String email;
  @HiveField(3)
  String password;
    @HiveField(4)
  String? imgPath = 'assets/images/pokiman.png';
 

  UserdataModal({
    required this.name,
    required this.age,
    required this.email,
    required this.password,
    this.imgPath,
  });
}
