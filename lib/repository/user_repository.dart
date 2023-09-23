// TODO Implement this library.

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';


class UserRepository {
  late final FirebaseAuth _firebaseAuth;

  late final FirebaseFirestore db ;

  // Crée une référence vers la collection `farms`.

 late CollectionReference farmsRef;

 late  String name;

  var storage;

  var user;

  UserRepository({FirebaseAuth? firebaseAuth , required this.db, required storage}){
    _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

    farmsRef = db.collection('Farm');




  }

  Future<UserCredential> signInWithCredentials(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signUp(String name ,String email, String password , image) async {
    this.name = name ;
    UserCredential userCredentials = await _firebaseAuth.createUserWithEmailAndPassword(

      email: email,
      password: password,
    );

    String? userId;
    await  this.storage.ref().child(image.path)
        .putFile(image).then((p0) async =>
    {
      p0.ref.getDownloadURL().then((value) async => {
     userId = userCredentials.user?.uid,
    await this.db.collection('users').doc(email).set({
    'name': this.name,
      'image':value
    })
      })
    });

    return userCredentials ;
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