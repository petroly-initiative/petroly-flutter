import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petroly/custom_widgets/form_contianer.dart';
import 'package:petroly/custom_widgets/paint.dart';
import 'package:petroly/custom_widgets/submit_button.dart';
import 'package:petroly/custom_widgets/text_field_input.dart';
import 'package:petroly/custom_widgets/toggle_signup_signin.dart';

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(context),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Forget Password',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
      ),
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
        //forget password form
        CustomContianer(
          width: 400,
          height: 250,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Enter your email we well send instruction  to reset your password',
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(height: 16.0),
              CustomTextField(
                label: 'Email',
                hint: 'test@test.com',
                icon: FontAwesomeIcons.solidEnvelope,
                inputType: TextInputType.text,
                inputAction: TextInputAction.done,
                obscureText: false,
              ),
              SizedBox(height: 16.0),
              CustomSubmitButton(
                  label: 'Send',
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  }),
              SizedBox(height: 8.0),
            ],
          ),
        ),
      ],
    );
  }
}
