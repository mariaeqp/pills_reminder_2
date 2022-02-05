import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:pillsreminder/app/components/custom_button.dart';
import 'package:pillsreminder/app/components/custom_textfield.dart';
import 'package:pillsreminder/app/utils/messages.dart';

class EditScreen extends StatelessWidget {
  late TextEditingController nome = TextEditingController();
  late TextEditingController qtd = TextEditingController();
  late TextEditingController qtdDia = TextEditingController();
  late TextEditingController notificacao = TextEditingController();
  QueryDocumentSnapshot<Object?> lem;
  EditScreen({
    Key? key,
    required this.lem,
  }) : super(key: key) {
    nome = TextEditingController(text: "${lem["nome"]}");
    qtd = TextEditingController(text: "${lem["qtd"]}");
    qtdDia = TextEditingController(text: "${lem["qtddia"]}");
    notificacao = TextEditingController(text: "${lem["notificacao"]}");
  }

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
                    "Editar lembrete",
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: "semi-bold",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: CustomTextField(
                    icon: "pilula",
                    backgroundColor: Color(0xFFF8F8F6),
                    title: "Nome do medicamento:",
                    controller: nome,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: CustomTextField(
                            icon: "comprim",
                            backgroundColor: Color(0xFFF8F8F6),
                            controller: qtd,
                            title: "Quantidade:",
                          ),
                        ),
                      ),
                      Expanded(
                        child: CustomTextField(
                          icon: "calendario",
                          backgroundColor: Color(0xFFF8F8F6),
                          controller: qtdDia,
                          title: "Por quantos dias:",
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: CustomTextField(
                    icon: "notificacao",
                    backgroundColor: Color(0xFFF8F8F6),
                    controller: notificacao,
                    title: "Notificação:",
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: CustomButton(
                    backgroundColor: Color(0xFFD11B1B),
                    text: "Excluir",
                    onTap: () async {
                      try {
                        await lem.reference.delete();
                        Navigator.of(context).pop();
                      } catch (e) {
                        Message.showError(context, "Não foi possivel excluir");
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: CustomButton(
                    text: "Salvar alterações",
                    onTap: () async {
                      try {
                        await lem.reference.update({
                          "nome": nome.text,
                          "notificacao": notificacao.text,
                          "email": FirebaseAuth.instance.currentUser!.email,
                          "qtd": qtd.text,
                          "qtddia": qtdDia.text,
                        });
                        Navigator.of(context).pop();
                      } catch (e) {
                        Message.showError(
                            context, "Não foi possivel salvar as alterações");
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
