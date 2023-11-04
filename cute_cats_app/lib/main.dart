import 'dart:math';
import 'package:cute_cats_app/home_view/bloc/cat_bloc.dart';
import 'package:cute_cats_app/home_view/cat_view.dart';
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cats App', style: TextStyle(fontSize: 30)),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.black, Colors.purpleAccent])),
        ),
      ),
      body: Center(
        child: BlocBuilder<CatBloc, CatState>(
          builder: (context, state) {
            if (state is CatInitial) {
              return const CircularProgressIndicator(
                color: Colors.pinkAccent,
              );
            }
            if (state is CatLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${state.cats.length}',
                    style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        for (int index = 0; index < state.cats.length; index++)
                          Positioned(
                            left: random.nextInt(250).toDouble(),
                            top: random.nextInt(400).toDouble(),
                            child: SizedBox(
                              height: 150,
                              width: 150,
                              child: state.cats[index].image,
                            ),
                          )
                      ],
                    ),
                  )
                ],
              );
            } else {
              return const Text('Something went wrong!');
            }
          },
        ),
      ),
      floatingActionButton: Row(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 40,
          ),
          FloatingActionButton(
            backgroundColor: Colors.purpleAccent,
            onPressed: () => context.read<CatBloc>().add(AddCat(Cat.cat[0])),
            child: const Icon(Icons.pets),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            backgroundColor: Colors.purpleAccent,
            onPressed: () => context.read<CatBloc>().add(RemoveCat(Cat.cat[0])),
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () => context.read<CatBloc>().add(AddCat(Cat.cat[1])),
            child: const Icon(Icons.pets),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () => context.read<CatBloc>().add(RemoveCat(Cat.cat[1])),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
