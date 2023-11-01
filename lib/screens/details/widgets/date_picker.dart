import 'package:flutter/cupertino.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final weekList = ['sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  final dayList = ['24', '25', '26', '27', '28', '29', '30', '31'];
  var selected = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () => setState(() => selected = index),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal:12 ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: selected == index
                            ? const Color.fromARGB(0, 110, 110, 110).withOpacity(0.1)
                            : null),
                    child: Column(
                      children: [
                        Text(
                          weekList[index],
                          style: TextStyle(
                              color: selected == index
                                  ? const Color.fromARGB(255, 0, 0, 0)
                                  : const Color.fromARGB(255, 56, 55, 55)),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          dayList[index],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                              color: selected == index
                                  ?const Color.fromARGB(255, 0, 0, 0)
                                  :const Color.fromARGB(255, 55, 55, 56)),
                        ),
                      ],
                    )),
              ),
          separatorBuilder: (_ , index ) => const SizedBox(width: 5,),
          itemCount: weekList.length),
    );
  }
}
