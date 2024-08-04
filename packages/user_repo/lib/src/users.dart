import 'package:user_repo/src/models/models.dart';

abstract class UserRepository {
  Stream<MyUser?> get user;

  Future<MyUser> singUp(MyUser myUser, String password);
  Future<void> setUserData(MyUser myUser);

  Future<void> signIn(String email, String password);

  Future<void> signOut();
}
