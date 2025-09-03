import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

abstract class UserRepository{
  Stream<MyUser?> get user;

  Future<MyUser> signUp(MyUser myUser, String password);

  Future<void> setUserData(MyUser myUser);

  Future<void> signIn(String email, String password);

  Future<void> logout();
}