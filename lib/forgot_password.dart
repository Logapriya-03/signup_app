import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}


class _PasswordScreenState extends State<PasswordScreen> {

  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(80, 231, 172, 226),
              Color.fromARGB(80, 164, 214, 222)
            ],
                begin: Alignment.topLeft,
                end: Alignment.center
            )
        ),
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Form(child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Enter your old Password',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(16.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(16.0))),
                  controller: _oldPasswordController,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: 'Enter your new Password',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(16.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(16.0))),
                    controller: _newPasswordController,
                ),
              ],
            )),
            SizedBox(
              height: 20.0,
            ),


            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 46, 74, 196)),
                onPressed: () {
                },
                child: Container(
                  width: 270.0,
                  height: 45.0,
                  child: Center(
                    child: Text(
                      'Reset Password',
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
  super.dispose();
  }
}
