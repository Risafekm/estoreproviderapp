
// import 'package:flutter/material.dart';

// class ProviderSignIn extends ChangeNotifier {
//   late String _Uid;
//   late String _Email;

//   String get uid => _Uid;
//   String get email => _Email;

//   FirebaseAuth auth = FirebaseAuth.instance;

//   Future<bool> signUpUser(String email, String password) async {
//     bool retval = false;
//     try {
//       UserCredential userCredential = await auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       if (userCredential.user != null) {
//         _Uid = userCredential.user!.uid;
//         _Email = userCredential.user!.email!;
//         return retval = true;
//       }
//     } catch (e) {
//       print(e);
//     }
//     return retval;
//   }

//   Future<bool> LoginUser(String email, String password) async {
//     bool retval = false;
//     try {
//       UserCredential userCredential = await auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       if (userCredential.user != null) {
//         _Uid = userCredential.user!.uid;
//         _Email = userCredential.user!.email!;
//       }
//     } catch (e) {
//       print(e);
//     }
//     return retval;
//   }
// }
