import 'package:flutter/material.dart';
import 'package:pillsreminder/app/components/custom_button.dart';
import 'package:pillsreminder/app/components/custom_textfield.dart';
import 'package:pillsreminder/app/screens/register_screen/register_screen.dart';
import 'package:pillsreminder/app/utils/authentication.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F6C8),
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
                  padding: EdgeInsets.only(bottom: 50, top: 50),
                  child: Center(
                    child: Image.asset(
                      "images/logo.png",
                      height: 250,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "semi-bold",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15, top: 50),
                  child: CustomTextField(
                    controller: email,
                    hintText: "Email",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: CustomTextField(
                    isObscure: true,
                    controller: pass,
                    hintText: "Senha",
                  ),
                ),
                CustomButton(
                  text: "Entrar",
                  onTap: () async {
                    await Authentication.logIn(
                        context: context,
                        email: email.text,
                        password: pass.text);
                  },
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text(
                          "Não possui uma conta?",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Criar conta",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
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
