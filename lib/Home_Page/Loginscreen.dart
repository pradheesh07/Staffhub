import 'package:flutter/material.dart';
import 'package:staffhub/Home_Page/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _emailError = false;
  bool _passwordError = false;
  late SharedPreferences loginData;
  late bool newuser;

  @override
  void initState() {
    super.initState();
    _isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 160)),
            const Align(
              alignment: Alignment.center,
            ),
            Container(
              height: 90,
              width: 90,
              child: const Image(
                image: AssetImage('assets/logo.png'),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            Container(
                alignment: Alignment.center,
                height: 20,
                width: 146,
                child: Text('We are Electric',
                    style: TextStyle(
                      letterSpacing: 0.02,
                      fontSize: 12,
                      color: Colors.green[900],
                    ))),
            const SizedBox(
              height: 49,
            ),
            Container(
              width: 238,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Center(
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: 'E-mail',
                      errorText: _emailError ? 'Email cannot be empty' : null,
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(12.0)),
                  style: const TextStyle(color: Colors.white),
                  onChanged: (_) {
                    setState(() {
                      _emailError = false;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: 238,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Center(
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      errorText:
                          _passwordError ? 'Password cannot be empty' : null,
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(12.0)),
                  style: const TextStyle(color: Colors.white),
                  obscureText: true,
                  onChanged: (_) {
                    setState(() {
                      _passwordError = false;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 47,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (emailController.text.isEmpty) {
                    _emailError = true;
                  } else {
                    _emailError = false;
                  }
                  if (passwordController.text.isEmpty) {
                    _passwordError = true;
                  } else {
                    _passwordError = false;
                  }
                  if (_emailError || _passwordError) {
                    return;
                  }
                  String email = emailController.text;
                  String password = passwordController.text;

                  if (email != '' && password != '') {
                    loginData.setBool('islogin', false);
                    loginData.setString('email', email);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Homepage()));
                  }
                });
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(238, 42)),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)), // Button shape
                ),
              ),
              child: Container(
                width: 238,
                height: 42,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF1B5E20),
                      Color(0xFF1B5E20),
                      Color(0XFF000000)
                    ],
                    stops: [0, 0.5, 1],
                  ),
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      spreadRadius: -2,
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white), // Text color
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Forget Password ? ',
                  style: TextStyle(color: Colors.green[900]),
                ))
          ],
        ),
      ),
    );
  }

  Future<void> _isLoggedIn() async {
    loginData = await SharedPreferences.getInstance();
    newuser = (loginData.getBool('islogin') ?? true);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Homepage()));
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
