import 'package:flutter/material.dart';
import 'tela_resultado.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionIndex = 0;
  int score = 0;

  List<Question> questions = [
    Question(
      'Qual é o logotipo da Louis Vuitton?',
      [
        'A) Uma flor de lírio',
        'B) Uma coroa',
        'C) Um monograma "LV"',
        'D) Uma águia'
      ],
      'C) Um monograma "LV"',
    ),
    Question(
      'Qual marca de luxo usa um logotipo de duplo "G"?',
      ['A) Gucci', 'B) Chanel', 'C) Prada', 'D) Burberry'],
      'A) Gucci',
    ),
    Question(
      'Quem fundou a marca de luxo Chanel?',
      [
        'A) Coco Chanel',
        'B) Giorgio Armani',
        'C) Ralph Lauren',
        'D) Christian Dior'
      ],
      'A) Coco Chanel',
    ),
    Question(
      'Qual dessas marcas de luxo foi fundada na Itália?',
      ['A) Louis Vuitton', 'B) Versace', 'C) Hermes', 'D) Cartier'],
      'B) Versace',
    ),
    Question(
      'Qual é o produto mais famoso da marca Hermès?',
      ['A) Relógios', 'B) Perfumes', 'C) Bolsas Birkin', 'D) Óculos de sol'],
      'C) Bolsas Birkin',
    ),
    Question(
      'Qual dessas marcas é mais conhecida por seus sapatos vermelhos de sola?',
      [
        'A) Jimmy Choo',
        'B) Manolo Blahnik',
        'C) Christian Louboutin',
        'D) Salvatore Ferragamo'
      ],
      'C) Christian Louboutin',
    ),
    Question(
      'Qual dessas marcas é mais conhecida por sua alta-costura?',
      [
        'A) Givenchy',
        'B) Yves Saint Laurent',
        'C) Fendi',
        'D) Dolce & Gabbana'
      ],
      'A) Givenchy',
    ),
    Question(
      'Qual é o nome da linha de alta-costura da marca italiana Versace?',
      [
        'A) Versace Couture',
        'B) Versace Collection',
        'C) Versace Versus',
        'D) Versace Atelier'
      ],
      'A) Versace Couture',
    ),
  ];

  void checkAnswer(String selectedOption) {
    String correctAnswer = questions[questionIndex].correctAnswer;

    setState(() {
      if (selectedOption == correctAnswer) {
        score++;
      }
      if (questionIndex < questions.length - 1) {
        questionIndex++;
      }
    });
  }

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PERGUNTAS'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.orangeAccent, Colors.black],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  questions[questionIndex].questionText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold, 
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: questions[questionIndex]
                        .options
                        .sublist(0, 2)
                        .map((option) {
                      return ElevatedButton(
                        onPressed: () => checkAnswer(option),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        child: Text(option),
                      );
                    }).toList(),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: questions[questionIndex]
                        .options
                        .sublist(2, 4)
                        .map((option) {
                      return ElevatedButton(
                        onPressed: () => checkAnswer(option),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        child: Text(option),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TelaResultado(
                          score: score,
                          totalPerguntas: questions.length,
                          resetQuiz: resetQuiz,
                        ),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  child: Text(
                    'VEJA O RESULTADO',
                    style: TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String questionText;
  final List<String> options;
  final String correctAnswer;

  Question(this.questionText, this.options, this.correctAnswer);
}