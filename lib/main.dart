import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verification_app/forgot_password.dart';
import 'package:verification_app/home_screen.dart';
import 'package:verification_app/signup_screen.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var form=GlobalKey<FormState>();
  String randomString = "";
  bool isVerified = false;
  final _checkNameController = TextEditingController();
  final _checkPasswordController = TextEditingController();
  final _captchaController = TextEditingController();


  @override
  void dispose() {
    _checkNameController.dispose();
    _checkPasswordController.dispose();
    _captchaController.dispose();
    super.dispose();
  }

  void buildCaptcha() {
    const letters =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    const length = 6;
    final random = Random();
    randomString = String.fromCharCodes(List.generate(
        length, (index) => letters.codeUnitAt(random.nextInt(letters.length))));
    setState(() {
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buildCaptcha();
  }

  bool isHide=true;

  void toggleView(){
    setState(() {
      isHide=!isHide;
    });
  }



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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Form(child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Enter your name',
                      prefixIcon: Icon(Icons.person),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(16.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(16.0))),
                  controller: _checkNameController,
                  validator: (value){
                    if(value!.isEmpty) {
                      return "Enter valid username";
                    }
                    if(value.isNotEmpty || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                      return "Enter valid email ";
                    }
                    else if (!value.contains('@')) {
                      return 'Email must contain @';
                    }

                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(16.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(16.0))),
                    controller: _checkPasswordController,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Can't be empty ";
                      }
                      else if (value.length < 6){
                        return "Password must contain 6 characters";
                      }
                    }
                ),
              ],
            )),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: _captchaController,
              decoration: InputDecoration(
                  labelText: 'Enter captcha',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(16.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(16.0))),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  color: Colors.white,
                  child: Text(
                    randomString,
                    style: GoogleFonts.alata(fontSize: 22.0,

                    ),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                IconButton(
                    onPressed: () {
                      buildCaptcha();
                    },
                    icon: Icon(
                      Icons.refresh,
                      color: Colors.deepPurple,
                      size: 30.0,
                    ))
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 46, 74, 196)),
                onPressed: () {
                  if(isVerified = _captchaController.text == randomString){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                  }
                  setState(() {

                  });
                },
                child: Container(
                  width: 270.0,
                  height: 45.0,
                  child: Center(
                    child: Text(
                      'Log In',
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ),
                )
            ),
            SizedBox(
              height: 20.0,
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> PasswordScreen()));

              },
              child: Text(
                'Forgotten Password?',
                style: TextStyle(color: Colors.black, fontSize: 15.0),
              ),
            ),

            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 2.0,
                            color: Color.fromARGB(255, 46, 74, 196)),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupScreen()));
                      },
                      child: Container(
                          width: 270.0,
                          height: 45.0,
                          child: Center(
                            child: Text('Create new account',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 46, 74, 196),
                                  fontSize: 15.0
                              ),
                            ),
                          ))),
                ),
              ),
             )
          ],
        ),


      ),
    );
  }
}
