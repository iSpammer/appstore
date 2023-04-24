//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:carisma/models/demo_help_center_model.dart';
//
// class Body extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//
//     return SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 50,
//                 child: Align(
//                   child: Text("常見問題"),
//                 )
//               ),
//               Divider(color: Colors.grey,),
//               for(var model in demoHelpCenter ) _buildItem(model.title),
//               SizedBox(
//                   height: 50,
//                   child: Align(
//                     child: Text("分類"),
//                   )
//               ),
//               Divider(color: Colors.grey,),
//               SizedBox(
//                   height: 50,
//                   child: Align(
//                     child: Text("聯絡我們"),
//                   )
//               ),
//             ],
//           ),
//         )
//     );
//   }
//
//   Widget _buildItem(String title) {
//     return SizedBox(
//       height: 50,
//
//       child: GestureDetector(
//         behavior: HitTestBehavior.translucent,
//         onTap: () {
//           // Go to WebView
//           print(title);
//         },
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Spacer(),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Text(title),
//             ),
//             Spacer(),
//             Divider(color: Colors.grey,)
//           ],
//         ),
//       ),
//     );
//   }
// }