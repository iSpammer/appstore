

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Category {
  final String icon;
  final String title;
  Category({required this.icon, required this.title});
}

class CategoriesWidget extends StatelessWidget {

  final List<Category> models = [
    Category(icon: "", title: "title"),
    Category(icon: "", title: "title"),
    Category(icon: "", title: "title"),
    Category(icon: "", title: "title"),
    Category(icon: "", title: "title"),
    Category(icon: "", title: "title")
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: Align(
            child: Text("分類"),
          )
        ),
        Divider(color: Colors.grey),
        SizedBox(
          height: MediaQuery.of(context).size.width / 3 * 2,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1  // 寬高比
            ),
            itemBuilder: (context, index) {
              return TextButton(
                style: TextButton.styleFrom(

                ),
                onPressed: () {
                  // TODO: Navigator.push Screen

                },
                child: Column(
                  children: [
                    Expanded(child: Icon(Icons.headset_sharp)),
                    Text(models[index].title)
                  ],
                ),
              );
            },
            itemCount: 6,
          ),
        ),
      ],
    );
  }
}