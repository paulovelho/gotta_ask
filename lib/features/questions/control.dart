import 'package:drift/drift.dart' as dr;
import 'package:gotta_ask/database/database.dart';
import 'package:gotta_ask/features/questions/model.dart';

class QuestionControl {
  DatabaseInstance db() {
    return Database.instance.getDb();
  }

  Future<int> addQuestion(
    String q,
    int packageId,
  ) {
    QuestionRowCompanion qRow = QuestionRowCompanion(
      q: dr.Value(q),
      packageId: dr.Value(packageId),
    );
    return db().insertQuestion(qRow);
  }

  Future<List<Question>> getCardsFromPackages(packages, {int limit = 0}) {
    return db().getSomeQuestions(packages, limit: limit);
  }
}
