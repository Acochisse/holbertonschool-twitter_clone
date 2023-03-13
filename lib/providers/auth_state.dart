import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

enum Errors {
  none,
  matchError,
  weakError,
  existsError,
  error,
  wrongError,
  noUserError
}

class User {
  final String uid;
  final String email;
  final String displayName;

  User({
    required this.uid,
    required this.email,
    required this.displayName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
      email: json['email'],
      displayName: json['displayName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
    };
  }
}

class Auth extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference<User> _usersRef =
      FirebaseFirestore.instance.collection('users').withConverter<User>(
            fromFirestore: (snapshot, _) {
              return User.fromJson(
                snapshot.data() ?? {},
              );
            },
            toFirestore: (user, _) => user.toJson(),
          );

  User? _user;

  User? get user => _user;

  Future attemptSignUp(
      String email, String name, String password, String passwordConfirmation) async {
    try {
      if (password != passwordConfirmation) {
        throw Errors.matchError;
      }

      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User newUser = User(
        uid: userCredential.user!.uid,
        email: email,
        displayName: name,
      );

      await _usersRef.doc(newUser.uid).set(newUser);

      _user = newUser;

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Errors.weakError;
      } else if (e.code == 'email-already-in-use') {
        throw Errors.existsError;
      } else {
        throw Errors.error;
      }
    } catch (e) {
      throw Errors.error;
    }
  }

  Future attemptLogin(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = userCredential.user?.uid;
      if (uid == null) {
        throw Errors.noUserError;
      }

      final snapshot = await _usersRef.doc(uid).get();
      if (!snapshot.exists) {
        throw Errors.noUserError;
      }

      _user = snapshot.data();

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Errors.noUserError;
      } else if (e.code == 'wrong-password') {
        throw Errors.wrongError;
      } else {
        throw Errors.error;
      }
    } catch (e) {
      throw Errors.error;
    }
  }

  Future attemptSignOut() async {
    try {
      await _auth.signOut();

      _user = null;

      notifyListeners();
    } catch (e) {
      throw Errors.error;
    }
  }

  Future getCurrentUserModel() async {
    final User? user = _auth.currentUser;
    if (user == null) {
      return;
    }

    final snapshot = await _usersRef.doc(user.uid).get();
    if (!snapshot.exists) {
      return;
    }

    _user = snapshot.data();

    notifyListeners();
  }

  Future<void> signOut() async {
    await _auth.signOut();

    _user = null;

    notifyListeners();
  }
}
