import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:airq/models/body_text.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.result, {super.key});
  final List<Map<String, Object>> result;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: 400,
      child: SingleChildScrollView(
        child: Column(
          spacing: 30,
          children: [
            ...result.map((item) {
              return Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 33,
                    width: 33,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: (item['userAnswer'] == item['correctAnswer'])
                          ? Colors.green
                          : const Color.fromARGB(255, 244, 67, 54),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: BodyText(
                      ((item['index'] as int) + 1).toString(),
                      20,
                      FontWeight.w400,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BodyText(
                          item['question'].toString(),
                          20,
                          FontWeight.w500,
                        ),
                        Text(
                          item['userAnswer'].toString(),
                          style: GoogleFonts.manrope(
                            color: (item['userAnswer'] == item['correctAnswer'])
                                ? Colors.green
                                : const Color.fromARGB(255, 244, 67, 54),
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          item['correctAnswer'].toString(),
                          style: GoogleFonts.manrope(
                            color: Colors.green,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
