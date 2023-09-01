import 'package:flutter/material.dart';
import 'package:trilhapp/model/card_details.dart';
import 'package:trilhapp/pages/card_details.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  var cardDetail = CardDetails(
      1,
      'Eder Sena',
      'https://avatars.githubusercontent.com/u/26800480?v=4',
      'Caros amigos, a execução dos pontos do programa estimula a padronização do remanejamento dos quadros funcionais. Por outro lado, a complexidade dos estudos efetuados oferece uma interessante oportunidade para verificação do fluxo de informações. É importante questionar o quanto o entendimento das metas propostas representa uma abertura para a melhoria de alternativas às soluções ortodoxas.');

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        width: double.infinity,
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CardDetailPage(cardDetail: cardDetail);
            }));
          },
          child: Hero(
            tag: cardDetail.id,
            child: Card(
              elevation: 8,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            cardDetail.url,
                            width: 100,
                            height: 100,
                          ),
                        ),
                        Text(
                          cardDetail.title,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(cardDetail.text),
                    Container(
                        width: double.infinity,
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: const Text("Ler Mais",
                                style: TextStyle(
                                    decoration: TextDecoration.underline))))
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
