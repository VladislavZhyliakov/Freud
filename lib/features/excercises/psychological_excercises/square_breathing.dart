import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BreathingSquare extends StatefulWidget {
  const BreathingSquare({super.key});

  @override
  _BreathingSquareState createState() => _BreathingSquareState();
}

class _BreathingSquareState extends State<BreathingSquare>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  final List<String> _texts = ['ВДИХ', 'ПАУЗА', 'ВИДИХ', 'ПАУЗА'];
  int _currentTextIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 16));
    _animation = TweenSequence<Offset>([
      TweenSequenceItem(
          tween: Tween(
              begin: const Offset(-0.5, -0.5), end: const Offset(0.5, -0.5)),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(
              begin: const Offset(0.5, -0.5), end: const Offset(0.5, 0.5)),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(
              begin: const Offset(0.5, 0.5), end: const Offset(-0.5, 0.5)),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(
              begin: const Offset(-0.5, 0.5), end: const Offset(-0.5, -0.5)),
          weight: 1),
    ]).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.repeat();
      }
    });

    _controller.addListener(() {
      final progress = _controller.value * 4;
      final index = progress.floor();
      if (index != _currentTextIndex) {
        setState(() {
          _currentTextIndex = index % _texts.length;
        });
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            'Дихання по квадрату',
            style: GoogleFonts.unbounded(
              fontSize: 24,
              color: const Color.fromARGB(255, 15, 21, 77),
            ),
            textAlign: TextAlign.center,
          ),
        backgroundColor: const Color.fromARGB(255, 204, 241, 255),
      ),
      backgroundColor: const Color.fromARGB(255, 204, 241, 255),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 50),
            child: Column(
              children: [
                Text(
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Color.fromARGB(255, 15, 21, 77),),
                    'Стрес часто примушує нас дихати швидко і поверхнево, тому мозок перенасичується киснем. Вправи на дихання знижують рівень кисню та подають сигнал заспокоєння для мозку.'),
                SizedBox(height: 30),
                Text(
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color:  Color.fromARGB(255, 15, 21, 77),),
                    'Дихайте так: вдих пауза видих пауза. Всі чотири етапи мають однакову довжину приблизно по 4 секунди. Щоб вам було легше це робити, стежте за рухом по цьому квадрату.'),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xFFB5D5E0), width: 10),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  Positioned(
                    child: Text(
                      _texts[_currentTextIndex],
                      style:
                          const TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ),
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(
                          _animation.value.dx * 200,
                          _animation.value.dy * 200,
                        ),
                        child: const Dot(),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
