// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pillsreminder/app/components/custom_button.dart';
import 'package:pillsreminder/app/components/custom_textfield.dart';
import 'package:pillsreminder/app/utils/authentication.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final TextEditingController nome = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController user = TextEditingController();
  final TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFFF8F8F6),
                        ),
                        child: Center(
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30, top: 15),
                  child: Text(
                    "Criar um novo usuário",
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: "semi-bold",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: CustomTextField(
                    backgroundColor: Color(0xFFF8F8F6),
                    title: "Nome:",
                    controller: nome,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: CustomTextField(
                    backgroundColor: Color(0xFFF8F8F6),
                    controller: email,
                    title: "Email:",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: CustomTextField(
                    backgroundColor: Color(0xFFF8F8F6),
                    controller: user,
                    title: "Usuário:",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: CustomTextField(
                    backgroundColor: Color(0xFFF8F8F6),
                    isObscure: true,
                    controller: pass,
                    title: "Senha:",
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: CustomButton(
                    text: "Criar",
                    onTap: () async {
                      User? result = await Authentication.signUp(
                        context: context,
                        name: nome.text,
                        email: email.text,
                        password: pass.text,
                        user: user.text,
                      );
                      if (result != null) {
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
