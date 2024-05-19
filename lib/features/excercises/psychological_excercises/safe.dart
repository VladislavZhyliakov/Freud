import 'package:flutter/material.dart';
import 'package:freud/stylings/colors_preferences.dart';

class SafePage extends StatelessWidget {
  const SafePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      appBar: AppBar(
        backgroundColor: mainBackgroundColor,
        title: const Text(
          'Сейф',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ця вправа може допомогти нав\'язливого спогаду. Потрібно сконцентруватись на уяві і водобразити вправу максимально чітко.',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                SizedBox(height: 30),
                Text(
                  '1. Уяви найбільш надійний у всесвіті сейф:',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 15),
                Text(
                  '2. Уяви дрібні деталі. Якого він розміру? Скільки важить? Якого кольору? Скільки на ньому замків? Яких саме? Де він розташований? У космосі? Під землею? На дні океану? Під твоїм ліжком?',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                SizedBox(height: 15),
                Text(
                  '3. Поклади до сейфу спогад, що тебе дістає найбільше. Закрий усі замки. Активуй захист.',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                SizedBox(height: 15),
                Text(
                  '4. Який твій стан зараз? Якщо цей інструмент не допоміг можеш почитати більше у розділі Нав\'язливі думки.',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                SizedBox(height: 15),
                Text(
                  '5. Знайди 1 смак. Можеш описати присмак, який відчуваєш на губах. Або взяти чай чи каву, жуйку - та описати їх.',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(
              'assets/images/safe_image.png',
              height: 150,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
