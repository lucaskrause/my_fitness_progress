import 'package:my_fitness_progress/src/models/evaluation.dart';
import 'package:my_fitness_progress/src/services/service.dart';

class EvaluationController {
  Service service = Service();

  EvaluationController() {
    getListEvaluations();
  }

  List<Evaluation> evaluationList = [];
  Evaluation? evaluation;

  Future<void> getListEvaluations() async {
    evaluationList = await service.getListEvaluation();
  }

  Future<void> saveEvaluation() async {
    await service.saveEvaluation(evaluation!);
  }

  Future<void> deleteEvaluation() async {
    await service.deleteEvaluation();
  }

  // final String collection = "avaliacoes";
  // Future<void> getColletion(String collection) async {
  //   var res = await service.getColletion(collection);
  //   haveData = res.size > 0;
  // }
}
