import 'package:Etudy/constants/colors.dart';
import 'package:flutter/material.dart';
import 'Inscription/InscriptionProf.dart';
import 'Inscription/InscriptionEtudiant.dart';


class InscriptionSelection extends StatefulWidget {
  const InscriptionSelection({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<InscriptionSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlueLight,
      appBar: AppBar(
          title: const Center(
            child: Text(
              'Etudy',
              style: TextStyle(
                  color:kRedDark,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: kBlueLight),
      body: SelectionScreen(),
    );
  }
}

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //select account type
          const Text(
            "Créer un compte en tant que :",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                //fontWeight: FontWeight.bold
                ),
          ),
          // Space between buttons
          const SizedBox(
            height: 44.0,
          ),
          // Student button
          Container(
            width: double.infinity,
            child: RawMaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InscriptionEtudiant()));
              },
              fillColor: kRedLight,
              elevation: 0.0,
              padding: EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              child: Text("Etudiant",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  )),
            ),
          ),
          const SizedBox(
            height: 44.0,
          ),
          // Teacher button
          Container(
            width: double.infinity,
            child: RawMaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InscriptionProf()));
              },
              fillColor: kRedLight,
              elevation: 0.0,
              padding: EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              child: Text("Professeur",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  )),
            ),
          ),
        
        ],
      ),
    );
  }
}
