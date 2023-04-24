//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:carisma/constants.dart';
// import 'package:carisma/models/my_list_model.dart';
// import 'package:carisma/size_config.dart';
// import 'package:carisma/viewmodels/my_list_view_model.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';
//
// import '../../models/product.dart';
//
// class Body extends StatefulWidget {
//
//   @override
//   _BodyState createState() => _BodyState();
// }
//
// class _BodyState extends State<Body> {
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Provider.of<MyListViewModel>(context, listen: false).getMyListInFirebase();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     // TODO: implement build
//     return Padding(
//       padding: const EdgeInsets.only(left: 10, right: 10),
//       child: GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount:2,
//             childAspectRatio: 250 / MediaQuery.of(context).size.width,
//             crossAxisSpacing: 10
//           ),
//           itemCount: Provider.of<MyListViewModel>(context).myListModel?.products.length ?? 0,
//           itemBuilder: (context, index) {
//             return SizedBox(
//               child: Consumer<MyListViewModel>(
//                 builder: (context, viewModel, child) {
//                   Product? model = viewModel.myListModel?.products[index];
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       AspectRatio(
//                         aspectRatio: 1,
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: kSecondaryColor.withOpacity(0.1),
//                               borderRadius: BorderRadius.circular(15)
//                           ),
//                           child: Image.asset("assets/images/ps4_console_white_1.png"),
//                         ),
//                       ),
//
//                       Text(
//                         model?.brandName ?? '',
//                         style: TextStyle(color: Colors.black),
//                       ),
//                       Text(
//                         model?.title ?? '',
//                         style: TextStyle(color: Colors.black),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "\$${model?.price ?? 0}",
//                             style: TextStyle(
//                                 fontSize: getProportionateScreenWidth(18),
//                                 fontWeight: FontWeight.bold,
//                                 color: kPrimaryColor
//                             ),
//                           ),
//
//                           InkWell(
//                             borderRadius: BorderRadius.circular(30),
//                             onTap: () {
//                               print("Tapped Add MyList");
//                             },
//                             child: Container(
//                               alignment: Alignment.center,
//                               padding: EdgeInsets.all(8),
//                               decoration: BoxDecoration(
//                                 color: kPrimaryColor.withOpacity(0.15),
//                                 shape: BoxShape.circle
//                               ),
//                               child: SvgPicture.asset(
//                                 "assets/icons/Heart Icon_2.svg",
//                                 color: Color(0xFFFF4848),
//                               ),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   );
//                 },
//               ),
//             );
//           }
//       ),
//     );
//   }
// }