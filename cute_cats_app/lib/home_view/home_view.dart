import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';



class Cats extends Equatable {
  final String id;
  final String name;
  final Image image;

  const Cats({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, image];
  
  static List<Cats> cats = [
    Cats(id: '1',
    name: 'Cat One',
    image: Image.asset('images/cat_one.png')
    ),
    Cats(id: '2',
    name: 'Cat Two',
    image: Image.asset('images/cat_two.png')
    ),
  ];
}
