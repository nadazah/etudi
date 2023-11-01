import 'package:Etudy/constants/colors.dart';
import 'package:flutter/material.dart';

class Centre {
  IconData? iconData;
  String? name;
  Color? bgColor;
  Color? iconColor;
  Color? btnColor;
  num? classes;
  String? start;
  List <Map<String,dynamic>> ? groups ;
  bool isLast;
  //constructeur 
  Centre(
      {this.iconData,
      this.name,
      this.bgColor,
      this.iconColor,
      this.btnColor,
      this.classes,
      this.start,
      this.groups ,
      this.isLast = false});
      static List<Centre> generateCentres(){
        return [
          Centre(iconData: Icons.home_filled ,
          name: 'Center 1', 
          bgColor: kYellowLight ,
          iconColor: kYellowDark ,
          btnColor: kYellow,
          classes : 3 ,
          groups: [
            {'Id':'groupe 1',
            'level': '1rst year',
            'slot': '9:00 - 10:00 am' , 
            'tlColor' : kRedDark ,
            'bgColor' : kRedLight
            },
            {'Id':'groupe 2',
            'level': '2nd year',
            'tlColor' : kBlueDark ,
            'bgColor' : kBlueLight,
            },
            {'Id':'groupe 4',
            'level': '2nd year', 
            'tlColor' : kBlueDark ,
            'bgColor' : kBlueLight
            },
            {'Id':'groupe 5',
            'level': '3rd year',
            'tlColor' : kYellowDark ,
            'bgColor' : Colors.grey.withOpacity(0.1)
            },
             {'Id':'groupe 6',
            'level': 'baccalaureat',
            'slot': '1:00 - 2:00 pm' , 
            'tlColor' : kYellowDark ,
            'bgColor' : kYellowLight
            },
             {'Id':'groupe 7 ',
            'level': '1rst year', 
            'tlColor' : kRedDark ,
            'bgColor' : Colors.grey.withOpacity(0.1)
            },
             {'time':'3:00 pm',
            'level': '2nd year',
            'tlColor' : kBlueDark ,
            'bgColor' : Colors.grey.withOpacity(0.1)
            },
          ],
          start : 'from september 2022' ,
          ),
          Centre(iconData: Icons.home_filled ,
          name: 'Center 2 ', 
          bgColor: kRedLight ,
          iconColor: kRedDark ,
          btnColor: kRed,
          classes : 0 ,
          groups: [
            {'Id':'groupe 1',
            'level': '1rst year',
            'slot': '9:00 - 10:00 am' , 
            'tlColor' : kRedDark ,
            'bgColor' : kRedLight
            },
            {'Id':'groupe 2',
            'level': '2nd year',
            'tlColor' : kBlueDark ,
            'bgColor' : kBlueLight,
            },
            {'Id':'groupe 4',
            'level': '2nd year', 
            'tlColor' : kBlueDark ,
            'bgColor' : kBlueLight
            },
            {'Id':'groupe 5',
            'level': '3rd year',
            'tlColor' : kYellowDark ,
            'bgColor' : Colors.grey.withOpacity(0.1)
            },
             {'Id':'groupe 6',
            'level': 'baccalaureat',
            'slot': '1:00 - 2:00 pm' , 
            'tlColor' : kYellowDark ,
            'bgColor' : kYellowLight
            },
             {'Id':'groupe 7 ',
            'level': '1rst year', 
            'tlColor' : kRedDark ,
            'bgColor' : Colors.grey.withOpacity(0.1)
            },
             {'time':'3:00 pm',
            'level': '2nd year',
            'tlColor' : kBlueDark ,
            'bgColor' : Colors.grey.withOpacity(0.1)
            },
          ],
          start : 'from October 2022' ,
          ),
          Centre(iconData: Icons.home_filled ,
          name: 'Center 3', 
          bgColor: Color.fromARGB(255, 121, 172, 245) ,
          iconColor: kBlueDark ,
          btnColor: kBlue,
          classes : 0 ,
          groups: [
            {'Id':'groupe 1',
            'level': '1rst year',
            'slot': '9:00 - 10:00 am' , 
            'tlColor' : kRedDark ,
            'bgColor' : kRedLight
            },
            {'Id':'groupe 2',
            'level': '2nd year',
            'tlColor' : kBlueDark ,
            'bgColor' : kBlueLight,
            },
            {'Id':'groupe 4',
            'level': '2nd year', 
            'tlColor' : kBlueDark ,
            'bgColor' : kBlueLight
            },
            {'Id':'groupe 5',
            'level': '3rd year',
            'tlColor' : kYellowDark ,
            'bgColor' : Colors.grey.withOpacity(0.1)
            },
             {'Id':'groupe 6',
            'level': 'baccalaureat',
            'slot': '1:00 - 2:00 pm' , 
            'tlColor' : kYellowDark ,
            'bgColor' : kYellowLight
            },
             {'Id':'groupe 7 ',
            'level': '1rst year', 
            'tlColor' : kRedDark ,
            'bgColor' : Colors.grey.withOpacity(0.1)
            },
             {'time':'3:00 pm',
            'level': '2nd year',
            'tlColor' : kBlueDark ,
            'bgColor' : Colors.grey.withOpacity(0.1)
            },
          ],
          start : 'from December 2022' ,
          ),
         
        ];
      }

  
}
