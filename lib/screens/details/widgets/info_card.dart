import 'package:Etudy/constants/colors.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  // the values we need
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  InfoCard({required this.text, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card( 
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
  ),
        color: kRedLight,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: ListTile(
          leading: Icon(
            icon,
            color: Color.fromARGB(255, 177, 189, 199),
          ),
          title: Text(
            text,
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: "Source Sans Pro"),
          ),
        ),
      ),
    );
  }
}
