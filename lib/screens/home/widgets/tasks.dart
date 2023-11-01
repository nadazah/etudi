import 'package:Etudy/screens/details/detail.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';

import '../../../models/task.dart';

class Tasks extends StatelessWidget {
  final tasklist = Task.generateTasks();

/*SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          delegate: SliverChildListDelegate(*/
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: tasklist.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemBuilder: (context , index) => tasklist[index].isLast ? _buildAddTask() : _buildTask(context , tasklist[index])
    );
    
  }
  Widget _buildAddTask(){
        return DottedBorder(
          borderType: BorderType.RRect,
          radius:const Radius.circular(20),
          dashPattern:const [10,10],
          color: Colors.grey,
          strokeWidth: 2,
          child:const Center(
          child: Text('+ Add',
          style: TextStyle( 
            fontSize: 18 ,
            fontWeight: FontWeight.bold, 
          )),
        ),) ; 
  }
  Widget _buildTask(BuildContext context , Task task){
        return GestureDetector(
          onTap:(){
            Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => DetailPage(task))
            );
          } ,
          child: Container(
                padding:const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: task.bgColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Icon(
                      task.iconData,
                      color : task.iconColor,
                      size: 35,
                      ),
                    const SizedBox(height: 30,),
                    Text(task.title! ,
                    style : const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children:  [
                        _buildTaskStatus(task.btnColor!,task.iconColor!,'${task.left} left'),
                        const SizedBox(width: 5,),
                        _buildTaskStatus(Colors.white,task.iconColor!,'${task.done} done'),
                      ],
                    )
                  ],
                )
        
          ),
        ) ;
  }
  Widget _buildTaskStatus(Color bgColor , Color txtColor , String text){
    return Container(
      padding:const EdgeInsets.symmetric(horizontal :15, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20)
      ),
      child : Text(text,
      style: TextStyle(color : txtColor), )
    ,);
  }
}
