import 'package:flutter/material.dart';

class Payement extends StatefulWidget {
  Payement({Key? key}) : super(key: key);

  @override
  State<Payement> createState() => _PayementState();
}

class _PayementState extends State<Payement> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      
      children: [
      Card(
        margin: EdgeInsets.fromLTRB(30, 30, 30, 30),
        color: Theme.of(context).primaryColor,
        elevation: 10,
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Text("Veuillez entre les information suivante"),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: TextFormField(
                decoration: InputDecoration(
                    prefix: Text("+242  "),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Numero de payement",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide.none)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: TextFormField(
                decoration: InputDecoration(
                    suffix: Text(" XFAC"),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Saisissez le montant",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide.none)),
              ),
            ),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: const Text(
                      'Button',
                      style: TextStyle(color: Colors.black, fontSize: 7),
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      fixedSize: const Size(50, 50),
                      shape: const CircleBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      Text("Historique de payement")
    ]);
  }
}
