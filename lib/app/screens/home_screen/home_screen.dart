import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pillsreminder/app/components/custom_button.dart';
import 'package:pillsreminder/app/components/custom_textfield.dart';
import 'package:pillsreminder/app/screens/add_screen/add_screen.dart';
import 'package:pillsreminder/app/screens/edit_screen/edit_screen.dart';
import 'package:pillsreminder/app/utils/database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Center(
                    child: CustomTextField(
                      backgroundColor: Color(0xFFF8F8F6),
                      icon: "pesquisar",
                      hintText: "Pesquisar",
                      controller: TextEditingController(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "Olá,",
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: "semi-bold",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 30,
                  ),
                  child: Text(
                    "${FirebaseAuth.instance.currentUser!.displayName}",
                    style: TextStyle(
                      fontFamily: "regular",
                      fontSize: 28,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text(
                    "Revisão diária",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                      future: getLembretes(),
                      builder: (context,
                          AsyncSnapshot<List<QueryDocumentSnapshot>> docs) {
                        if (docs.hasData && docs.data!.length > 0) {
                          return ListView(
                            physics: BouncingScrollPhysics(),
                            children: [
                              ...docs.data!.map(
                                (lem) => GestureDetector(
                                  onTap: () async {
                                    await Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EditScreen(lem: lem),
                                      ),
                                    );
                                    setState(() {});
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 15),
                                    padding:
                                        EdgeInsets.only(left: 15, right: 15),
                                    alignment: Alignment.centerLeft,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0xFFF8F8F6),
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 15),
                                          child: Image.asset(
                                            "images/pilula.png",
                                            height: 30,
                                          ),
                                        ),
                                        Expanded(
                                            child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: Text(
                                                  "${lem["nome"]}",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(),
                                                child: Text(
                                                  "${lem["notificacao"]}",
                                                  style: TextStyle(
                                                    color: Color(0xFF9B9B9B),
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                        Padding(
                                          padding: EdgeInsets.only(left: 15),
                                          child: Image.asset(
                                            "images/vector.png",
                                            height: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                        return Column(
                          children: [Text("Não há lembretes")],
                        );
                      }),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Center(
                    child: GestureDetector(
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AddScreen(),
                          ),
                        );
                        setState(() {});
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFF1BD15D),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
