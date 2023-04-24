

import 'package:flutter/material.dart';
import 'package:carisma/screen/forgot_password/forgot_password_screen.dart';
import 'package:carisma/screen/login_success/login_success_screen.dart';
import 'package:carisma/viewmodels/sign_in_view_model.dart';
import 'package:carisma/widget/custom_surffix_icon.dart';
import 'package:carisma/widget/default_button.dart';
import 'package:carisma/widget/form_error.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();  // 局部更新
  final List<String> errors = [];
  late String email;
  late String password;
  bool isRememberPassword = false;

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<SignInViewModel>(context);

    // TODO: implement build
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildEmailTextField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          _buildPasswordTextField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: viewModel.errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          Row(
            children: [
              Checkbox(
                  value: isRememberPassword,  // 勾勾的 color
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      isRememberPassword = value ?? false;
                    });
                  }
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                },
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          DefaultButton(
            text: "Continue",
            onTapped: () {
              _formKey.currentState!.save();
              viewModel.signInWithFirebaseEmail(email: email, password: password).then((result) {
                if (result) {
                  Navigator.of(context).pushNamedAndRemoveUntil(LoginSuccessScreen.routeName,
                          (Route<dynamic> route) => false);
                }
              });
            },
          )
        ],
      ),
    );
  }

  // TODO: Password Text
  TextFormField _buildPasswordTextField() {
    return TextFormField(
      onSaved: (value) => password = value ?? "",
      obscureText: true,
      decoration: InputDecoration(
          labelText: "Password",
          hintText: "Enter your password",
          // 浮動 Label Show method
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffix(svgIcon: "assets/icons/Lock.svg")
      ),
    );
  }

  // TODO: Email Text
  TextFormField _buildEmailTextField() {
    return TextFormField(
      onSaved: (value) => email = value ?? "",
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter your Email",
          // 浮動 Label Show method
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffix(svgIcon: "assets/icons/Mail.svg",)
      ),
    );
  }
}