

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carisma/screen/home/home_screen.dart';
import 'package:carisma/screen/main_screen.dart';
import 'package:carisma/screen/otp/otp_screen.dart';
import 'package:carisma/viewmodels/complete_profile_view_model.dart';
import 'package:carisma/widget/custom_surffix_icon.dart';
import 'package:carisma/widget/default_button.dart';
import 'package:carisma/widget/form_error.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../size_config.dart';
import '../../utils.dart';


class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();

  final List<String> errors = [];

  late String name;
  late String account;
  late String phone;
  String birthday = "";
  String gender = "";

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var viewModel = Provider.of<CompleteProfileViewModel>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [

          _buildAccountTextFormField(),

          SizedBox(height: getProportionateScreenHeight(20)),

          _buildNameTextFormField(),
          
          SizedBox(height: getProportionateScreenHeight(20)),

          _buildBirthDayTextFormField(),

          SizedBox(height: getProportionateScreenHeight(20)),
          
          _buildGenderTextFormField(),
          
          SizedBox(height: getProportionateScreenHeight(20)),

          _buildPhoneTextFormField(),

          FormError(errors: errors),

          SizedBox(height: getProportionateScreenHeight(30)),
          
          DefaultButton(
              text: "continue",
              onTapped: () {
                _formKey.currentState!.validate();
                // _formKey.currentState!.save();
                // viewModel.completeProfileInFirebase();

                // if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                //   Navigator.pushNamed(context, OtpScreen.routeName);
                // }
              }
          ),
          SizedBox(height: 10),
          MaterialButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, MainScreen.routeName, (route) => false);
            },
            child: Text("Skip >"),
          )
        ],
      ),
    );
  }

  TextFormField _buildPhoneTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (value) => phone = value ?? "",
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (optionValue) {
        String value = optionValue ?? "";
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Phone Number",
          hintText: "Enter your phone number",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffix(svgIcon: "assets/icons/Phone.svg",)
      ),
    );
  }

  Widget _buildGenderTextFormField() {

    return GestureDetector(
      onTap: () {
        if (FocusManager.instance.primaryFocus != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
        showCupertinoModalPopup(context: context, builder: (context) => _buildGenderSheet());
      },
      child: AbsorbPointer(
        child: TextFormField(
          onSaved: (value) => gender = value ?? "",
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kPhoneNumberNullError);
            }
            return null;
          },
          validator: (optionValue) {
            String value = optionValue ?? "";
            if (value.isEmpty) {
              addError(error: kPhoneNumberNullError);
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
              labelText: "Gender",
              hintText: gender.isEmpty ? "Enter your Gender" : gender,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffix(svgIcon: "assets/icons/User.svg",)
          ),
        ),
      ),
    );
  }

  Widget _buildBirthDayTextFormField() {

    return GestureDetector(
      onTap: () {
        if (FocusManager.instance.primaryFocus != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }

        Utils.showSheet(
            context: context,
            child: _buildDatePicker(),
            onTapped: () {
              Navigator.pop(context);
            }
        );
      },
      child: AbsorbPointer(
        child: TextFormField(
          onSaved: (value) => birthday = value ?? "",
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kPhoneNumberNullError);
            }
            return null;
          },
          validator: (optionValue) {
            String value = optionValue ?? "";
            if (value.isEmpty) {
              addError(error: kPhoneNumberNullError);
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
              labelText: "Birthday",
              hintText: birthday.isEmpty ? "Enter your birthday" : birthday,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffix(svgIcon: "assets/icons/User.svg",)
          ),
        ),
      ),
    );
  }

  TextFormField _buildAccountTextFormField() {
    return TextFormField(
      onSaved: (value) => account = value ?? "",
      validator: (value) {
        String strongValue = value ?? "";
        if (strongValue.isEmpty) {
          addError(error: kNameNullError);
          return "";
        }
      },
      decoration: InputDecoration(
          labelText: "Account",
          hintText: "Enter your account",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffix(svgIcon: "assets/icons/User.svg",)
      ),
    );
  }

  TextFormField _buildNameTextFormField() {
    return TextFormField(
      onSaved: (value) => name = value ?? "",
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        }
        return null;
      },
      validator: (optionValue) {
        String value = optionValue ?? "";
        if (value.isEmpty) {
          addError(error: kNameNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Name",
          hintText: "Enter your name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffix(svgIcon: "assets/icons/User.svg",)
      ),
    );
  }

  Widget _buildDatePicker() {
    return SizedBox(
      height: 180,
      child: CupertinoDatePicker(
        initialDateTime: DateTime.now(),
        mode: CupertinoDatePickerMode.date,
        onDateTimeChanged: (dateTime) {
          setState(() {
            birthday = DateFormat('yyyy-MM-dd').format(dateTime);
          });
        },
      ),
    );
  }

  CupertinoActionSheet _buildGenderSheet() => CupertinoActionSheet(
    title: Text("Gender"),
    message: Text("Select your gender"),
    actions: [
      CupertinoActionSheetAction(
        onPressed: () {
          setState(() {
            gender = "male";
          });
          Navigator.pop(context);
        },
        child: Text("male")
      ),
      CupertinoActionSheetAction(
        onPressed: () {
          setState(() {
            gender = "female";
          });
          Navigator.pop(context);
        },
        child: Text("female")
      )
    ],
    cancelButton: CupertinoActionSheetAction(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text("Cancel"),
    ),
  );
}