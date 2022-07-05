import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:orach_payement/home.dart';
import 'package:orach_payement/providerObjet.dart';

class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  late int next_page;
  initState() {
    next_page = 0;
  }

  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(color: Colors.transparent),
          child: Form(
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Container(
                      height: 300,
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        color: Theme.of(context).primaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                              child: Text(
                                "Commençons par faire connaissances ok ?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                              child: Text(
                                "Nous avons besions de quelque information afin de pouvoir créé votre Compte",
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                Expanded(
                  flex: 6,
                  child: PageView(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    onPageChanged: (index) {
                      setState(() {
                        next_page = index;
                      });
                    },
                    controller: controller,
                    children: [
                      profile(),
                      professionui(),
                      Entreprise(),
                      authetification(),
                      ValierCode(),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          next_page == 0
                              ? Container()
                              : Container(
                                  height: 60,
                                  child: TextButton(
                                      onPressed: () {
                                        if (next_page > 0) {
                                          controller.previousPage(
                                              duration: Duration(seconds: 1),
                                              curve: Curves.easeIn);
                                        }
                                      },
                                      child: Row(
                                        children: [
                                          Icon(Icons.navigate_before),
                                          Text("Retour")
                                        ],
                                      )),
                                ),
                          Container(
                              width: 60,
                              height: 60,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100)),
                              child: next_page < 4
                                  ? ElevatedButton(
                                      onPressed: () {
                                        if (next_page < 4) {
                                          controller.nextPage(
                                              duration: Duration(seconds: 1),
                                              curve: Curves.easeIn);
                                        } else {
                                          // Dialog_fonfirmation(context);
                                        }
                                      },
                                      child: Icon(Icons.navigate_next),
                                    )
                                  : Container())
                        ],
                      ),
                    ),
                    if (next_page < 4)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Si vous avez deja un compte orach"),
                          TextButton(
                            onPressed: () {},
                            child: Text("Cliquez ici"),
                          ),
                        ],
                      ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class authetification extends StatelessWidget {
  String email = "";
  String pass = "";
  String pass2 = "";
  String numero = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                onChanged: ((value) {
                  numero = value;
                }),
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    helperText: "Numero",
                    hintText: "Saisissez votre numero "),
              ),
              TextFormField(
                onChanged: ((value) {
                  email = value;
                }),
                decoration: InputDecoration(
                    hintText: "Saisissez votre address mail "),
              ),
              Text(
                "Address mail",
                style: TextStyle(
                  color: Color(0xFF0A84FF),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  onChanged: ((value) {
                    pass = value;
                  }),
                  decoration: InputDecoration(
                      hintText: "Saisissez votre mot de passe "),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  onChanged: ((value) {
                    var pass2 = value;
                  }),
                  decoration: InputDecoration(
                      hintText: "Confirmer votre mot de passe "),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//inscription_profite

class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Information personnelle",
                  style: TextStyle(
                    color: Color(0xFF0A84FF),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    onChanged: ((value) {
                      context.read<orachUser>().setNom = value;
                    }),
                    decoration: InputDecoration(
                      hintText: "Saisissez votre nom ",
                      label: Text("Nom"),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    onChanged: ((value) {
                      context.read<orachUser>().setPrenom = value;
                    }),
                    decoration: InputDecoration(
                      hintText: "Saisissez votre prenom ",
                      label: Text("Prenom"),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              onChanged: ((value) {
                context.read<orachUser>().setDatenaiss = value;
              }),
              decoration: InputDecoration(
                  label: Text("Date de naissance"),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Saisissez votre date de naissance "),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                Text(
                  "Masquez l'année",
                  style: TextStyle(
                    color: Color(0xFF0A84FF),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Civiliter"),
                  Consumer<orachUser>(builder: (context, valeur, child) {
                    return Card(
                      elevation: 10,
                      color: Theme.of(context).primaryColor,
                      child: SizedBox(
                        width: 200,
                        child: DropdownButton<String>(
                            underline: Container(),
                            isExpanded: true,
                            value: valeur.getSexe,
                            dropdownColor: Theme.of(context).primaryColor,
                            items: const [
                              DropdownMenuItem(
                                value: "Monsieur",
                                child: Text("Monsieur"),
                              ),
                              DropdownMenuItem(
                                  value: "Madame", child: Text("Madame"))
                            ],
                            onChanged: (val) {
                              print(val);
                              valeur.setSexe = val;
                            }),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//inscription_professionui

class professionui extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      margin: EdgeInsets.all(20),
      child: Consumer<orachUser>(
        builder: (context, profession, child) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Vous etes actuellement ",
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black54,
                  )),
              child: ListTile(
                title: const Text('Professionnelle RH (-30 ans)'),
                subtitle: Text(
                    "Vous etes responsable ou en charge de la politique RH,du developpement RH de la gestion RH ou encors des relations sociales au sein de votre organisation"),
                leading: Radio(
                  value: "Professionnelle RH",
                  groupValue: profession.getProfession,
                  onChanged: (val) {
                    profession.setProfession = val.toString();
                    print(val.toString());
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black54,
                  )),
              child: ListTile(
                title: const Text("RH en recherche d'emploi (-30 ans) "),
                subtitle: Text(
                    "Vous etes responsable ou en charge de la politique RH,du developpement RH de la gestion RH ou encors des relations sociales au sein de votre organisation"),
                leading: Radio(
                  value: "RH Chercheur",
                  groupValue: profession.getProfession,
                  onChanged: (val) {
                    profession.setProfession = val.toString();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black54,
                  )),
              child: ListTile(
                title: const Text("RH en recherche d'emploi (-30 ans) "),
                subtitle: Text(
                    "Vous exercez des missions RH ou de conseil pour le compte d'une organisation tierce ou d'un client RH."),
                leading: Radio(
                  value: "Expert RH",
                  groupValue: profession.getProfession,
                  onChanged: (val) {
                    profession.setProfession = val.toString();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black54,
                  )),
              child: ListTile(
                title: const Text(
                    "Etudiant ,alternant ou jeune diploméRH (-30 ans) "),
                subtitle: Text(
                    "Vous etes on formation pour exercer dans une direction RH ou équivalent ou venez d'obtenir ce diplome"),
                leading: Radio(
                  value: "Etudiant",
                  groupValue: profession.getProfession,
                  onChanged: (val) {
                    profession.setProfession = val.toString();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

// inscription_Entreprise

class Entreprise extends StatelessWidget {
  var valeur = <String>["DRH", "0"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: TextFormField(
                onChanged: ((value) {
                  context.read<orachUser>().setEntreprise = value;
                }),
                decoration: InputDecoration(
                    hintText: "Saisissez le nom de l'entreprise"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Card(
                elevation: 10,
                color: Theme.of(context).primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 20),
                    Text("Poste"),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Consumer<orachUser>(
                        builder: (context, fonction, child) =>
                            DropdownButton<String>(
                                disabledHint: Text("ok"),
                                underline: Container(),
                                isExpanded: true,
                                value: fonction.getFonction,
                                dropdownColor: Theme.of(context).primaryColor,
                                items: const [
                                  DropdownMenuItem(
                                    value: "DRH",
                                    child:
                                        Text("Directeur des ressource humain"),
                                  ),
                                  DropdownMenuItem(
                                      value: "DRHP",
                                      child: Text("DRH à temps partagé")),
                                  DropdownMenuItem(
                                      value: "RRHI",
                                      child: Text(
                                          "Responsable Ressources Humaines à l'international")),
                                  DropdownMenuItem(
                                      value: "DGRH",
                                      child: Text(
                                          "Directeur General des Ressources Humaines")),
                                  DropdownMenuItem(
                                      value: "DRS",
                                      child: Text(
                                          "Directeur des Relations Sociales")),
                                  DropdownMenuItem(
                                      value: "VPRH",
                                      child: Text(
                                          "Directeur Vice-président encharge des Ressources Humaines")),
                                  DropdownMenuItem(
                                      value: "CMRH",
                                      child: Text("Chargé de mission RH")),
                                  DropdownMenuItem(
                                      value: "CPRH",
                                      child: Text("Chef de Projet RH"))
                                ],
                                onChanged: (val) {
                                  fonction.setFonction = val;
                                }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Card(
                elevation: 10,
                color: Theme.of(context).primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 20),
                    Text("Effective"),
                    SizedBox(
                      width: 20,
                    ),
                    //  Expanded(
                    //   child: DropdownButton<String>(
                    //       disabledHint: Text("ok"),
                    //       underline: Container(),
                    //       isExpanded: true,
                    //       value: valeur[1],
                    //       dropdownColor: Theme.of(context).primaryColor,
                    //       items: const [
                    //         DropdownMenuItem(
                    //           value: "0",
                    //           child: Text("0 -10 employees"),
                    //         ),
                    //         DropdownMenuItem(
                    //             value: "10", child: Text("11 -49 employés")),
                    //         DropdownMenuItem(
                    //             value: "50", child: Text("50 -299 employés")),
                    //         DropdownMenuItem(
                    //             value: "300", child: Text("300 -999 employés")),
                    //         DropdownMenuItem(
                    //             value: "1000", child: Text(">1000 employés")),
                    //       ],
                    //       onChanged: (val) {

                    //           valeur[1] = val.toString();

                    //       }),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ValierCode extends StatefulWidget {
  ValierCode({Key? key}) : super(key: key);

  @override
  State<ValierCode> createState() => _ValierCodeState();
}

class _ValierCodeState extends State<ValierCode> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _Opt_Flied(first: true, last: false),
                _Opt_Flied(first: true, last: false),
                _Opt_Flied(first: true, last: false),
                _Opt_Flied(first: true, last: false),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Home.pageName);
                    },
                    child: Text("Valider"))
              ],
            )
          ],
        ));
  }

  _Opt_Flied({required bool first, last}) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 0.7,
        child: TextField(
          autofocus: true,
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.0, color: Colors.black12),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1.0, color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            } else if (value.length == 1 && first == true) {
              FocusScope.of(context).previousFocus();
            }
          },
        ),
      ),
    );
  }
}
