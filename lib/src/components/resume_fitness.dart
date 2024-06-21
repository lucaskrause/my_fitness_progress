import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_fitness_progress/src/controller/evaluation/evaluation_controller.dart';
import 'package:my_fitness_progress/src/screen/physical_evaluation/new_evaluation_page.dart';

class ResumeFitness extends StatefulWidget {
  final EvaluationController controller;
  const ResumeFitness(this.controller, {super.key});

  @override
  State<ResumeFitness> createState() => _ResumeFitnessState();
}

class _ResumeFitnessState extends State<ResumeFitness> {
  int touchedIndex = -1;
  bool isShadowBar(int rodIndex) => rodIndex == 1;
  Map<int, List<double>> mainItems = <int, List<double>>{};

  BarChartGroupData generateGroup(int x, double v1, double v2) {
    final sum = v1 + v2;
    final isTouched = touchedIndex == x;

    return BarChartGroupData(
      x: x,
      groupVertically: true,
      showingTooltipIndicators: isTouched ? [0] : [],
      barRods: [
        BarChartRodData(
          toY: sum,
          width: 20,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(6),
            topRight: Radius.circular(6),
          ),
          rodStackItems: [
            BarChartRodStackItem(
              0,
              v1,
              Theme.of(context).colorScheme.onTertiaryContainer,
              BorderSide(
                color: Colors.white,
                width: isTouched ? 2 : 0,
              ),
            ),
            BarChartRodStackItem(
              v1,
              v1 + v2,
              Theme.of(context).colorScheme.onSecondaryContainer,
              BorderSide(
                color: Colors.white,
                width: isTouched ? 2 : 0,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> showAskEvaluation() async {
    await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Deseja cadastrar uma avaliação?"),
          content: const Text(
              "Você ainda não tem avaliações cadastras, faça sua primeira avaliação para futuras comparações durante sua evolução"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Não cadastrar"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) => const NewEvaluationPage(isFirst: true)),
                );
              },
              child: const Text("Cadastrar"),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      if (widget.controller.evaluationList.isEmpty) {
        showAskEvaluation();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        title: AspectRatio(
          aspectRatio: 1.2,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 100,
              minY: 0,
              barTouchData: BarTouchData(
                handleBuiltInTouches: false,
                touchCallback: (FlTouchEvent event, barTouchResponse) {
                  if (!event.isInterestedForInteractions ||
                      barTouchResponse == null ||
                      barTouchResponse.spot == null) {
                    setState(() {
                      touchedIndex = -1;
                    });
                    return;
                  }
                  final rodIndex = barTouchResponse.spot!.touchedRodDataIndex;
                  if (isShadowBar(rodIndex)) {
                    setState(() {
                      touchedIndex = -1;
                    });
                    return;
                  }
                  setState(() {
                    touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
                  });
                },
                touchTooltipData: BarTouchTooltipData(
                  maxContentWidth: 200,
                  getTooltipColor: (data) {
                    return Colors.blueGrey;
                  },
                  tooltipHorizontalAlignment: FLHorizontalAlignment.center,
                  tooltipMargin: -10,
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    double total = rod.rodStackItems[1].toY;
                    double fat = rod.rodStackItems[0].toY;
                    double muscle = total - fat;

                    return BarTooltipItem(
                      'Descrição',
                      const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '\nMassa magra: ${muscle}Kg',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: '\nMassa gorda: ${fat}Kg',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: '\nPeso total: ${total}Kg',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(),
                rightTitles: const AxisTitles(),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        const style =
                            TextStyle(color: Colors.white, fontSize: 10);
                        String text;
                        if (value == 0) {
                          text = '0';
                        } else {
                          text = '${value.toInt()}';
                        }
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          space: 4,
                          child: Text(
                            text,
                            style: style,
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                      interval: 10,
                      reservedSize: 25),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      const style = TextStyle(
                          color: Colors.white,
                          fontSize:
                              10); //TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                      String text;
                      switch (value.toInt()) {
                        case 0:
                          text = 'Primeira avaliação';
                        case 1:
                          text = 'Última avaliação';
                        case 2:
                          text = 'Objetivo';
                        default:
                          text = 'Sem dado';
                      }

                      return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(text, style: style));
                    },
                  ),
                ),
              ),
              gridData: FlGridData(
                show: true,
                checkToShowHorizontalLine: (double value) => value % 10 == 0,
                getDrawingHorizontalLine: (double value) {
                  if (value == 0) {
                    return FlLine(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        strokeWidth: 3);
                  }
                  return FlLine(
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimaryContainer
                        .withOpacity(0.2),
                    strokeWidth: 1,
                  );
                },
              ),
              barGroups: mainItems.entries
                  .map((e) => generateGroup(
                        e.key,
                        e.value[0],
                        e.value[1],
                      ))
                  .toList(),
              borderData: FlBorderData(show: false),
            ),
          ),
        ),
        subtitle: const Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Text('Peso atual: ',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Text('80', style: TextStyle(color: Colors.white)),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text('Percentual de gordura: ',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Text('15.1%', style: TextStyle(color: Colors.white)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
