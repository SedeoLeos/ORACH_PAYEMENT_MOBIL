import 'package:flutter/material.dart';
import 'package:orach_payement/providerObjet.dart';
import 'package:provider/provider.dart';


class Parametre extends StatelessWidget {
  const Parametre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(),
          Card(
            child: Column(children: [
              Text("nom : "+context.read<orachUser>().nom),
              Text('prenom'+context.read<orachUser>().prenom),
              Text("Sexe"+context.read<orachUser>().sexe),
              Text("Date de Nainssance"),
              Text("Profession"+context.read<orachUser>().profession),
              Text("Entreprise"),
              Text("Fonction "+ context.read<orachUser>().fonction),
              Row(children: [
                ElevatedButton(onPressed: (){}, child: Text("Modifier"))
              ],)

            ],),
          ),
          
        ],
      ),
    );
  }
}