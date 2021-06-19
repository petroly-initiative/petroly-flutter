import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petroly/app/home/nav_bar.dart';
import 'package:petroly/custom_widgets/custom_icon_button.dart';

class MyEvaluation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          title: Icon(FontAwesomeIcons.stumbleuponCircle),
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                FontAwesomeIcons.solidUserCircle,
                size: 36,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          )),
      drawer: NavBar(),
      body: MyEvaluationPage(),
      backgroundColor: Colors.grey[200],
    );
  }
}

class MyEvaluationPage extends StatefulWidget {
  @override
  _MyEvaluationPageState createState() => _MyEvaluationPageState();
}

class _MyEvaluationPageState extends State<MyEvaluationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      height: 180,
      width: 360,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipOval(
                  child: Image.asset(
                'assets/images/blank_profile.png',
                fit: BoxFit.cover,
                width: 50,
                height: 50,
                alignment: Alignment.centerLeft,
              )),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 4, 0),
                width: 200,
                height: 40,
                child: FittedBox(
                  child: Text(
                    " instructor.name",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
          Text(
            "instructor.department",
            textAlign: TextAlign.right,
            style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomIconButton(
                onPressed: () {},
                icon: FontAwesomeIcons.solidEdit,
                color: Colors.blue,
                label: 'Edit',
              ),
              CustomIconButton(
                onPressed: () {},
                icon: FontAwesomeIcons.solidTrashAlt,
                color: Colors.red,
                label: 'Delete',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
