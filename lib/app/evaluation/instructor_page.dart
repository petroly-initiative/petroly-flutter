import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petroly/app/evaluation/widgets/circular_indicator.dart';
import 'package:petroly/custom_widgets/form_contianer.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:petroly/models/Instructor_model.dart';
import 'package:petroly/providers/Instructors_list.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class InstructorArguments {
  InstructorModel instructor;
  InstructorArguments(this.instructor);
  // int id;
  // String name;
  // InstructorArguments({required this.name,required this.id});
}

// ignore: must_be_immutable
class Instructor extends StatefulWidget {
  late InstructorArguments arg;

  @override
  _InstructorState createState() => _InstructorState();
}

class _InstructorState extends State<Instructor> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> comments = [];
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   Provider.of<InstructorList>(context, listen: false)
  //       .fetchComments(widget.arg.instructor.id)
  //       .then((value) => comments = value);
  // }

  @override
  Widget build(BuildContext context) {
    widget.arg =
        ModalRoute.of(context)!.settings.arguments as InstructorArguments;
    var width = MediaQuery.of(context).size.width;

    var teach = widget.arg.instructor.evaluation['teachingAvg'] != null
        ? widget.arg.instructor.evaluation['teachingAvg'] / 100 ?? 0.0
        : 0.0;
    var per = widget.arg.instructor.evaluation['personalityAvg'] != null
        ? widget.arg.instructor.evaluation['personalityAvg'] / 100 ?? 0.0
        : 0.0;
    var grad = widget.arg.instructor.evaluation['gradingAvg'] != null
        ? widget.arg.instructor.evaluation['gradingAvg'] / 100 ?? 0.0
        : 0.0;

    Provider.of<InstructorList>(context, listen: false)
        .fetchComments(widget.arg.instructor.id)
        .then((value) {
      setState(() {
        comments = value;
      });
      // print(comments);
    });

    return Scaffold(
      body: Stack(children: <Widget>[
        CustomContianer(
          height: 600,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipOval(
                child: widget.arg.instructor.profilePic == ''
                    ? Image.asset(
                        'assets/images/blank_profile.png',
                        fit: BoxFit.cover,
                        width: 80,
                        height: 80,
                        alignment: Alignment.centerLeft,
                      )
                    : Image.network(
                        widget.arg.instructor.profilePic,
                        fit: BoxFit.cover,
                        width: 80,
                        height: 80,
                        alignment: Alignment.centerLeft,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/blank_profile.png',
                            fit: BoxFit.cover,
                            width: 80,
                            height: 80,
                            alignment: Alignment.centerLeft,
                          );
                        },
                      ),
              ),
              Text(widget.arg.instructor.name,
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              Text(
                widget.arg.instructor.department,
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomCircularIndicator(
                      percent: 0.7,
                      footer: 'Grading',
                      rate: (grad * 5).toStringAsFixed(1) + '/5'),
                  CustomCircularIndicator(
                      percent: 0.7,
                      footer: 'Teaching',
                      rate: (teach * 5).toStringAsFixed(1) + '/5'),
                  CustomCircularIndicator(
                      percent: 0.7,
                      footer: 'Personality',
                      rate: (per * 5).toStringAsFixed(1) + '/5'),

                ],
              ),
              Container(
                child: Text(
                  'Comments',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                  // border: Border.all(
                  //   color: Colors.black54,
                  // ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: ListView.builder(
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(5),
                        width: width * 0.7,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(8),
                          // border: Border.all(
                          //   color: Colors.black54,
                          // ),
                        ),
                        child: Text(
                          comments[index],
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ), GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/evalationForm');
                },
                child: Container(
                  child: Text(
                    'Evaluate',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                    // border: Border.all(
                    //   color: Colors.black54,
                    // ),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
      backgroundColor: Colors.grey[200],
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.arg.instructor.name.toString()),
      ),
    );
  }
}
