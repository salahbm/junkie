import 'package:user_repo/src/models/my-user.dart';
import 'package:user_repo/src/users.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUserRepo implements UserRepository {
  final FirebaseAuth _firebaseAuth;
  final usersCollections = FirebaseFirestore.instance.collection('users');

  FirebaseUserRepo({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<void> setUserData(MyUser myUser) {
    // TODO: implement setUserData
    throw UnimplementedError();
  }

  @override
  Future<void> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<MyUser> singUp(MyUser myUser, String password) {
    // TODO: implement singUp
    throw UnimplementedError();
  }

  @override
  // TODO: implement user
  Stream<MyUser?> get user => throw UnimplementedError();
}
