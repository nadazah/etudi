
import 'package:Etudy/constants/colors.dart';
import 'package:Etudy/screens/home/home_login.dart';
import 'package:Etudy/screens/home/widgets/centers.dart';
import 'package:Etudy/screens/home/widgets/go_premium.dart';
import 'package:Etudy/screens/home/widgets/tasks.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../details/widgets/profile_prof2.dart';


class HomePage extends StatefulWidget {
  late String welcome ;
  HomePage({required this.welcome});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  @override
  Widget build(BuildContext context)   {
    return Scaffold(
      backgroundColor: kBlueLight,
      appBar: _buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Centers(),
                  ),
                );
              },
              child: GoPremium()),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(15),
            child: const Text(
              'Dashboard',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Tasks(),
            )),
        ],
      ),

    );
  }

  Widget _buildBottonNavigationBar() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10,
            )
          ]),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: BottomNavigationBar(
            backgroundColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                  label: 'Home', icon: Icon(Icons.home_rounded)),
              BottomNavigationBarItem(
                  label: 'Person ', icon: Icon(Icons.person_rounded))
            ]),
      ),
    );
  }

  AppBar _buildAppBar(context)  {
    return AppBar(
        backgroundColor: Colors.grey.withOpacity(0.1),
        elevation: 0,
        title: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              //margin: const EdgeInsets.only(left : 15),
              child: GestureDetector(
                onTap: () async{
                  var userType="Professor";
                  late String uid='';


                      FirebaseFirestore firestore = FirebaseFirestore.instance;
                      User? newUser = FirebaseAuth.instance.currentUser;

                               if (newUser != null) {
                                uid=newUser.uid;
                                
                                if (newUser.photoURL=='1')  {userType="Etudiant";}

                             
                              } else {

                              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeLogIn()));
                              }
                              
              
                                 
                                


                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserProfile(userState: userType,uid:uid)));}
            ,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('images/avatar.jpg'),
                )
              
            ),),
            const SizedBox(
              width: 10,
            ),
            //Text("Bienvenue M. ${data['prenom']} ${data['nom']}"),
             
             Text(widget.welcome,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
        actions: [
          PopupMenuButton(
              onSelected: (value) {
                // handle the selected value
              },
              itemBuilder: (BuildContext context) {
                return [
                   PopupMenuItem(
                    value: 1,
                    child: TextButton(
                      onPressed: () async{
                        await FirebaseAuth.instance.signOut();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeLogIn(),));},
                      child: Text('Déconnexion'))
                  ),
                  
                ];
              },
              icon: const Icon(
                Icons.more_vert,
                color: Colors.black,
                size: 40,
              ))
        ]);
  }
  }

