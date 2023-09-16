import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gotta_ask/state.dart';
import 'card_model.dart';

class QuestionCard extends StatelessWidget {
  final CardModel question;

  const QuestionCard({
    required this.question,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var deck = appState.deck;

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: question.color,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
      ),
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            question.text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            question.package,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Colors.white24,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 200),
          FloatingActionButton(
            onPressed: () => deck.saveQuestion(question.text),
            heroTag: "favorite-bt",
            child: const Icon(Icons.favorite),
          )
        ]),
      ),
    );
  }
}
