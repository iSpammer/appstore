

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carisma/screen/complete_profile/complete_profile_screen.dart';
import 'package:carisma/viewmodels/sign_up_view_model.dart';
import 'package:carisma/widget/custom_surffix_icon.dart';
import 'package:carisma/widget/default_button.dart';
import 'package:carisma/widget/form_error.dart';
import 'package:provider/provider.dart';

import '../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  late String confirmPassword;
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var viewModel = Provider.of<SignUpViewModel>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildEmailTextFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          _buildPasswordTextFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          _buildConfirmPassTextFormField(),
          SizedBox(height: 10),
          FormError(errors: viewModel.errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            onTapped: () {
              _formKey.currentState!.save();
              viewModel.registrationWithEmail(email: email, password: password, confirmPassword: confirmPassword).then((result) {
                if (result) {
                  Navigator.pushNamedAndRemoveUntil(context, CompleteProfileScreen.routeName, (route) => false);
                }
              });
            }
          )
        ],
      )
    );
  }

  TextFormField _buildConfirmPassTextFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (value) => confirmPassword = value ?? "",
      decoration: InputDecoration(
          labelText: "Confirm Password",
          hintText: "Re-enter your password",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffix(svgIcon: "assets/icons/Lock.svg")
      ),
    );
  }

  TextFormField _buildPasswordTextFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (value) => password = value ?? "",
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffix(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField _buildEmailTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => email = value!,
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffix(svgIcon: "assets/icons/Mail.svg",)
      ),
    );
  }
}