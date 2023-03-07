import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class EnviolyFirebaseUser {
  EnviolyFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

EnviolyFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<EnviolyFirebaseUser> enviolyFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<EnviolyFirebaseUser>(
      (user) {
        currentUser = EnviolyFirebaseUser(user);
        return currentUser!;
      },
    );
