import 'package:flutter/material.dart';
import 'package:freud/stylings/colors_preferences.dart';

class FiveFeelings extends StatelessWidget {
  const FiveFeelings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      appBar: AppBar(
        backgroundColor: mainBackgroundColor,
        title: const Text(
          '5 відчуттів',
          style: TextStyle(fontWeight: FontWeight.bold),
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
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                SizedBox(height: 30),
                Text(
                  '1. Подивися навколо та знайди 5 предметів, які тобі подобаються на вигляд. Буде круто, якщо ти назвеш уголос чи подумки кожен із них. Це допоможе тобі заземлитися та повернутися до реальності.',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                SizedBox(height: 15),
                Text(
                  '2. Знайди 4 предмети, які тобі подобаються на дотик. Підійди та торкнися кожного, помацай - уголос чи подумки опиши ці відчуття.',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                SizedBox(height: 15),
                Text(
                  '3. Знайди 3 звуки навколо себе, назви їх (уголос чи подумки).',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                SizedBox(height: 15),
                Text(
                  '4. Знайди 2 запахи. Це може бути запах одягу, приміщення, мила або крему на руках, волосся. Пошукай їх та назви подумки чи вголос.',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                SizedBox(height: 15),
                Text(
                  '5. Знайди 1 смак. Можеш описати присмак, який відчуваєш на губах. Або взяти чай чи каву, жуйку - та описати їх.',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
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
            ),
          ),
        ],
      ),
    );
  }
}
