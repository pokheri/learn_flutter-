import 'package:flutter/material.dart';

import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool obsecureValue = true;
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  void moveToHomePage(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      changeButton = changeButton ? false : true;
      setState(() {});
      await Future.delayed(Duration(seconds: 1));
      Navigator.pushNamed(context, MyRoute.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 17),
              Image.asset('assets/images/hey.png', fit: BoxFit.cover),
              SizedBox(height: 20),
              Text(
                "Welcome  $name",
                style: TextStyle(
                  fontSize: 22,
                  // fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 33,
                  vertical: 16,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter user name ',
                          labelText: "Username",
                        ),
                        validator: (value) {
                          if ((value ?? "").isEmpty) {
                            return "Value can't be empty";
                          }
                          return null;
                        },

                        onChanged: (value) {
                          name = value;
                          setState(() {}); // telling futter to redraw the ui
                        },
                      ),

                      TextFormField(
                        obscureText: obsecureValue,
                        validator: (value) {
                          if ((value ?? "").isEmpty) {
                            return "Password  can't be empty";
                          } else if (value!.length < 6) {
                            return "The length is too small ";
                          }

                          return null;
                        },

                        decoration: InputDecoration(
                          hintText: 'Enter user password ',
                          labelText: "Password",
                          suffixIcon: IconButton.outlined(
                            style: IconButton.styleFrom(side: BorderSide.none),
                            onPressed: () {
                              obsecureValue = obsecureValue ? false : true;
                              setState(() {});
                            },
                            icon: Icon(
                              obsecureValue
                                  ? Icons.remove_red_eye_rounded
                                  : Icons.remove_red_eye_outlined,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      Material(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(
                          changeButton ? 50 : 8,
                        ),
                        child: InkWell(
                          onTap: () => moveToHomePage(context),
                          splashColor: Colors.white,

                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            height: 38,
                            width: changeButton ? 41 : 90,
                            alignment: Alignment.center,

                            child: changeButton
                                ? Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 20,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
