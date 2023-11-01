import 'package:Etudy/constants/colors.dart';
import 'package:Etudy/screens/home/home_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:validators/validators.dart';

class InscriptionProf extends StatefulWidget {
  @override
  _InscriptionProfState createState() => _InscriptionProfState();
}

class _InscriptionProfState extends State<InscriptionProf> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  late String Nom;
  late String telephone;
  late String prenom;
  late String matiere;
  late String localisation;

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
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20),
                        child: const Text(
                            "Veuillez remplir les champs suivants : ",
                            style: TextStyle(fontSize: 17)),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Entrez votre nom';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          Nom = value;
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                          ), // icon is 48px
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: 'Entrez votre nom',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Entrez votre prénom';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          prenom = value;
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: 'Entrez votre prénom',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Entrez votre numéro de téléphone';
                          }
                          if (!isNumeric(value)) {
                            return 'Entrez un numéro de téléphone valide ';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          telephone = value;
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(
                              Icons.phone,
                              color: Colors.grey,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: 'Entrez votre numéro de téléphone',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      
                      TextFormField(
                        validator: (value) {
                          
                          if (value!.isEmpty) {
                            return "Entrez votre localisation";
                          }
             
                          return null;
                        },
                        onChanged: (value) {
                         localisation=value ;
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(
                              Icons.book,
                              color: Colors.grey,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: "Entrez votre localisation",
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Entrez votre matière';
                          }
        
                          return null;
                        },
                        onChanged: (value) {
                          matiere = value;
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(
                              Icons.book,
                              color: Colors.grey,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: 'Entrez votre matière',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Entrez votre e-mail';
                          }
                          if (!isEmail(value)) {
                            return 'Entrez un e-mail valide';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(
                              Icons.email,
                              color: Colors.grey,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: 'Entrez votre email',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Entrez votre mot de passe';
                          }
                          if (value.length < 6) {
                            return 'Le mot de passe doit contenir au moins 6 caractères';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: 'Entrez votre mot de passe',
                        ),
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              //  side: BorderSide(color: Colors.red)
                              //backgroundColor: MaterialStateProperty.all(Colors.red),
                            )),
                            backgroundColor: MaterialStateProperty.all(kRedLight),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20),
                            child: Text(
                              "S'inscrire",
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                var newUser =
                                    await _auth.createUserWithEmailAndPassword(
                                        email: email, password: password);
        
                                if (newUser != null) {
                                  late String uid=newUser.user!.uid;
                                   await FirebaseFirestore.instance
                                      .collection('Professor').doc(uid).set(
                                      {
                                    'email': email,
                                    'localisation': localisation,
                                    'nom': Nom,
                                    'telephone': telephone,
                                    'prenom': prenom,
                                    'matiere': matiere,
                                  });
                                   await FirebaseAuth.instance.currentUser!.updateDisplayName(Nom);
                                   await FirebaseAuth.instance.currentUser!.updatePhotoURL('0'); //0:Professeur
        
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeLogIn()));
                                 
                                  //final user = FirebaseAuth.instance.currentUser;
                                  //user?.updateDisplayName("${prenom}+ ${Nom}");
        
                                  // Register the user's Nom; and telephone number
                                  // by updating the user's profile
                                }
                              } catch (e) {
                                print(e);
                              }
                            }
                            ;
                          })
                    ]),
              ),
            ),
          ),
        ));
  }
}
