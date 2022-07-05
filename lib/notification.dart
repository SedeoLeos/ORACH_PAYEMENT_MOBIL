import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Notification extends StatefulWidget {
  Notification({Key? key}) : super(key: key);

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  

  @override
  void initState() {
    super.initState();
    
  }

  List<Widget> _items = [for (int i = 0; i < 12; i++) notif(i)];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,3,0,3),
      child: ListView(
        children :_items
      ),
    );
  }
}

void doNothing(BuildContext context) {}

Widget notif(i) {
  return Column(
    children: [
      Slidable(
          child: ListTile(title: Text("Jacqui Michelle "),
          subtitle: Text("Salut mr Baki vous avez une nouvelle facture veuillez vous rendre dans l'interface de payement"),),
          // Specify a key if the Slidable is dismissible.
          key: ValueKey(i),

          // The end action pane is the one at the right or the bottom side.
          endActionPane: const ActionPane(
            motion: ScrollMotion(), children: [
            SlidableAction(
              // An action can be bigger than the others.
              flex: 2,
              onPressed: doNothing,
              backgroundColor: Color.fromARGB(255, 161, 7, 7),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'delete',
            ),
            SlidableAction(
              onPressed: doNothing,
              backgroundColor: Color(0xFF0392CF),
              foregroundColor: Colors.white,
              icon: Icons.save,
              label: 'Save',
            ),
          ])),
          Divider(
            height: 3,
          )
    ],
  );
}
