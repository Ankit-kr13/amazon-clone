import 'package:amazon_clone/controller/authController.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-screen";
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLoginEnabled = false;
  var signUpKey = GlobalKey<FormState>();
  var signInKey = GlobalKey<FormState>();

  void signUpSubmit(String email, String password, String name) {
    final isValid = signUpKey.currentState!.validate();
    if (isValid) {
      return;
    }
    signUpKey.currentState!.save();
    authController().signUpUser(
        context: context, email: email, password: password, name: name);
  }

  void signInSubmit() {
    final isValid = signInKey.currentState!.validate();
    if (isValid) {
      return;
    }
    signInKey.currentState!.save();
  }

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Amazon Clone"),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height - 130,
                  child: isLoginEnabled
                      ?
                      //signin-Screen

                      Form(
                          key: signInKey,
                          child: Column(children: [
                            Text(
                              "Sign in with email and password",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sign In",
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Forgot Password",
                                      style: TextStyle(fontSize: 15),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                  return "Enter a valid Email";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Email",
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: passwordController,
                              validator: (value) {
                                RegExp regex = RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
                                if (value!.isEmpty) {
                                  return "Please Enter Password";
                                } else {
                                  if (value.length < 6) {
                                    return " Enter Valid Password";
                                  } else {
                                    return null;
                                  }
                                }
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Password",
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CheckboxListTile(
                              value: true,
                              onChanged: (value) {},
                              title: Text("Show Password"),
                            ),
                            CheckboxListTile(
                              value: true,
                              onChanged: (value) {},
                              title: Text("Keep Signed In"),
                            ),
                            InkWell(
                              onTap: () => signInSubmit(),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width / 2 -
                                            40,
                                    vertical: 20),
                                decoration:
                                    BoxDecoration(color: Colors.orangeAccent),
                                child: Text("Sign In"),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Divider(
                              thickness: 2,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("New To Amazon Clone ?"),
                            SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isLoginEnabled = false;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width / 2 -
                                            100,
                                    vertical: 20),
                                decoration:
                                    BoxDecoration(color: Colors.orange[200]),
                                child: Text("Create a new account"),
                              ),
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: Text("Condition of Use Privacy Notice"),
                            )
                          ]),
                        )

                      //Signup-Screen

                      : Form(
                          key: signUpKey,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Create Account",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: nameController,
                                validator: ((value) {
                                  if (value!.isEmpty) {
                                    return "please enter your name";
                                  }
                                  return null;
                                }),
                                decoration: InputDecoration(
                                  hintText: "Your Name",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(value)) {
                                    return "Enter a valid Email";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: passwordController,
                                validator: (value) {
                                  RegExp regex = RegExp(
                                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
                                  if (value!.isEmpty) {
                                    return "Please Enter Password";
                                  } else {
                                    if (value.length < 6) {
                                      return " Enter Valid Password";
                                    } else {
                                      return null;
                                    }
                                  }
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Password must be atleast 6 characters",
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                validator: (value) {
                                  RegExp regex = RegExp(
                                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
                                  if (value!.isEmpty) {
                                    return "Please Enter Password";
                                  } else {
                                    if (value.length < 6) {
                                      return " Enter Valid Password";
                                    } else {
                                      return null;
                                    }
                                  }
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Re-enter Password",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: (() => signUpSubmit(
                                    emailController.text,
                                    passwordController.text,
                                    nameController.text)),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width /
                                                  2 -
                                              100,
                                      vertical: 20),
                                  decoration:
                                      BoxDecoration(color: Colors.orangeAccent),
                                  child: Text("Create Account"),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Already a Customer ?"),
                              SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isLoginEnabled = true;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width /
                                                  2 -
                                              40,
                                      vertical: 20),
                                  decoration:
                                      BoxDecoration(color: Colors.orange[200]),
                                  child: Text("Sign In"),
                                ),
                              ),
                              Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                    "By creating an account,you agree to Amazon's Clone Condition of Use and privacy Notice."),
                              )
                            ],
                          ),
                        )),
            ),
          ),
        ));
  }
}
