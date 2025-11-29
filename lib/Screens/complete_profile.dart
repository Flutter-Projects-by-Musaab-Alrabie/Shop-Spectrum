import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  Future<void> _saveUserInfo() async {
  if (!_formKey.currentState!.validate()) {
    return;
  }

  try {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'firstName': _firstNameController.text.trim(),
        'lastName': _lastNameController.text.trim(),
        'phoneNumber': _phoneController.text.trim(),
        'address': _addressController.text.trim(),
        'email': user.email,
        'createdAt': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Profile information saved successfully"),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pushNamed(context, '/OTP');
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Failed to save profile: $e"),
        backgroundColor: Colors.red,
      ),
    );
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
              Text("Complete Profile", style: TextStyle(
                  fontSize: 28, fontWeight: FontWeight.bold),),
              Text("Complete your details or continue\n with social media",  textAlign: TextAlign.center,),

              Padding(
                padding: const EdgeInsets.fromLTRB(30, 70, 30, 0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [

                    TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        labelText: "First Name",
                        hintText: "Enter your First Name",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset("assets/icons/User.svg",
                            width: 24,
                            height: 24,
                          ),
                        ),                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      validator: (value) => value!.isEmpty ? "Please enter your first name" : null,
                    ),

                    SizedBox(height: 25,),

                    TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        labelText: "Last Name",
                        hintText: "Enter your Last Name",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset("assets/icons/User.svg",
                            width: 24,
                            height: 24,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      validator: (value) => value!.isEmpty ? "Please enter your last name" : null,
                    ),

                    SizedBox(height: 25,),

                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        hintText: "Enter your phone number",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset("assets/icons/Phone.svg",
                            width: 24,
                            height: 24,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      validator: (value) => value!.length != 10  ? "Please enter a valid phone number" : null,
                    ),

                    SizedBox(height: 25,),

                    TextFormField(
                      controller: _addressController,
                      decoration: InputDecoration(
                        labelText: "Address",
                        hintText: "Enter your phone address",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset("assets/icons/Location point.svg",
                            width: 24,
                            height: 24,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                    ),
                    ],
                  )
                ),
              ),

              SizedBox(height: 40,),


              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: _saveUserInfo,
                  child: Text("continue"),
                  
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
                      Text(
                        "By continuing your confirm that you agree\n with our Term and Condition",
                        textAlign: TextAlign.center,
                      )
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