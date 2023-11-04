import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';



class Cat extends Equatable {
  final String id;
  final String name;
  final Image image;

  const Cat({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, image];
  
  static List<Cat> cat = [
    Cat(id: '1',
    name: 'Cat One',
    image: Image.asset('assets/images/cat_one.png')
    ),
    Cat(id: '2',
    name: 'Cat Two',
    image: Image.asset('assets/images/cat_two.png')
    ),
  ];
}
