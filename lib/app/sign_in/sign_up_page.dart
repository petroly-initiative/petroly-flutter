import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petroly/app/sign_in/sign_in_page.dart';
import 'package:petroly/custom_widgets/form_contianer.dart';
import 'package:petroly/custom_widgets/paint.dart';

import 'package:petroly/custom_widgets/submit_button.dart';
import 'package:petroly/custom_widgets/text_field_input.dart';
import 'package:petroly/custom_widgets/toggle_signup_signin.dart';

class SignUpPage extends StatelessWidget {
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
        CustomPaint(
          size: Size(
              1080,
              (1080 * 0.555555555555556)
                  .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
          painter: RPSCustomPainter(),
          //sign up form
          child: CustomContianer(
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Create a Petroly Account',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 16.0),
                CustomTextField(
                  label: 'Email',
                  hint: 'test@test.com',
                  icon: FontAwesomeIcons.solidEnvelope,
                  inputType: TextInputType.emailAddress,
                  inputAction: TextInputAction.next,
                  obscureText: false,
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
                  inputType: TextInputType.visiblePassword,
                  inputAction: TextInputAction.next,
                  obscureText: true,
                ),
                SizedBox(height: 18.0),
                CustomTextField(
                  label: 'Confirm Password',
                  hint: 'Confirm Password',
                  icon: FontAwesomeIcons.lock,
                  inputType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  obscureText: false,
                ),
                SizedBox(height: 16.0),
                CustomSubmitButton(label: 'Sign up', onPressed: () {}),
                SizedBox(height: 8.0),
                ToggleSignUp(
                    page: "/",
                    text: "Already have an account?",
                    link: " Sign in")
              ],
            ),
          ),
        ),
        Image.asset(
          'assets/images/petroly logo.jpeg',
          width: 600,
          scale: 7,
          alignment: Alignment.topLeft,
        ),
      ],
    );
  }
}
