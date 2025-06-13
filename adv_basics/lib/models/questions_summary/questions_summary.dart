import 'package:adv_basics/models/questions_summary/summary_item.dart';
import 'package:flutter/cupertino.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children:
              summaryData.map((data) {
                return SummaryItem(data);
              }).toList(),
        ),
      ),
    );
  }
}
