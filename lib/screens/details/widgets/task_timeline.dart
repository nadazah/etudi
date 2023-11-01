import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TaskTimeLine extends StatelessWidget {
  final Map<String,dynamic> detail ;
  TaskTimeLine(this.detail);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white ,
      padding:const EdgeInsets.symmetric(horizontal: 15),
      child:Row(children: [
        _buildTimeLine(detail['tlColor']),
        Expanded(child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(detail['time']), 
            detail['title'].isNotEmpty ?
            _buildCard(detail['bgColor'], detail['title'],detail['slot']) 
            : _buildCard(Colors.white, '', '')
            ],
        ))
      ]),
    );
  }
  Widget _buildTimeLine(Color color){
    return Container(
      color: Colors.white,
      height: 80,
      width : 20,
      child : TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0,
        isFirst : true ,
        indicatorStyle: IndicatorStyle(
          indicatorXY: 0 ,
          indicator: Container(
            decoration: BoxDecoration(
              color:Colors.white,
              shape: BoxShape.circle,
              border: Border.all(width: 5, color :color) ),
          )
        ),
        afterLineStyle: LineStyle(
          thickness: 2,
          color : color 
        ),
      )
    );
  }
  Widget _buildCard(Color bgColor , String title , String slot){
    return Container(
      width : 250,
      decoration: BoxDecoration(
        color: bgColor ,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10) ,
          topLeft:Radius.circular(10) ,
        )

      ),
      padding: const EdgeInsets.all(15),
      margin : const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(title),const SizedBox(height: 10,) , Text(slot)],
      )
      );
  }
}