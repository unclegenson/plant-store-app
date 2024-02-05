import 'package:flutter/material.dart';
import 'package:ghaleb_1/screens/home.dart';

import '../sabet/sabet.dart';
import 'bottomPart.dart';
import 'splash1.dart';
import 'splash2.dart';
import 'splash3.dart';
import 'splash4.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _controller = PageController();
  int page = 0;
  List<double> w = [20, 10, 10, 10];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    PageRouteBuilder(
                      transitionDuration: Duration(seconds: 1),
                      transitionsBuilder: (_, a, __, c) =>
                          FadeTransition(opacity: a, child: c),
                      pageBuilder: (_, __, ___) => const HomePage(),
                    ),
                  );
                },
                child: Text(
                  'skip',
                  style: TextStyle(fontSize: 20, color: SabetHa.primary),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: SabetHa.primary,
          onPressed: () {
            setState(() {
              page == 3
                  ? Navigator.of(context).pushReplacement(
                      PageRouteBuilder(
                        transitionDuration: Duration(seconds: 1),
                        transitionsBuilder: (_, a, __, c) =>
                            FadeTransition(opacity: a, child: c),
                        pageBuilder: (_, __, ___) => const HomePage(),
                      ),
                    )
                  : _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear);
              w = [10, 10, 10, 10];
              w[page] = 20;
            });
          },
          child: const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 22,
          ),
        ),
        body: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            PageView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                setState(() {
                  page = value;
                  w = [10, 10, 10, 10];
                  w[page] = 20;
                });
              },
              children: [
                Page1(size: size),
                Page2(size: size),
                Page3(size: size),
                Page4(size: size),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: 60,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DotWidget(
                      width: w[0],
                    ),
                    DotWidget(
                      width: w[1],
                    ),
                    DotWidget(
                      width: w[2],
                    ),
                    DotWidget(
                      width: w[3],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DotWidget extends StatelessWidget {
  final double width;
  const DotWidget({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: width,
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: SabetHa.primary,
      ),
    );
  }
}
