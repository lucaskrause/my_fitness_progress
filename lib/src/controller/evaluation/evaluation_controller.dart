import 'package:my_fitness_progress/src/models/evaluation.dart';
import 'package:my_fitness_progress/src/services/service.dart';

class EvaluationController {
  EvaluationController();

  final String collection = "avaliacoes";
  Service service = Service();

  bool haveData = false;

  Evaluation evaluation = Evaluation();

  // Future<void> getColletion(String collection) async {
  //   var res = await service.getColletion(collection);
  //   haveData = res.size > 0;
  // }

  Future<void> saveEvaluation() async {
    await service.saveEvaluation(evaluation);
  }
}