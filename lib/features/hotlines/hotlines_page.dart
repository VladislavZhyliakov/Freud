// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:freud/stylings/colors_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

const callButtonColor = Color.fromARGB(255, 72, 47, 131);

class CrisisContactsPage extends StatelessWidget {
  const CrisisContactsPage({super.key});

  void callHotline(String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      appBar: AppBar(
        title: const Center(
          child: Text("Гарячі лінії",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        backgroundColor: mainBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Card(
              color: Colors.white,
              child: ListTile(
                leading:
                    Image.asset('assets/images/lifeline_icon.png', height: 40),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          'Про організацію',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset('assets/images/lifeline_icon.png',
                                height: 40),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Text(
                                'Лінія підтримки психічного здоров\'я та запобігання самогубствам. Працює 24/7. Без вихідних і свят.',
                                style: TextStyle(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  callHotline('7333');
                                },
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Text('7333 '), Icon(Icons.call)],
                                ))
                          ],
                        ),
                      );
                    },
                  );
                },
                title: const Text('LifeLine Ukraine'),
                trailing: IconButton(
                  icon: Icon(Icons.call, color: callButtonColor),
                  onPressed: () {
                    callHotline('7333');
                  },
                ),
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          'Про організацію',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset('assets/images/support_icon.png',
                                height: 40),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Text(
                                'Гаряча лінія від Українського ветеранського фонду. Працюють досвідчені фахівці-психологи. Працює 24/7. Без вихідних і свят.',
                                style: TextStyle(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  callHotline('0 800 33 20 29');
                                },
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('0 800 33 20 29 '),
                                    Icon(Icons.call)
                                  ],
                                ))
                          ],
                        ),
                      );
                    },
                  );
                },
                leading:
                    Image.asset('assets/images/support_icon.png', height: 40),
                title: const Text('Лінія кризової підтримки УВФ'),
                trailing: IconButton(
                  icon: Icon(Icons.call, color: callButtonColor),
                  onPressed: () {
                    callHotline('0 800 33 20 29');
                  },
                ),
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          'Про організацію',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset('assets/images/emergency.png',
                                height: 40),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Text(
                                'Контактний номер швидкої медичної допомоги. Працює 24/7. Без вихідних і свят.',
                                style: TextStyle(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  callHotline('103');
                                },
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Text('103 '), Icon(Icons.call)],
                                ))
                          ],
                        ),
                      );
                    },
                  );
                },
                leading: Image.asset('assets/images/emergency.png', height: 40),
                title: const Text('Швидка медична допомога'),
                trailing: IconButton(
                  icon: Icon(Icons.call, color: callButtonColor),
                  onPressed: () async {
                    final Uri url = Uri(scheme: 'tel', path: '103');
                    await launchUrl(url);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
