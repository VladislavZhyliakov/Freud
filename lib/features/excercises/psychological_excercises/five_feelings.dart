import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FiveFeelings extends StatelessWidget {
  const FiveFeelings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 241, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 204, 241, 255),
        centerTitle: true,
        title: Text(
          '5 відчуттів',
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
              children: [
                Text(
                  'Ця вправа може допомогти позбутись стресу. Потрібно сконцентруватись на 1 з 5 головних відчуттів - зір, дотик, слух, нюх, смак.',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Color.fromARGB(255, 15, 21, 77),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  '1. Подивіться навколо та знайдіть 5 предметів, які вам подобаються на вигляд. Буде круто, якщо ви назвете уголос чи подумки кожен із них. Це допоможе вам заземлитися та повернутися до реальності.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color.fromARGB(255, 15, 21, 77),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  '2. Знайдіть 4 предмети, які вам подобаються на дотик. Підійдіть та торкніться кожного, помацайте - уголос чи подумки опиши ці відчуття.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color.fromARGB(255, 15, 21, 77),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  '3. Знайдіть 3 звуки навколо себе, назвіть їх (уголос чи подумки).',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color.fromARGB(255, 15, 21, 77),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  '4. Знайдіть 2 запахи. Це може бути запах одягу, приміщення, мила або крему на руках, волосся. Пошукайте їх та назвіть подумки чи вголос.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color.fromARGB(255, 15, 21, 77),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  '5. Знайдіть 1 смак. Можете описати присмак, який відчуваєте на губах. Або взяти чай чи каву, жуйку - та описати їх.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color.fromARGB(255, 15, 21, 77),
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(
              'assets/images/5_feelings_image.png',
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
