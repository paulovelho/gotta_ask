import 'package:flutter/material.dart';
import 'package:gotta_ask/deck_manager.dart';
import 'package:gotta_ask/theme/theme.dart';
import 'card_model.dart';

class QuestionCard extends StatelessWidget {
  final CardModel question;

  const QuestionCard({
    required this.question,
    Key? key,
  }) : super(key: key);

  Widget favoriteButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => DeckManager.instance.favorite(question),
      heroTag: "favorite-bt-{$question.id}",
      child: const Icon(Icons.favorite),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Color> bgColors = question.color;
    if (bgColors.length == 1) {
      bgColors
          .add(Theme.of(context).extension<PlatypusExtension>()!.cardGradient);
    }
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
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
          ],
        ),
      ),
    );
  }
}
