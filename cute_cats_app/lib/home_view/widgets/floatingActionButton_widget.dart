import 'package:cute_cats_app/home_view/widgets/addCatButton_widget.dart';
import 'package:cute_cats_app/home_view/widgets/removeCatButton_widget.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class floatingActionButton extends StatelessWidget {
  const floatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 40,
        ),
        addCatButton_widget(
          index: 0,
          bgcolor: Colors.purpleAccent,
        ),
        SizedBox(
          width: 10,
        ),
        removeCatButton_widget(index: 0, bgcolor: Colors.purpleAccent),
        SizedBox(
          width: 10,
        ),
        addCatButton_widget(
          bgcolor: Colors.black,
          index: 1,
        ),
        SizedBox(
          width: 10,
        ),
        removeCatButton_widget(index: 1, bgcolor: Colors.black)
      ],
    );
  }
}
