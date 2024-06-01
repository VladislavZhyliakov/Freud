// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

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
      backgroundColor: const Color.fromARGB(255, 204, 241, 255),
      appBar: AppBar(
        title: Text(
          'Гарячі лінії',
          style: GoogleFonts.unbounded(
            fontSize: 24,
            color: const Color.fromARGB(255, 15, 21, 77),
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color.fromARGB(255, 204, 241, 255),
        centerTitle: true,
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
                                style: TextStyle(
                                    color: Color.fromARGB(255, 15, 21, 77),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  callHotline('7333');
                                },
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '7333 ',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 15, 21, 77),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Icon(
                                      Icons.call,
                                      color: Color.fromARGB(255, 15, 21, 77),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      );
                    },
                  );
                },
                title: const Text(
                  'LifeLine Ukraine',
                  style: TextStyle(
                      color: Color.fromARGB(255, 15, 21, 77),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.call,
                    color: Color.fromARGB(255, 15, 21, 77),
                  ),
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
                                style: TextStyle(
                                    color: Color.fromARGB(255, 15, 21, 77),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
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
                                    Text(
                                      '0 800 33 20 29 ',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 15, 21, 77),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Icon(
                                      Icons.call,
                                      color: Color.fromARGB(255, 15, 21, 77),
                                    )
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
                title: const Text(
                  'Лінія кризової підтримки УВФ',
                  style: TextStyle(
                      color: Color.fromARGB(255, 15, 21, 77),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.call,
                    color: Color.fromARGB(255, 15, 21, 77),
                  ),
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
                                style: TextStyle(
                                    color: Color.fromARGB(255, 15, 21, 77),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  callHotline('103');
                                },
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '103 ',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 15, 21, 77),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Icon(
                                      Icons.call,
                                      color: Color.fromARGB(255, 15, 21, 77),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      );
                    },
                  );
                },
                leading: Image.asset('assets/images/emergency.png', height: 40),
                title: const Text(
                  'Швидка медична допомога',
                  style: TextStyle(
                      color: Color.fromARGB(255, 15, 21, 77),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.call,
                    color: Color.fromARGB(255, 15, 21, 77),
                  ),
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
