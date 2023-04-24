
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Result {
  final bool result;
  final String errorMsg;

  Result({required this.result, required this.errorMsg});
}

class FirebaseService {
  static final FirebaseService _instance = FirebaseService._internal();

  factory FirebaseService() => _instance;

  FirebaseService._internal();

  Future<Result> registrationWithEmail({email: String, password: String}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch (e) {
      return Result(result: false, errorMsg: e.code);
    } catch (e) {
      return Result(result: false, errorMsg: "");
    }
    return Result(result: true, errorMsg: "");
  }




}