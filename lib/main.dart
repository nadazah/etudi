//import the necessary packages
import 'package:Etudy/screens/home/home.dart';
import 'package:Etudy/screens/home/home_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'firebase_options.dart';

//main method
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

//MyApp class
class MyApp extends StatelessWidget {
  const MyApp({super.key});

//Build method
  @override
  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //check if there is data
          if (snapshot.hasData) {
            User? user =snapshot.data;
            // check if the user is not null
            if (user!= null) 
            {
              String? displayName = user.displayName;
              print(displayName);
              // return the HomePage with a welcome message
              return HomePage(welcome:'Bienvenue $displayName');
              



            }
            else return HomeLogIn();


          
          } else {
            return HomeLogIn();
          }
        },
      ),
    );
  }
}
