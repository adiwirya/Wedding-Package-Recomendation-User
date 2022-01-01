import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_app/screens/result_screen.dart';

import '../providers/question.dart';
import '../providers/question_state.dart';
import '../providers/criterias.dart';

class QuestionScreen extends StatefulWidget {
  static const routeName = '/question';

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final questionData = Provider.of<Questions>(context);
    final questions = questionData.questions;
    var state = Provider.of<QuestionState>(context);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.grey[50],
            elevation: 0,
            title: Text(
              'Question',
              style: TextStyle(
                color: Colors.pink[200],
              ),
            ),
          ),
          body: _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : PageView.builder(
                  controller: state.controller,
                  itemCount: questions.length + 1,
                  itemBuilder: (context, index) {
                    var screenHeight = MediaQuery.of(context).size.height;
                    if (index > 11) {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: screenHeight * 0.3,
                              ),
                              Text(
                                'Congrats! You have answered all questions',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.pink[200],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              SizedBox(
                                height: 50,
                                width: 300,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    var result = await state.submit();
                                    Provider.of<Results>(context, listen: false)
                                        .getRecomendation(result);
                                    Navigator.of(context).pushReplacementNamed(
                                        ResultScreen.routeName);
                                  },
                                  child: const Text("Submit Answer"),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.pink[200],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    } else {
                      return QuestionText(index + 1, questions[index]);
                    }
                  })),
    );
  }
}

class QuestionText extends StatefulWidget {
  int index;
  Question questions;
  QuestionText(this.index, this.questions);

  @override
  State<QuestionText> createState() => _QuestionTextState();
}

class _QuestionTextState extends State<QuestionText> {
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<QuestionState>(context);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.index}/12",
              style: TextStyle(
                color: Colors.indigo[900],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Text(
              widget.questions.questionText,
              style: TextStyle(
                color: Colors.pink[200],
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widget.questions.options.map((opt) {
                  return ChangeNotifierProvider.value(
                    value: opt,
                    child: RadioListTile(
                      tileColor: Colors.pink[50],
                      title: Text(opt.optionText),
                      groupValue: state.answer[widget.index - 1],
                      value: opt.value,
                      onChanged: (value) {
                        setState(() {
                          state.answer[widget.index - 1] = value;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: screenWidth * 0.35,
                  color: Colors.pink[50],
                  child: InkWell(
                    onTap: () {
                      state.prevQuestion();
                    },
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(Icons.arrow_back),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 16),
                                child: Text(
                                  "Previous",
                                  style: TextStyle(color: Colors.indigo[900]),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                Container(
                  width: screenWidth * 0.35,
                  color: Colors.pink[50],
                  child: InkWell(
                    onTap: () {
                      state.nextQuestion();
                    },
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(Icons.arrow_forward),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 16),
                                child: Text(
                                  "Next",
                                  style: TextStyle(color: Colors.indigo[900]),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
