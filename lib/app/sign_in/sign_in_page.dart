import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petroly/custom_widgets/form_contianer.dart';
import 'package:petroly/custom_widgets/paint.dart';
import 'package:petroly/custom_widgets/submit_button.dart';
import 'package:petroly/custom_widgets/text_field_input.dart';
import 'package:petroly/custom_widgets/toggle_signup_signin.dart';
import 'package:petroly/providers/Instructor_Provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

import 'package:petroly/providers/Instructors_list.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(context),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        //background
        Container(
          alignment: Alignment.topRight,
          width: MediaQuery.of(context).size.width,
          height: 100,
          margin: EdgeInsets.fromLTRB(0, 0, 0, 550),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Group 98.png'),
                  fit: BoxFit.cover)),
        ),
        Container(
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width,
          height: 300,
          margin: EdgeInsets.fromLTRB(0, 0, 250, 50),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Group 97.png'),
                  fit: BoxFit.scaleDown)),
        ),
        //sign in form
        CustomContianer(
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Log in to Petroly',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 16.0),
              CustomTextField(
                label: 'Username',
                hint: 'username',
                icon: FontAwesomeIcons.solidUser,
                inputType: TextInputType.text,
                inputAction: TextInputAction.next,
                obscureText: false,
              ),
              SizedBox(height: 16.0),
              CustomTextField(
                label: 'Password',
                hint: 'password',
                icon: FontAwesomeIcons.lock,
                inputType: TextInputType.text,
                inputAction: TextInputAction.done,
                obscureText: true,
              ),
              SizedBox(height: 8.0),
              RichText(
                textAlign: TextAlign.right,
                text: TextSpan(
                    text: 'Forget Password',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print(00011000);

                        // Navigator.pushNamed(context, 'forgetPass');
                      }),
              ),
              SizedBox(height: 16.0),
              CustomSubmitButton(
                  label: 'Log in',
                  onPressed: () {
                    // Provider.of<Counter>(context, listen: false).instructors;
                    Navigator.pushNamed(context, '/home');
                  }),
              SizedBox(height: 8.0),
              ToggleSignUp(
                  page: "SignUp",
                  text: "Do not have an account?",
                  link: " Sign Up")
            ],
          ),
        ),
      ],
    );
  }
}
