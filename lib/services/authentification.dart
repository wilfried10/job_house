// import 'package:firebase_auth/firebase_auth.dart';

// import '../presentation/connection/appuser.dart';
// class Authentification {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   //   AppUser _userFromfire(User user){
//   //   return user != null ?AppUser(uid: user.uid): null;
//   // }
//   Future signInwithEmailAndPassword(String email,String password)async{
//     try {
//       UserCredential result = await _auth.signInWithEmailAndPassword(
//         email: email, password: password);
//         User? user = result.user;
//         return user;
//     } catch (exception) {
//       print(exception.toString());
//       return null;
//     }
//   }



// Future registerInwithEmailAndPassword(String email,String password)async{
//     try {
//       UserCredential result = await _auth.createUserWithEmailAndPassword(
//         email: email, password: password);
//         User? user = result.user;
//         return user;
//     } catch (exception) {
//       print(exception.toString());
//       return null;
//     }
//   }
// }
  
