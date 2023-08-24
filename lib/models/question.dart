import 'package:psciapp/pages/questionPage.dart';

class Question {
  String id;
  Emotion? humor;
  String pontoAlto;
  String? pontoBaixo;

  Question({required this.id, required this.humor, required this.pontoAlto, required this.pontoBaixo});

  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "humor": humor,
      "ponto alto": pontoAlto,
      "ponto baixo": pontoBaixo
    };
  }
}