import 'package:drift/drift.dart' as dr;
import 'package:gotta_ask/database/database.dart';

class QuestionControl {
  Future<int> addQuestion(
    String q,
    int packageId,
  ) {
    QuestionRowCompanion qRow = QuestionRowCompanion(
      q: dr.Value(q),
      packageId: dr.Value(packageId),
    );
    return Database.instance.getDb().insertQuestion(qRow);
  }
}
