import 'package:user_repo/src/models/models.dart';

abstract class UserRepository {
  Stream<MyUser?> get user;

  Future<void> signIn(String email, String password);
  Future<MyUser> singUp(MyUser myUser, String password);
  Future<void> logOut();
  Future<void> setUserData(MyUser myUser);
}
