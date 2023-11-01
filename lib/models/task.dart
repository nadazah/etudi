import 'package:Etudy/constants/colors.dart';
import 'package:flutter/material.dart';

class Task {
  IconData? iconData;
  String? title;
  Color? bgColor;
  Color? iconColor;
  Color? btnColor;
  num? left;
  num? done;
  List<Map<String, dynamic>>? desc;
  bool isLast;
  //constructeur
  Task(
      {this.iconData,
      this.title,
      this.bgColor,
      this.iconColor,
      this.btnColor,
      this.left,
      this.done,
      this.desc,
      this.isLast = false});
  static List<Task> generateTasks() {
    return [
      Task(
        iconData: Icons.calendar_month,
        title: 'Calendrier',
        bgColor: kYellowLight,
        iconColor: kYellowDark,
        btnColor: kYellow,
        left: 3,
        desc: [
          {
            'time': '9:00 am',
            'title': "Scéance d'étude groupe 1",
            'slot': '9:00 - 10:00 am',
            'tlColor': kRedDark,
            'bgColor': kRedLight
          },
          {
            'time': '10:00 am',
            'title': "Scéance d'étude groupe 2",
            'slot': '10:00 - 12:00 am',
            'tlColor': kBlueDark,
            'bgColor': kBlueLight,
          },
          {
            'time': '11:00 am',
            'title': '',
            'slot': '',
            'tlColor': kBlueDark,
            'bgColor': kBlueLight
          },
          {
            'time': '12:00 am',
            'title': '',
            'slot': '',
            'tlColor': kYellowDark,
            'bgColor': Colors.grey.withOpacity(0.1)
          },
          {
            'time': '1:00 pm',
            'title': "Scéance d'étude groupe 5 ",
            'slot': '1:00 - 2:00 pm',
            'tlColor': kYellowDark,
            'bgColor': kYellowLight
          },
          {
            'time': '2:00 pm',
            'title': '',
            'slot': '',
            'tlColor': kRedDark,
            'bgColor': Colors.grey.withOpacity(0.1)
          },
          {
            'time': '3:00 pm',
            'title': '',
            'slot': '',
            'tlColor': kBlueDark,
            'bgColor': Colors.grey.withOpacity(0.1)
          },
        ],
        done: 1,
      ),
      Task(
        iconData: Icons.chat_sharp,
        title: 'Chat',
        bgColor: kRedLight,
        iconColor: kRedDark,
        btnColor: kRed,
        left: 0,
        done: 0,
      ),
      Task(
        iconData: Icons.notifications,
        title: 'Notifications',
        bgColor: Color.fromARGB(255, 121, 172, 245),
        iconColor: kBlueDark,
        btnColor: kBlue,
        left: 0,
        done: 0,
      ),
      Task(
        iconData: Icons.book_sharp,
        title: 'Ressources',
        bgColor: kYellowLight,
        iconColor: kYellowDark,
        btnColor: kYellow,
        left: 3,
        desc: [
          {
            'time': '9:00 am',
            'title': "Scéance d'étude groupe 1",
            'slot': '9:00 - 10:00 am',
            'tlColor': kRedDark,
            'bgColor': kRedLight
          },
          {
            'time': '10:00 am',
            'title': "Scéance d'étude groupe 2",
            'slot': '10:00 - 12:00 am',
            'tlColor': kBlueDark,
            'bgColor': kBlueLight,
          },
          {
            'time': '11:00 am',
            'title': '',
            'slot': '',
            'tlColor': kBlueDark,
            'bgColor': kBlueLight
          },
          {
            'time': '12:00 am',
            'title': '',
            'slot': '',
            'tlColor': kYellowDark,
            'bgColor': Colors.grey.withOpacity(0.1)
          },
          {
            'time': '1:00 pm',
            'title': "Scéance d'étude groupe 5 ",
            'slot': '1:00 - 2:00 pm',
            'tlColor': kYellowDark,
            'bgColor': kYellowLight
          },
          {
            'time': '2:00 pm',
            'title': '',
            'slot': '',
            'tlColor': kRedDark,
            'bgColor': Colors.grey.withOpacity(0.1)
          },
          {
            'time': '3:00 pm',
            'title': '',
            'slot': '',
            'tlColor': kBlueDark,
            'bgColor': Colors.grey.withOpacity(0.1)
          },
        ],
        done: 1,
      )
    ];
  }
}
