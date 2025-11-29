import 'package:flutter/material.dart';
import 'package:hyperlink/hyperlink.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              AppBar(
                leading: BackButton(),
              ),

              SizedBox(height: 40,),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Forgot Password", style: TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                  ),

                  Text("Please enter your email and we will send\n you a link to return to your account", textAlign: TextAlign.center),


                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Enter your email",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),),
                        suffixIcon: Icon(Icons.email_outlined),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                    ),
                  ),
                ],
              ),


              SizedBox(height: 100,),

              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(onPressed:(){
                  Navigator.pushNamed(context, '/splashPage');
                },
                  child:
                  Text("Continue"),
                  style:
                  ElevatedButton.styleFrom(

                    backgroundColor: Color(0xfffb7a43),
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(color: Colors.white, fontSize: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 100,),

              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?", style: TextStyle(fontSize: 15, color: Colors.grey),),

                    SizedBox(width: 5,),

                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/Register');
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(0xfffb7a43),  fontSize: 15,
                        ),
                      ),
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