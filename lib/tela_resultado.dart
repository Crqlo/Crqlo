import 'package:flutter/material.dart';

class TelaResultado extends StatelessWidget {
  final int score;
  final int totalPerguntas;
  final Function resetQuiz;

  TelaResultado({ required this.score,  required this.totalPerguntas,  required this.resetQuiz,
  });

  @override
  Widget build(BuildContext context) {
    String mensagem =
        score >= (totalPerguntas / 2) ? 'Parabéns!' : 'Tente novamente';
    return Scaffold(
      appBar: AppBar(title: Text("RESULTADO")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Image.network(
                      'https://static.stealthelook.com.br/wp-content/uploads/2022/03/marcas-de-luxo-e-o-impacto-da-alta-de-seus-precos-no-mercado-de-moda-chanel-20220303034553.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.6),
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        mensagem,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold, // Adicionando negrito
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Pontuação: $score / $totalPerguntas',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                resetQuiz();
                Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Text(
                "Recomeçar",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

