import 'package:flutter_notes_projects/auth/auth_provider.dart';
import 'package:flutter_notes_projects/auth/auth_user.dart';

class AuthService implements AuthProviderForFirebase{
  final AuthProviderForFirebase provider;
  const AuthService(this.provider);
  @override
  Future<AuthUser> createUser({required String email, required String password}) {
    // TODO: implement createUser
    return provider.createUser(email: email, password: password);
  }

  @override
  // TODO: implement currentUser
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    return provider.logOut();
  }

  @override
  Future<AuthUser> login({required String email, required String password}) {
    // TODO: implement login
    return provider.login(email: email, password: password);
  }

  @override
  Future<void> sendEmailVerification() {
    // TODO: implement sendEmailVerification
    return provider.sendEmailVerification();
  }
  
}