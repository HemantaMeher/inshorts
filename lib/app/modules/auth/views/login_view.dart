import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inshorts/utils/color_constant.dart';
import 'package:inshorts/utils/image_constant.dart';

import '../../home/views/home_view.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isPass = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  String? validatePhoneNumber(String value) {
    // Regex pattern for validating phone numbers
    Pattern pattern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid phone number';
    } else {
      return null;
    }
  }

  String? validateEmail(String value) {
    // Regex pattern for validating email addresses
    Pattern pattern =
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var h =  MediaQuery.of(context).size.height;
    var w =  MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: ColorConstant.blackPlate3,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: h * .27,
                  width: w*.8,
                  child: Center(
                    child: Image.asset(ImageConstant.fullLogo),
                  ),
                ),
                Container(
                  height: h*.75,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: h* .02,),
                          Text("Log In",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w600,color: ColorConstant.blackPlate1),),
                          const SizedBox(height: 5,),
                          const Text("Log in to continue...",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Color(0xff686D76)),),
                          SizedBox(height: h* .04,),
                          TextFormField(
                            controller: _emailController,
                            decoration: textFieldDecoration("Email Id : "),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter an email address';
                              }
                              return validateEmail(value);
                            },
                          ),
                          SizedBox(height: h * .015,),
                          TextFormField(
                            controller: _passController,
                            obscureText: _isPass,
                            decoration: passTextFieldDecoration("Password : ",),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: h * .015,),
                          TextFormField(
                            controller: _phoneController,
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            decoration: textFieldDecoration("Phone No : "),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a phone number';
                              }
                              return validatePhoneNumber(value);
                            },
                          ),
                          SizedBox(height: h * .05,),
                          SizedBox(
                            width: w * 1,
                            height: h* .055,
                            child: ElevatedButton(
                              onPressed: () async{

                                if (_formKey.currentState!.validate()) {
                                  Get.offAll(HomeView());
                                }
                              },
                              child: Text("Log In",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorConstant.blackPlate1
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration textFieldDecoration(String hint){
    return InputDecoration(
        hintText: hint,
        fillColor: ColorConstant.blackPlate3,
        hintStyle: TextStyle(color: ColorConstant.blackPlate1.withOpacity(.5)),
        filled: true,
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder()
    );
  }
  InputDecoration passTextFieldDecoration(String hint,){
    return InputDecoration(
        hintText: hint,
        suffixIcon: IconButton(
          icon: Icon(
            _isPass ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _isPass = !_isPass;
            });
          },
        ),
        fillColor: ColorConstant.blackPlate3,
        hintStyle: TextStyle(color: ColorConstant.blackPlate1.withOpacity(.5)),
        filled: true,
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder()
    );
  }

  OutlineInputBorder outlineInputBorder(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(11),
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 2,
        )
    );
  }

}
