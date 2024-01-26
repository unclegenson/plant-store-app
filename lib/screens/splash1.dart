import 'package:flutter/material.dart';
import 'package:ghaleb_1/sabet/sabet.dart';

class Page1 extends StatelessWidget {
  const Page1({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Flexible(
            flex: 5,
            child: Image.asset(
              'assets/images/8.png',
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Flexible(
            flex: 1,
            child: SizedBox(
              child: Text(
                'گیاهان رو بهتر از قبل بشناس',
                style: TextStyle(
                  fontSize: 20,
                  color: SabetHa.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Flexible(
            flex: 1,
            child: SizedBox(
              width: size.width - 40,
              child: Text(
                '''راجع به نگهداری گلت چقدر اطلاعات داری؟ اینجا هر چقدر بخوای میتونی اطلاعات کسب کنی''',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green[800],
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
