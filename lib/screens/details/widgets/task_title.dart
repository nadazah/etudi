import 'package:flutter/material.dart';


class TaskTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Scéances',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(children: const [
              Text(
                'TimeLine',
                style: TextStyle(
                  color: Color.fromARGB(255, 56, 55, 55) ,
                  fontWeight: FontWeight.bold ,
                ),
              ),
              Icon(Icons.keyboard_arrow_down_outlined)
            ]),
          )
        ],
      ),
    );
  }
}
