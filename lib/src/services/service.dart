import 'dart:convert';

import 'package:my_fitness_progress/src/dao/generic_dao.dart';
import 'package:my_fitness_progress/src/models/evaluation.dart';

class Service {
  GenericDao dao = GenericDao();

  Future<List<Evaluation>> getListEvaluation() async {
    List avaliacoes = await dao.findAll();

    List<Evaluation> evaluationList = [];
    for (var a in avaliacoes) {
      var avaliacao = jsonDecode(a["evaluation"]);
      Evaluation evaluation = Evaluation.fromJson(avaliacao);
      evaluationList.add(evaluation);
    }

    return evaluationList;
  }

  Future<void> saveEvaluation(Evaluation evaluation) async {
    await dao.save(jsonEncode(evaluation.toJson()));
  }

  Future<void> deleteEvaluation() async {
    await dao.delete(1);
  }
}
