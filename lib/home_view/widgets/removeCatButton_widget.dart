// ignore: file_names
import 'package:cute_cats_app/home_view/bloc/cat_bloc.dart';
import 'package:cute_cats_app/home_view/cat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: camel_case_types
class removeCatButton_widget extends StatelessWidget {
  final dynamic index;
  final Color bgcolor;

  const removeCatButton_widget({
    super.key,
    required this.index,
    required this.bgcolor,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: bgcolor,
      onPressed: () => context.read<CatBloc>().add(RemoveCat(Cat.cat[index])),
      child: const Icon(Icons.remove),
    );
  }
}
