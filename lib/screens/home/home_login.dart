import 'package:Etudy/constants/colors.dart';
import 'package:Etudy/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../InscriptionSelection.dart';

class HomeLogIn extends StatefulWidget {
  @override
  _HomeLogInState createState() => _HomeLogInState();
}

class _HomeLogInState extends State<HomeLogIn> {
//Initialize Firebase app
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlueLight,
      appBar: AppBar(
          title: const Center(
            child: Text(
              'Etudy',
              style: TextStyle(
                  color: kRedDark, fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: kBlueLight),
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return LoginScreen();
          }
          // Show a loading spinner while Firebase app is initializing
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Login function
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for that email");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    //create the textfield controller
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.6),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /*ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('images/logo.jpg',
              //height: 100.0,
               //width: 200,
               opacity: const AlwaysStoppedAnimation(.2)
            ),),*/
            Container(
              //padding: EdgeInsets.symmetric(horizontal :20, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: 600,
              height: 200,
              decoration: BoxDecoration(
                color: kYellow.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.dstATop),
                  image: AssetImage('images/logo.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: kYellow.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Bienvenue",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 44.0,
            ),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                hintText: "Nom d'utilisateur ou e-mail",
                prefixIcon: Icon(Icons.mail, color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 26.0,
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                hintText: "Mot de passe",
                prefixIcon: Icon(Icons.lock, color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 44.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: kRedLight,
                elevation: 0.0,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                onPressed: () async {
                  //let's test the app

                  User? user = await loginUsingEmailPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                      context: context);

                  if (user != null) {
                    /*DocumentSnapshot snapshot = await FirebaseFirestore.instance
                        .collection('collectionName')
                        .doc(user.uid)
                        .get();

// Use the data from the snapshot
                    Map<String, dynamic> data =
                        snapshot.data! as Map<String, dynamic>;
                    late String welcome =
                        "Bienvenue M. ${data['prenom']} ${data['nom']}";*/

                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomePage(welcome: "welcome")));
                  }
                },
                child: const Text("Se connecter",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    )),
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              width: double.infinity,
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InscriptionSelection()),
                  );
                },
                fillColor: kRedLight,
                elevation: 0.0,
                padding: EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                child: Text("S'inscrire",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
