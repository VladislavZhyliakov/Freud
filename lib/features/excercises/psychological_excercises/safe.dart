import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SafePage extends StatelessWidget {
  const SafePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 241, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 204, 241, 255),
        centerTitle: true,
        title: Text(
          'Сейф',
          style: GoogleFonts.unbounded(
            fontSize: 24,
            color: const Color.fromARGB(255, 15, 21, 77),
          ),
          textAlign: TextAlign.center,
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
                  'Ця вправа може допомогти позбутися нав\'язливого спогаду. Потрібно сконцентруватись на уяві і відобразити вправу максимально чітко.',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Color.fromARGB(255, 15, 21, 77),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  '1. Уявіть найбільш надійний у всесвіті сейф.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color.fromARGB(255, 15, 21, 77),
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 15),
                Text(
                  '2. Уявіть дрібні деталі. Якого він розміру? Скільки важить? Якого кольору? Скільки на ньому замків? Яких саме? Де він розташований? У космосі? Під землею? На дні океану? Під твоїм ліжком?',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color.fromARGB(255, 15, 21, 77),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  '3. Покладіть до сейфу спогад, що тебе дістає найбільше. Закрийте усі замки. Активуйте захист.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color.fromARGB(255, 15, 21, 77),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  '4. Який ваш стан зараз? Якщо ця вправа не допомогла, можете спробувати вправу 5 відчуттів',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color.fromARGB(255, 15, 21, 77),
                  ),
                ),

                SizedBox(height: 70),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(
              'assets/images/safe_image.png',
              height: 150,
              width: double.infinity,
              color: const Color.fromARGB(255, 15, 21, 77),
            ),
          ),
        ],
      ),
    );
  }
}
