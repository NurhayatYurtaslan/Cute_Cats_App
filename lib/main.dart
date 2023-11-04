import 'package:cute_cats_app/home_view/bloc/cat_bloc.dart';
import 'package:cute_cats_app/home_view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CatBloc()..add(LoadCatCoutner()))
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cats App',
        home: HomeScreen(
          title: 'Cats App',
        ),
      ),
    );
  }
}
