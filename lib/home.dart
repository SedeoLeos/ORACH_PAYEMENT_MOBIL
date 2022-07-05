import 'package:flutter/material.dart';

import 'package:orach_payement/notification.dart' as notifications;
import 'package:orach_payement/parametre.dart';
import 'package:orach_payement/payement.dart';

class Home extends StatefulWidget {
  static String pageName = "home";

  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
 

 final Tabwiget =<Widget>[
   Text("Home"),
  //  Text("publier"),
  //  Text("evenement"),
   notifications.Notification(),
  Payement(),
  Parametre(),
 ];
  int currentIdex = 0;

  @override
  void initState() {
    super.initState();
   
  }

  @override
  void dispose() {
   
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          actions: [Icon(Icons.person)],
          centerTitle: false,
          title: Text("OARCH")),
      body: Center(
        child:
        Tabwiget[currentIdex] ,),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          elevation: 10,
          backgroundColor: Theme.of(context).primaryColor,
          type: BottomNavigationBarType.shifting, // Shifting

          currentIndex: currentIdex,
          onTap: (index) {
            setState(() {
              currentIdex = index;
             
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Theme.of(context).primaryColor,
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.add),
            //   label: "Publier",
            //   backgroundColor: Theme.of(context).primaryColor,
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.event),
            //   label: "Evenement",
            //   backgroundColor: Theme.of(context).primaryColor,
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Notifications",
              backgroundColor: Theme.of(context).primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.payment),
              label: "Payement",
              backgroundColor: Theme.of(context).primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Parametre",
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ]),
    );
  }
}
