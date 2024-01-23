import 'package:flutter_notes_projects/auth/auth_user.dart';

abstract class AuthProviderForFirebase{
  AuthUser? get currentUser;
  Future<AuthUser> login({required String email,required String password});

  Future<AuthUser> createUser({required String email,required String password});

  Future<void> logOut();

  Future<void> sendEmailVerification();
}