import 'package:firebase_auth/firebase_auth.dart';

Future<void> updateDisplayName(String newName) async {
  final User? firebaseUser = FirebaseAuth.instance.currentUser;

  if (firebaseUser!.displayName == newName) return;

  await firebaseUser.updateDisplayName(newName.trim());
  await firebaseUser.reload();
}

bool isNewUser = false;
