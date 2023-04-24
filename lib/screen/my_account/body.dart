

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carisma/enums.dart';
import 'package:carisma/screen/my_account_edit/my_account_edit_screen.dart';
import 'package:carisma/viewmodels/my_account_view_model.dart';
import 'package:carisma/widget/date_picker_widget.dart';
import 'package:carisma/widget/gender_sheet_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'my_account_cell.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  late String nameChange = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<MyAccountViewModel>(context, listen: false).getMyAccountInfoInFirebase();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<MyAccountViewModel>(context);

    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 250,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // TODO: Background Image
                Container(
                    decoration: BoxDecoration(
                        color: Colors.black
                    )
                ),

                // TODO: Profile Image
                SizedBox(
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                    backgroundImage: (viewModel.myAccount?.profileImage ?? "").isNotEmpty ?
                      NetworkImage(viewModel.myAccount?.profileImage ?? "") : AssetImage("assets/images/Profile Image.png") as ImageProvider
                  )
                ),

                // TODO: Edit Profile Icon
                Positioned(
                  left:  MediaQuery.of(context).size.width/2 + 20 ,
                  top: 140,
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: MaterialButton(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45),
                        side: BorderSide(color: Colors.white)
                      ),
                      color: Color(0xfff5f6f9),
                      child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                      onPressed: () {
                        print("change profile image");
                      },
                    ),
                  )
                )
              ],
            ),
          ),

          MyAccountCell(
            title: "名稱",
            value: viewModel.myAccount?.name ?? "",
            didTapped: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      MyAccountEditScreen(() => viewModel.getMyAccountInfoInFirebase(),
                        type: AccountEditType.name,
                      ),
                  )
              );
            }
          ),

          MyAccountCell(
            title: "使用者帳號",
            value: viewModel.myAccount?.account ?? "",
            didTapped: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      MyAccountEditScreen(() => viewModel.getMyAccountInfoInFirebase(),
                        type: AccountEditType.userAccount,
                      ),
                  )
              );
            }
          ),

          MyAccountCell(
            title: "簡介",
            value: viewModel.myAccount?.introduction ?? "",
            didTapped: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      MyAccountEditScreen(() => viewModel.getMyAccountInfoInFirebase(),
                        type: AccountEditType.introduction,
                      ),
                  )
              );
            }
          ),

          Container(
            height: 15,
            decoration: BoxDecoration(
              color: Colors.grey
            ),
          ),


          MyAccountCell(
            title: "性別",
            value: viewModel.myAccount?.gender ?? "",
            didTapped: () {

              showCupertinoModalPopup(context: context, builder: (context) {
                return GenderSheetWidget(
                  didTappedFemale: () {
                    viewModel.setGenderInFirebase(value: 'female');
                    Navigator.pop(context);
                  },
                  didTappedMale: () {
                    viewModel.setGenderInFirebase(value: 'male');
                    Navigator.pop(context);
                  },
                  didTappedCancel: () {
                    Navigator.pop(context);
                  }
                );
              });
            }
          ),

          MyAccountCell(
            title: "生日",
            value: viewModel.myAccount?.birthday ?? "",
            didTapped: () {
              showCupertinoModalPopup(context: context, builder: (context) {
                return DatePickerWidget((date) {
                  viewModel.setBirthdayInFirebase(value: date);
                });
              });
            }
          ),

          MyAccountCell(
            title: "手機號碼",
            value: viewModel.myAccount?.phone ?? "",
            didTapped: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      MyAccountEditScreen(() => viewModel.getMyAccountInfoInFirebase(),
                        type: AccountEditType.cellphone,
                      ),
                  )
              );
            }
          ),

          MyAccountCell(
            title: "email",
            value: viewModel.myAccount?.email ?? "",
            didTapped: () {

            }
          ),

          Container(
            height: 15,
            decoration: BoxDecoration(
                color: Colors.grey
            ),
          ),

          MyAccountCell(
            title: "密碼變更",
            value: "",
            didTapped: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      MyAccountEditScreen(() => viewModel.getMyAccountInfoInFirebase(),
                        type: AccountEditType.password,
                      ),
                  )
              );
            }
          ),
        ]
      ),
    );
  }
}