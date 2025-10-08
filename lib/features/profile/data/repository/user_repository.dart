
import 'package:tasks/features/profile/domain/entities/user.dart';

class UserRepository {
  Future<User> fetchUser() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));
    
    // Return hardcoded user data without random failures
    return User(
      name: "Alqabiadi",
      email: "aliahmed@example.com",
      location: "alabama",
      id: "00052321",
    );
  }
}