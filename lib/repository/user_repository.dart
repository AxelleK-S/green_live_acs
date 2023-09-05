// TODO Implement this library.

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class UserRepository {
  late final FirebaseAuth _firebaseAuth;

  late final FirebaseFirestore db ;

  // Crée une référence vers la collection `farms`.

 late CollectionReference farmsRef;

  UserRepository({FirebaseAuth? firebaseAuth , required this.db}){
    _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

    farmsRef = db.collection('Farm');




  }

  Future<UserCredential> signInWithCredentials(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signUp(String email, String password) {
    return _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<Future<List<void>>> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
    ]);
  }
  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<bool> isSignedIn() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future<User?> getUser() async {
    return (_firebaseAuth.currentUser);
  }

  bool isLoggedIn() {
    return _firebaseAuth.currentUser != null;
  }
}