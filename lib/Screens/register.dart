import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> _createAccount() async {
  if (!_formKey.currentState!.validate()) {
    return;
  }

  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    String uid = userCredential.user!.uid;

    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'email': _emailController.text.trim(),
      'createdAt': Timestamp.now(),
      'uid': uid,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Account created successfully"),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.pushNamed(context, '/CompleteProfile');

  } on FirebaseAuthException catch (e) {
    String message = "Registration failed";

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  } catch (e) {
    // Any unexpected errors
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("An unexpected error occurred: $e"),
        backgroundColor: Colors.red,
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 75.0),
                child: Column(
                  children: [
                    Text(
                      "Register Account",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),

                    SizedBox(height: 7),
                    Text(
                      "Complete your details or continue with social media",
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 35),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(
                              12.0,
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/Mail.svg',
                              width: 20,
                              height: 20,
                            ),
                          ),

                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        validator: (value) =>
                            (value == null ||
                                value.isEmpty ||
                                !value.contains('@'))
                            ? 'Invalid email'
                            : null,
                      ),

                      SizedBox(height: 25),

                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          suffixIcon: Icon(Icons.lock_outline_rounded),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        obscureText: true,
                        validator: (value) =>
                            (value == null || value.length < 1)
                            ? 'Password must be at least 7 characters'
                            : null,
                      ),

                      SizedBox(height: 25),

                      TextFormField(
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          hintText: 'Re-enter your password',
                          labelText: 'Confirm Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          suffixIcon: Icon(Icons.lock_outline_rounded),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        obscureText: true,
                        validator: (value) =>
                            (value == null || value.length < 1)
                            ? 'Password must be at least 7 characters'
                            : (value != _passwordController.text)
                            ? "Passwords don't match"
                            : null,
                      ),

                      SizedBox(height: 40),

                      SizedBox(
                        height: 50,
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () {
                            _createAccount();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfffb7a43),
                            foregroundColor: Colors.white,
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text("Continue"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 110),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: SvgPicture.asset("assets/icons/google-icon.svg"),
                  ),

                  TextButton(
                    onPressed: () {},
                    child: SvgPicture.asset("assets/icons/facebook-2.svg"),
                  ),

                  TextButton(
                    onPressed: () {},
                    child: SvgPicture.asset("assets/icons/twitter.svg"),
                  ),
                ],
              ),

              SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.only(top: 45.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "by continuing, your confirm that you agree",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}