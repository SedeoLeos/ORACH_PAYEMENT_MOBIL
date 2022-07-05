import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'settingsapi.dart';

String urllogin = "http://0.0.0.0:8000/api/login/";
String urlregister = "http://0.0.0.0:8000/api/register/";
String urlselectuser = ApiUrl + "Users/?email=";

class orachUser with ChangeNotifier {
  var id;
  String nom = "";
  String prenom = "";
  String sexe = "Monsieur";
  String datenaiss = "";
  String profession = "Professionnelle RH";
  String fonction =  "DRH";
  int tel = 0;
  String email = "";

  String token = "";
  String password = "";
  String error = "";
  String entreprise = '';
  late int code;

  get getNom => this.nom;

  set setNom(nom) {
    this.nom = nom;
    notifyListeners();
  }

  get getPrenom => this.prenom;

  set setPrenom(prenom) {
    this.prenom = prenom;
    notifyListeners();
  }

  get getSexe => this.sexe;

  set setSexe(sexe) {
    this.sexe = sexe;
   
    notifyListeners();
  }

  get getDatenaiss => this.datenaiss;

  set setDatenaiss(datenaiss) {
    this.datenaiss = datenaiss;
    notifyListeners();
  }

  get getProfession => this.profession;

  set setProfession(profession) {
    this.profession = profession;
    notifyListeners();
  }

  get getFonction => this.fonction;

  set setFonction(fonction) {
    this.fonction = fonction;
    notifyListeners();
  }

  get getTel => this.tel;

  set setTel(tel) {
    this.tel = tel;
    notifyListeners();
  }

  get getEmail => this.email;

  set setEmail(email) {
    this.email = email;
    notifyListeners();
  }

  get getToken => this.token;

  set setToken(token) {
    this.token = token;
    notifyListeners();
  }

  get getPassword => this.password;

  set setPassword(password) {
    this.password = password;
    notifyListeners();
  }

  get getEntreprise => this.entreprise;

  set setEntreprise(entreprise) {
    this.entreprise = entreprise;
    notifyListeners();
  }

  get getCode => this.code;

  set setCode(code) {
    this.code = code;
    notifyListeners();
  }

  void setemail(email) {
    this.email = email;
    notifyListeners();
  }

  String getemail() {
    return email;
  }

  void setpassword(password) {
    this.password = password;
    notifyListeners();
  }

  String getpassword() {
    return password;
  }

  Future<int> emailsearch(email) async {
    String emailurl = urlselectuser + email;

    final responsesprofil = await http.get(Uri.parse(emailurl));

    var data = jsonDecode(responsesprofil.body);

    id = data[0]["id"];
    prenom = data[0]["first_name"];
    nom = data[0]["last_name"];
    profession = data[0]["profession"];
    fonction = data[0]["fonction"];
    sexe = data[0]["sexe"];

    notifyListeners();
    return 0;
  }

  Future<int> loginoarch() async {
    print("$email, $password");

    try {
      final response = await http.post(Uri.parse(urllogin), body: {
        "username": email,
        "password": password,
      });

      code = response.statusCode;

      if (response.statusCode == 200) {
        token = jsonDecode(response.body)["token"];

        emailsearch(email);
      } else {
        error = jsonDecode(response.body)['non_field_errors'][0];
      }
    } catch (e) {
      print('could not access $e');
    }

    notifyListeners();
    print(error);

    return code;
  }

  Future<int> registerflutter() async {
    try {
      final response = await http.post(Uri.parse(urlregister), body: {
        "first_name": prenom,
        "last_name": nom,
        "sexe": sexe,
        "dateNaiss": datenaiss,
        "profession": profession,
        "fonction": fonction,
        "telephone": tel,
        "email": email,
        "password": password,
      });
      code = response.statusCode;
      if (response.statusCode == 200) {
        notifyListeners();
        print(response.body);
      }
    } catch (e) {
      print("could not connect $e");
    }

    return code;
  }
}
