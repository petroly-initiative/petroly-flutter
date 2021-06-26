import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

final TextEditingController _linkController = TextEditingController();
final TextEditingController _courseController = TextEditingController();

Future<void> showInformationDialog(BuildContext context) async {
  return await showDialog(
      context: context,
      builder: (context) {
        bool isChecked = false;
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(

            // insetPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0))),
            content: Form(

                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _linkController,
                      validator: (value) {
                        return value!.isNotEmpty ? null : "Add Group Link";
                      },
                      decoration: InputDecoration(hintText: "Add Group Link"),
                    ),
                    TextFormField(
                      controller: _courseController,
                      validator: (value) {
                        return value!.isNotEmpty ? null : "add the course";
                      },
                      decoration: InputDecoration(hintText: "Course"),
                    ),
                  ],
                )),
            title: Text('Add New Group'),
            actions: <Widget>[
              InkWell(
                child: Text('Add    '),
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // Do something like updating SharedPreferences or User Settings etc.
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          );
        });
      });
}
