import 'package:Etudy/constants/colors.dart';
import 'package:Etudy/screens/details/detail.dart';
import 'package:Etudy/screens/details/widgets/profile_prof2.dart';
import 'package:Etudy/screens/home/widgets/go_premium.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';

import '../../../models/center.dart';



class Centers extends StatelessWidget {
  final centerList = Centre.generateCentres();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlueLight,
      appBar: _buildAppBar(context),
      body: Column(
        children: [GoPremium(),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 5,height: 5,),
                itemCount: centerList.length,
                itemBuilder: (context, index) => centerList[index].isLast
                    ? _buildAddcentre()
                    : _buildcentre(context, centerList[index])),
          ),
        ],
      ),
        //bottomNavigationBar: _buildBottonNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 50,
          backgroundColor: Colors.black,
          onPressed: () {},
          child: const Icon(Icons.add, size: 35)),
    );
              
  
  }

  Widget _buildAddcentre() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(10),
      dashPattern: const [10, 10],
      color: Colors.grey,
      strokeWidth: 2,
      child:  Center(
        child:Column(
           
          children:const [ Text('Search for other Centers',
            style: TextStyle(
            
              fontWeight: FontWeight.bold,
            )),
            Icon(Icons.search_sharp)
            ],
        )
      ),
    );
  }

  Widget _buildcentre(BuildContext context, Centre centre) {
    return Container(
        margin: EdgeInsets.all(20) ,
        padding: const EdgeInsets.all(50),
        decoration: BoxDecoration(
          color: centre.bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              centre.iconData,
              color: centre.iconColor,
              size: 50,
            ),
            const SizedBox(
              height: 50,
             
            ),
            Text(centre.name!,
                style: const TextStyle(
                  fontSize: 20,
                     fontWeight: FontWeight.bold)),
            const SizedBox(height: 50),
                _buildcentreStatus(
                    centre.btnColor!, centre.iconColor!, '${centre.classes} classes'),
               
              
            ],
        ),
        );
  }

  Widget _buildcentreStatus(Color bgColor, Color txtColor, String text) {
    return Container(
      padding: const EdgeInsets.all(10),
   
      decoration: BoxDecoration(
          
          color: bgColor, borderRadius: BorderRadius.circular(10)),
      child: Text(
        text,
        style: TextStyle(color: txtColor, fontSize: 30),
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
    AppBar _buildAppBar(context) {
    return AppBar(
      backgroundColor:Colors.grey.withOpacity(0.1),
      elevation: 0,
      title: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            //margin: const EdgeInsets.only(left : 15),
            child: GestureDetector(
              onTap:(){

          }, 
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('images/avatar.jpg'),
              )
              
            ),),
          const SizedBox(
            width: 10,
          ),
          const Text('Bienvenue  ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
      actions: const [
        Icon(
          Icons.more_vert,
          color: Colors.black,
          size: 40,
        )
      ],
    );
  }
}

