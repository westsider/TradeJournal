import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class TradeJournalFirebaseUser {
  TradeJournalFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

TradeJournalFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<TradeJournalFirebaseUser> tradeJournalFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<TradeJournalFirebaseUser>(
            (user) => currentUser = TradeJournalFirebaseUser(user));
