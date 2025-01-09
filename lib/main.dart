import 'package:flutter/material.dart';
import 'secondScreen.dart';
import 'package:pt2_sample1_10239908g/Exercise.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget
{
const MyApp({super.key});

@override
MyAppState createState() => MyAppState();

}

class MyAppState extends State<MyApp> {

//vars
  String exerciseDate = '';
  String exerciseDescription = '';
  double exerciseDuration = 0.0;
  List<Exercise> exList = [];

  //ctrls
  final exDateField = TextEditingController();
  final exDescriptionField = TextEditingController();
  final exDurationField = TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('First Screen 10239908G')),
        body: Column(mainAxisAlignment: MainAxisAlignment. start, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
            const Text('Exercises log', style: TextStyle(fontSize: 20)),
          ],),),

          TextField(controller: exDateField, decoration: InputDecoration(hintText: 'Exercise Date', hintStyle: TextStyle(fontSize: 18), border: OutlineInputBorder()), onChanged: (value) {
            setState(() {
              exerciseDate = value;
            });
          }),
          TextField(controller: exDescriptionField, decoration: InputDecoration(hintText: 'Exercise', hintStyle: TextStyle(fontSize: 18), border: OutlineInputBorder()), onChanged: (value) {
            setState(() {
              exerciseDescription = value;
            });
          }),
          TextField(controller: exDurationField, decoration: InputDecoration(hintText: 'Exercise Duration (hour)', hintStyle: TextStyle(fontSize: 18), border: OutlineInputBorder()), onChanged: (value) {
            setState(() {
              exerciseDuration = double.tryParse(value)??0.0;
            });
          }),

          Builder(builder: (BuildContext context) {
            return ElevatedButton(onPressed: () {
              Exercise currentExercise = new Exercise(exDate: exerciseDate, exDescription: exerciseDescription, exDuration: exerciseDuration);
              exList.add(currentExercise);
              double totalExDuration = 0.0;
              for (Exercise ex in exList){
                totalExDuration += ex.exDuration;
              }
              Navigator.push(context, MaterialPageRoute(builder: (context)
              {
                return SecondScreen(exList: exList, totalExHours: totalExDuration);
              }
              ));
            },
              child: const Text('Add Exercise', style: TextStyle(fontSize: 18)),
            );
          }),



        ],)
      )

    );
  }
}

