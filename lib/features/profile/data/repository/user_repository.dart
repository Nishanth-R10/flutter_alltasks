import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/features/profile/domain/entities/user.dart';

class UserRepository {
  Future<User> fetchUser() async {
    await Future.delayed(const Duration(seconds: 2));
    
    return User(
      name: DefaultString.instance.userName,
      email: DefaultString.instance.userEmail,
      location: DefaultString.instance.userLocation,
      id: DefaultString.instance.userId,
    );
  }
}