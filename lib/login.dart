import 'package:flutter/material.dart';
import 'package:tasks/register.dart';
import 'package:tasks/itemList.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isPassword = true;
  var nameController = TextEditingController();

  var passwordController = TextEditingController();
  final formController = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          //to make the in save area in screen
          child: Container(
            child: Column(children: [
              //to form the widget one ander the athor
              ClipPath(
                  //to make a wave in container
                  clipper: waveClipper(), //this is class
                  child: Container(
                    height: 200,
                    alignment: Alignment
                        .center, //to make the text in center of container
                    color: Colors.deepPurple,
                    child: Text(
                      'REGISTER',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  )),
              Padding(
                //to separate the widget from the other widget
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: formController,
                  //to make a form to take inputs from the user
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceEvenly, //to make the children in the column to take an equal space in the in the available space
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter full name';
                            }
                            return null;
                          },
                          //to take a text input from user
                          decoration: const InputDecoration(
                            // to organize the shape of textformfield
                            hintText: 'Full Name',
                            label: Text(
                              'Name',
                              style: TextStyle(color: Colors.deepPurple),
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.deepPurple,
                            ),
                            //suffixIcon: Icon(Icons.search),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 24),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter password ';
                            } else if (value.length < 8) {
                              return 'your password must by at least 8 letters ';
                            }
                            return null;
                          },
                          obscureText: isPassword,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            label: Text(
                              'Password',
                              style: TextStyle(color: Colors.deepPurple),
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.deepPurple,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPassword = !isPassword;
                                });
                              },
                              icon: isPassword
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: Colors.deepPurple,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color: Colors.deepPurple,
                                    ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 24),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ElevatedButton(
                          // to make a button
                          onPressed: () {
                            if (formController.currentState!.validate()) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const AnimatedItems();
                              }));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(width: 1, color: Colors.black),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 3,
                            primary: Colors.deepPurple,
                            minimumSize: Size(double.infinity, 60),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Register();
                            }));
                          },
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(width: 1, color: Colors.black),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 3,
                            primary: Colors.white,
                            minimumSize: Size(double.infinity, 60),
                          ),
                          child: Text(
                            'Register',
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 32,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class waveClipper extends CustomClipper<Path> {
  //this a class to extend the customClip to make a wave in the container widget
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = new Path();
    path.lineTo(0, size.height);
    path.cubicTo(size.width / 3, size.height - 100, 3 * (size.width / 4),
        (size.height / 2) + 150, size.width, size.height * 0.7);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
