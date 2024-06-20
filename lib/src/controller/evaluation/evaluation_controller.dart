import 'package:my_fitness_progress/src/models/evaluation.dart';
import 'package:my_fitness_progress/src/services/service.dart';

class EvaluationController {
  Service service = Service();

  Evaluation? evaluation;

  Future<void> saveEvaluation() async {
    await service.saveEvaluation(evaluation!);
  }

  // final String collection = "avaliacoes";
  // Future<void> getColletion(String collection) async {
  //   var res = await service.getColletion(collection);
  //   haveData = res.size > 0;
  // }
}