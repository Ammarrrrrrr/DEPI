import "dart:developer";
import "package:firebase_auth/firebase_auth.dart";
import "package:pharmacy_system/model/model.dart";

class AuthService {
  final String firstCollection = "first_collection";
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // creat user obj based on the firebase User
  Customer? _userFromFirebase(User? user) {
    return user != null ? Customer(uid: user.uid, name: user.email?.split('@')[0] ?? "", email: user.email?? "", saved: [], cart: []) : null;
  }
  // auth  change user stream
  Stream<Customer?> get user {
    log("current user from the stream: $user");
    return _auth.authStateChanges()
    .map(_userFromFirebase);
  }

  // sign in anonymous
  Future<Customer?> signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      log("returned anonymous user");
      return _userFromFirebase(user);
    } catch (e) {
      log("execption : sign in anonymous function");
      log(e.toString());
      return null;
    }
  }

  // sign in with email & password
  Future<Customer?> signinEmailPass(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _userFromFirebase(credential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
      else if (e.code == 'invalid-email') {
        log('invalid-email');
      }
      else if (e.code == 'invalid-email-verified') {
        log('invalid-email-verified');
      }
      else if (e.code == 'invalid-password') {
        log('invalid-password');
      }
      else if (e.code == 'uid-already-exists') {
        log('uid-already-exists');
      }
      return null;
    }
  }

  // sign register with email & password
  Future<Customer?> registerEmailPass(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      log("registered and returned UserCredential");
      return _userFromFirebase(credential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }else if (e.code == 'invalid-email') {
        log('invalid-email');
      }
      else if (e.code == 'invalid-email-verified') {
        log('invalid-email-verified');
      }
      else if (e.code == 'invalid-password') {
        log('invalid-password');
      }
      else if (e.code == 'uid-already-exists') {
        log('uid-already-exists');
      }
      return null;
    } catch (e) {
      log("error in firebase creating user with eamil and password $e");
      return null;
    }
  }

  // sign out
  Future singOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      log(e.toString());
      return null;
    }
  }

}
