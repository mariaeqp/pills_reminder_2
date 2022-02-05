import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pillsreminder/app/screens/home_screen/home_screen.dart';
import 'package:pillsreminder/app/screens/login_screen/login_screen.dart';
import 'package:pillsreminder/app/utils/database.dart';
import 'package:pillsreminder/app/utils/messages.dart';

class Authentication {
  static Future<void> logIn(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => HomeScreen(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Message.showError(context, 'Conta não cadastrada');
      } else if (e.code == 'wrong-password') {
        Message.showError(context, 'A senha está incorreta');
      } else {
        Message.showError(context, 'Usuário/Senha incorreto(s)');
      }
    }
  }

  static Future<User?> signUp({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
    required String user,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        await userCredential.user!.updateDisplayName(name);
        saveUser(
          name: name,
          user: user,
          email: email,
        );
        Message.showMessage(context, 'Cadastro realizado');
        return userCredential.user;
      }
    } catch (e) {
      Message.showError(context, 'Erro ao cadastrar');
    }
  }

  static Future<void> logOut({required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.signOut();
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => LoginScreen(),
        ),
      );
    } catch (e) {
      Message.showError(context, 'Erro ao sair');
    }
  }
}
