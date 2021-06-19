import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petroly/models/Instructor_model.dart';
import 'package:petroly/providers/Instructor_Provider.dart';
import 'package:provider/provider.dart';

import 'instructor_page.dart';

class InstructorCard extends StatelessWidget {
  final InstructorModel instructor;
  InstructorCard(this.instructor);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/instructor',
            arguments: InstructorArguments(instructor));
      },
      child: Container(
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
                  child: instructor.profilePic == ''
                      ? Image.asset(
                          'assets/images/blank_profile.png',
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                          alignment: Alignment.centerLeft,
                        )
                      : Image.network(
                          instructor.profilePic,
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                          alignment: Alignment.centerLeft,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/blank_profile.png',
                              fit: BoxFit.cover,
                              width: 50,
                              height: 50,
                              alignment: Alignment.centerLeft,
                            );
                          },
                        ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 4, 0),
                  width: 200,
                  height: 40,
                  child: FittedBox(
                    child: Text(
                      instructor.name,
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
              instructor.department,
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBar.builder(
                  initialRating: instructor.evaluation['overall'] ?? 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  tapOnlyMode: true,
                  ignoreGestures: true,
                  itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    // print(rating);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(120, 0, 4, 0),
                  child: Icon(
                    Icons.mode_comment_rounded,
                    color: Colors.black54,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                  child: Text(
                    instructor.evalCount.toString(),
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                  child: Icon(
                    FontAwesomeIcons.solidEdit,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  instructor.evalCount.toString(),
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
