import 'package:flutter/material.dart';
import 'package:pt2_sample1_10239908g/Exercise.dart';

class SecondScreen extends StatelessWidget {
  final List<Exercise> exList;
  final double totalExHours;
  SecondScreen({Key? key, required this.exList, required this.totalExHours}) : super(key: key);

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen 10239908G'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(padding: const EdgeInsets.all(15), child: Column(
        mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: ListView.builder(scrollDirection: Axis.vertical, shrinkWrap: true, itemCount: exList.length,
              itemBuilder: (BuildContext context, int index)
              {
                return Text(exList[index].exDate + " " + exList[index].exDescription + "  (" + exList[index].exDuration.toString() + "-hour)");
              }
          ),),
          Container(child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            },
              child: Text('Back', style: TextStyle(fontSize: 20),),
            )
          ],),),
          Text('Total Exercise Duration: ' + totalExHours.toString() + '-hour', style: TextStyle(fontSize: 20)),


        ],
      ),),
    );
  }
}