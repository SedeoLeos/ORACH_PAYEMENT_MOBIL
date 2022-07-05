import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:orach_payement/providerObjet.dart';
import 'settingsapi.dart';

import 'package:provider/provider.dart';

class Authentification extends StatelessWidget {
  Authentification({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Card(
              color: Color(0xEEA9D4FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Icon(
                Icons.person,
                color: Color(0xFF0A84FF),
                size: 200,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              child: Text(
                "Formulaire de Connexion",
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 10,
            ),
           Consumer<orachUser>(
  builder: (context, user, child) {
    return Text("${user.error}"
    ,
    style: TextStyle(color: Colors.red),);
  },
           ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: TextFormField(
                onChanged: (value) => {
                  context.read<orachUser>().setemail(value),
                },
                decoration: InputDecoration(
                    label: Text("Email"),
                    hintText: "Saisissez votre address mail "),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: TextFormField(
                onChanged: (value) => {
                  context.read<orachUser>().setpassword(value),
                },
                decoration:
                    InputDecoration(hintText: "Saisissez votre mots de passe "),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Mot de passe obliez ?"),
                  SizedBox(
                    width: 5,
                  ),
                  TextButton(onPressed: () {}, child: Text("Clickez ici"))
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                  onPressed: (() async {
                    if (context.read<orachUser>().getemail().isNotEmpty &&
                        context.read<orachUser>().getpassword().isNotEmpty) {
                      

                
                      if (await context.read<orachUser>().loginoarch() == 200) {
                        Navigator.pushReplacementNamed(context, "home");
                      }
                    }
                  }),
                  child: Text("Connexion")),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                  onPressed: (() {
                    Navigator.pushNamed(context, "inscription");
                  }),
                  child: Text("Inscription")),
            ),
          ],
        ),
      )),
    );
  }
}
