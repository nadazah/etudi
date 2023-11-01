import 'package:Etudy/models/task.dart';
import 'package:Etudy/screens/details/widgets/date_picker.dart';
import 'package:Etudy/screens/details/widgets/task_timeline.dart';
import 'package:Etudy/screens/details/widgets/task_title.dart';
import 'package:flutter/material.dart';


class DetailPage extends StatelessWidget {
  final Task task;
  DetailPage(this.task);
  @override
  Widget build(BuildContext context) {
    final detailList = task.desc;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [const DatePicker(), TaskTitle()],
                )),
          ),
          detailList == null
              ? SliverFillRemaining(
                  child: Container(
                    color: Colors.white,
                    child: const Center(
                        child: Text(
                      "Pas de scéances pour aujourd'hui",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    )),
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, index) => TaskTimeLine(detailList[index]),
                    childCount: detailList.length,
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 90,
      backgroundColor: Colors.black,
      leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios)),
      actions: const [
        Icon(Icons.more_vert, size: 40),
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${task.title} tâches',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 5),
            Text("Vous avez ${task.left} tâches pour aujourd'hui ",
                style: const TextStyle(
                    fontSize: 12, color: Color.fromARGB(255, 59, 59, 59)))
          ],
        ),
      ),
    );
  }
}
