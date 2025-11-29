import 'package:flutter/material.dart';
import 'package:hyperlink/hyperlink.dart';


class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();

    void _continue() {
    if (_formKey.currentState!.validate()){
      Navigator.pushNamed(context, '/Products');
    }
  }

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

              Text("OTP Verification", style: TextStyle(
                  fontSize: 28, fontWeight: FontWeight.bold),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "We sent your code to +1 898 860*** ",
                        ),
                        TextSpan(
                          text: "\nThis code will expire in",
                        ),
                        TextSpan(
                          text: " 00:13",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xfffb7a43),
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),

              SizedBox(height: 100,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Form(
                  key: _formKey,
                  child: Row(
                    children: [


                      SizedBox(
                        width: 50,
                        height: 150,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            else if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a code';
                            }
                            return null;
                          },
                        ),
                      ),
                  
                      SizedBox(width: 25,),
                  
                      SizedBox(
                        width: 50,
                        height: 150,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            else if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },    
                          textAlign: TextAlign.center,                      
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a code';
                            }
                            return null;
                          },
                        ),
                      ),
                  
                      SizedBox(width: 25,),
                  
                      SizedBox(
                        width: 50,
                        height: 150,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            else if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a code';
                            }
                            return null;
                          },
                        ),
                      ),
                  
                      SizedBox(width: 25,),
                  
                      SizedBox(
                        width: 50,
                        height: 150,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            else if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },      
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a code';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 40,),

              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(onPressed:() {
                 _continue();
                },
                child:
                Text("continue"),
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

              SizedBox(height: 25,),

              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    HyperLink
                      (
                        textStyle: TextStyle(color: Colors.black, fontSize: 15),
                        linkStyle: TextStyle(
                            color: Colors.grey,  fontSize: 11, decoration: TextDecoration.underline),
                        text: '[Resend OTP Code]()'
                    ),
                  ] ,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}