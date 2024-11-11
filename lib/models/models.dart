import 'package:flutter/cupertino.dart';

class Mood {
  final UniqueKey id;
  final String title;
  final String img;
  Mood({required this.id, required this.title, required this.img});
}

class Moods{
  List<Mood> _list =  [
    Mood(id: UniqueKey(), title: "Радость", img: "assets/icons/radosti.png"),
    Mood(id: UniqueKey(), title: "Страх", img: "assets/icons/strax.png"),
    Mood(id: UniqueKey(), title: "Бешенство", img: "assets/icons/beshenstvo.png"),
    Mood(id: UniqueKey(), title: "Грусть", img: "assets/icons/grusti.png"),
    Mood(id: UniqueKey(), title: "Спокойствие", img: "assets/icons/spakoynistvo.png"),
    Mood(id: UniqueKey(), title: "Сила", img: "assets/icons/sila.png"),
  ];

  List<Mood> get list => _list;

}