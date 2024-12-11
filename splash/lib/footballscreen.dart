import 'package:flutter/material.dart';

class FootballScreen extends StatefulWidget {
  @override
  _FootballScreenState createState() => _FootballScreenState();
}

class _FootballScreenState extends State<FootballScreen> {

  final List<String> ahlyPlayers = [
    "محمد الشناوي",
    "علي معلول",
    "محمد هاني",
    "ياسر إبراهيم",
    "رامي ربيعة",
    "حمدي فتحي",
    "أليو ديانغ",
    "عمرو السولية",
    "محمد مجدي أفشة",
    "حسين الشحات",
    "محمود كهربا"
  ];

  
  final List<String> zamalekPlayers = [
    "محمد صبحي",
    "أحمد فتوح",
    "حسام عبدالمجيد",
    "حمزة المثلوثي",
    "محمد عبدالغني",
    "إمام عاشور",
    "يوسف أوباما",
    "طارق حامد",
    "أحمد سيد زيزو",
    "سيف الدين الجزيري",
    "محمود شيكابالا"
  ];

  int ahlyScore = 0;
  int zamalekScore = 0;
  List<String>ahlyScores = [];
  List<String>zamalekScores = [];


  void updateScore(String team, String player) {
    setState(() {
      if (team == "Ahly") {
        ahlyScore++;
        ahlyScores.add(player);
      } else if (team == "Zamalek") {
        zamalekScore++;
        zamalekScores.add(player);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الأهلي vs الزمالك"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/alahly.jpg',
                    width: 100,
                    height: 200,
                  ),
                  Text(
                    "الأهلي: $ahlyScore",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  if(ahlyScores.isEmpty)
                  Text('الهدافين:${ahlyScores.join(", ")}', style: TextStyle(fontSize: 16),),
                ],
              ),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: ahlyPlayers
                    .map((player) => ElevatedButton(
                          onPressed: () => updateScore("Ahly", player),
                          child: Text(player, textAlign: TextAlign.center),
                        ))
                    .toList(),
              ),
              Divider(thickness: 2),
              Column(
                children: [
                  Image.asset(
                    'assets/zamalek-logo.png',
                    width: 100,
                    height: 100,
                  ),
                  Text(
                    "الزمالك: $zamalekScore",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  if(zamalekScores.isEmpty)
                  Text('الهدافين:${zamalekScores.join(", ")}',style: TextStyle(fontSize: 16),),
                ],
              ),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: zamalekPlayers
                    .map((player) => ElevatedButton(
                          onPressed: () => updateScore("Zamalek", player),
                          child: Text(player, textAlign: TextAlign.center),
                        ))
                    .toList(),
              ),
            ],
          ),
          ),
      ),
);
}
}