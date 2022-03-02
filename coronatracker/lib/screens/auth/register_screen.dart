import 'package:coronatracker/data/auth.dart';
import 'package:coronatracker/models/user_model.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confPasswordController = TextEditingController();
  bool isVisible = false;
  final _formKey = GlobalKey<FormState>();
  Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Container(
                  width: size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "Register\n",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black,
                            ),
                            children: const [
                              TextSpan(
                                text: "Here.",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                        TextField(
                          controller: _emailController,
                          decoration:
                              InputDecoration(hintText: "Email here...."),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration:
                              InputDecoration(hintText: "Password here...."),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _confPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Confirm Password here...."),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_emailController.text.isNotEmpty ||
                                  _passwordController.text.isEmpty ||
                                  _confPasswordController.text.isNotEmpty) {
                                if (_passwordController.text ==
                                    _confPasswordController.text) {
                                  final response =
                                      await auth.register(UserModel(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  ));
                                  print(response);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text("Passwords donot match")));
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "Input fields can't be empty")));
                              }
                            },
                            child: Text("Register"),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
