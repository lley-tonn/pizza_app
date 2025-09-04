import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:user_repository/src/user_repo.dart';
import 'package:user_repository/user_repository.dart';

class FirebaseUserRepo implements UserRepository{
  final FirebaseAuth _firebaseAuth;
  final userCollection = FirebaseFirestore.instance.collection('users');

  FirebaseUserRepo({
    FirebaseAuth? firebaseAuth,
  }): _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

    @override
  Stream<dynamic> get user {
    return _firebaseAuth.authStateChanges().flatMap((firebaseUser) async*{
      if (firebaseUser == null) {
        yield MyUser.empty;
      } else{
        yield userCollection
        .doc(firebaseUser.uid)
        .get()
        .then((value) => MyUser.fromEntity(entity))
      }
    });
  }

    @override
  Future<void> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }
  
  @override
  Future<dynamic> signUp(myUser, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
  
  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
  
  @override
  Future<void> setUserData(myUser) {
    // TODO: implement setUserData
    throw UnimplementedError();
  }

}