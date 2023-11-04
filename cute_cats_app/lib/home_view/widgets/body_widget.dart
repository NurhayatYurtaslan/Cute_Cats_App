
import 'dart:math';
import 'package:cute_cats_app/home_view/bloc/cat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: camel_case_types
class bodyWidget extends StatelessWidget {
  const bodyWidget({
    super.key,
    required this.random,
  });

  final Random random;

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
