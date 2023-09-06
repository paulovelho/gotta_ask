import 'package:random_color/random_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:gotta_ask/deck/questions/model.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

final rnd = math.Random();

Color getRandomColor() =>
    RandomColor().randomColor(colorBrightness: ColorBrightness.dark);

final List<QuestionModel> newQuestions = [
  QuestionModel(
    text: "Se você pudesse ser um legume, qual legume você seria?",
    package: 'Basic',
    favorite: false,
    color: [getRandomColor(), getRandomColor()],
  ),
];

final List<CardModel> questions = [
  CardModel(
    name: 'One, 1',
    job: 'Developer',
    city: 'Areado',
    color: [getRandomColor(), getRandomColor()],
  ),
  CardModel(
    name: 'Two, 2',
    job: 'Manager',
    city: 'New York',
    color: [getRandomColor(), getRandomColor()],
  ),
  CardModel(
    name: 'Three, 3',
    job: 'Engineer',
    city: 'London',
    color: [getRandomColor(), getRandomColor()],
  ),
  CardModel(
    name: 'Four, 4',
    job: 'Designer',
    city: 'Tokyo',
    color: [getRandomColor(), getRandomColor()],
  ),
];
