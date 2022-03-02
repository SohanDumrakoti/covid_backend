import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:coronatracker/data/auth.dart';
import 'package:coronatracker/data/fingerprint.dart';
import 'package:coronatracker/models/user_model.dart';
import 'package:coronatracker/screens/auth/register_screen.dart';
import 'package:coronatracker/screens/home/home.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isVisible = false;
  final _formKey = GlobalKey<FormState>();
  FingerPrintLock fingerPrintLock = FingerPrintLock();
  Auth auth = Auth();

  void notify() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 3,
          channelKey: 'key1',
          title: 'Error',
          body: 'Successfully logged on',
          notificationLayout: NotificationLayout.Default,
          bigPicture:
              'https://images.idgesg.net/images/article/2019/01/android-q-notification-inbox-100785464-large.jpg?auto=webp&quality=85,70'),
    );
  }

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
                            text: "Welcome\n",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black,
                            ),
                            children: const [
                              TextSpan(
                                text: "Back.",
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
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_emailController.text.isNotEmpty &&
                                  _passwordController.text.isNotEmpty) {
                                // final response = await auth.login(UserModel(
                                //     email: _emailController.text,
                                //     password: _passwordController.text));
                                // print(response);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "Input fields can't be empty")));
                              }
                              // notify();
                            },
                            child: Text("Login"),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: InkWell(
                            onTap: () async {
                              bool isAuth =
                                  await fingerPrintLock.authenticate();
                              if (isAuth) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));

                                notify();
                              }
                            },
                            child: Text(
                              "Authenticate with fingerprint",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                            },
                            child: Text(
                              "Don't have an account",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
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
      ),
    );
  }
}
