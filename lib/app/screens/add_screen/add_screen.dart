import 'package:flutter/material.dart';
import 'package:pillsreminder/app/components/custom_button.dart';
import 'package:pillsreminder/app/components/custom_textfield.dart';
import 'package:pillsreminder/app/utils/database.dart';

class AddScreen extends StatelessWidget {
  AddScreen({Key? key}) : super(key: key);
  final TextEditingController nome = TextEditingController();
  final TextEditingController qtd = TextEditingController();
  final TextEditingController qtdDia = TextEditingController();
  final TextEditingController notificacao = TextEditingController();
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
                    "Adicionar lembrete",
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
                    hintText: "Ex: Ocitocina",
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
                            hintText: "Ex: 10",
                            backgroundColor: Color(0xFFF8F8F6),
                            controller: qtd,
                            title: "Quantidade:",
                          ),
                        ),
                      ),
                      Expanded(
                        child: CustomTextField(
                          icon: "calendario",
                          hintText: "Ex: 10 dias",
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
                    hintText: "Ex: 10:00",
                    backgroundColor: Color(0xFFF8F8F6),
                    controller: notificacao,
                    title: "Notificação:",
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: CustomButton(
                    text: "Feito",
                    onTap: () async {
                      bool result = await addLembrete(
                        context: context,
                        name: nome.text,
                        qtd: qtd.text,
                        qtdDia: qtdDia.text,
                        notificacao: notificacao.text,
                      );

                      if (result) {
                        Navigator.pop(context);
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
