import 'package:Etudy/screens/details/widgets/info_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../home/home_login.dart';

class UserProfile extends StatefulWidget {
  late String userState; 
  late String uid;
  UserProfile({required this.userState,required this.uid});
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection(widget.userState).doc(widget.uid).get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          if (snapshot.hasData) {
            var Data = snapshot.data;
            var userData =Data!.data() as Map;
            print(userData);

            var name = userData['nom'];
            var  prenom = userData['prenom'];
            var phone=userData['telephone'];
            var email=userData['email'];
            var localisation=userData['localisation'];

            return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlueLight,
        elevation: 0.0,
       
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                
                child: Text('Déconnexion'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(1.0),
                  primary:kRedLight ,
                  onPrimary: Color.fromARGB(255, 4, 4, 4),
                ),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeLogIn()));
                },
              ),
            ),
          ),
        ],
      ),
      body: Container(
      
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color:kBlueLight,
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20.0,
            ),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/IM.JPG'),
            ),
             const SizedBox(height: 10.0),
             Text(
              "${name} ${prenom}",
              style: TextStyle(
                fontSize: 20.0,
                color: Color.fromARGB(255, 14, 14, 14),
                fontWeight: FontWeight.bold,
                fontFamily: "Pacifico",
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
             Text(
              widget.userState,
              style: TextStyle(
                  fontSize: 15.0,
                  color: Color.fromARGB(255, 82, 96, 105),
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Source Sans Pro"),
            ),
             const SizedBox(
              height: 20,
              width: 200,
              child: Divider(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            InfoCard(
              text: phone, icon: Icons.phone,
             onPressed: () async {}),
            InfoCard(
                text: localisation,
                icon: Icons.location_city,
                onPressed: ()  {}),
            InfoCard(text: email, icon: Icons.email, onPressed: ()  {}),
          ],
        ),
      ));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
