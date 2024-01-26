import 'package:flutter/material.dart';

import '../sabet/sabet.dart';

class PlantDetails extends StatefulWidget {
  final int id;
  const PlantDetails({super.key, required this.id});

  @override
  State<PlantDetails> createState() => _PlantDetailsState();
}

class _PlantDetailsState extends State<PlantDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: CircleAvatar(
            backgroundColor: Colors.green[100],
            child: Icon(
              Icons.close,
              color: SabetHa.primary,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              padding: const EdgeInsets.all(2),
              icon: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.green[100],
                child: Icon(
                  Icons.favorite,
                  size: 26,
                  color: SabetHa.primary,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            left: 10,
            right: size.width / 3,
            top: 0,
            child: Image.asset(
              'assets/images/${widget.id + 1}.png',
              height: size.height / 2,
            ),
          ),
          Positioned(
            right: 0,
            top: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  child: Text(
                    ':اندازه گیاه',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  child: Text(
                    DataBase.data[widget.id]!['size'],
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  child: Text(
                    ':رطوبت مورد نیاز',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  child: Text(
                    DataBase.data[widget.id]!['humidity'].toString(),
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  child: Text(
                    ':دمای نگهداری',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  child: Text(
                    DataBase.data[widget.id]!['temp'],
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            top: size.height * 2 / 5,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: SabetHa.primary!.withOpacity(0.3),
              ),
              height: size.height * 6.93 / 13,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, right: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          DataBase.data[widget.id]!['name'],
                          style: TextStyle(
                            fontSize: 32,
                            color: SabetHa.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, right: 32, left: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.star,
                          size: 24,
                          color: SabetHa.primary,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          DataBase.data[widget.id]!['star'].toString(),
                          style: TextStyle(
                            fontSize: 22,
                            color: SabetHa.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/images/9.png',
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          DataBase.data[widget.id]!['price'].toString(),
                          style: TextStyle(
                            fontSize: 32,
                            color: SabetHa.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(22),
                    child: Text(
                      '''این گیاه به دلیل زیست بوم آن، نیاز کمی به آب و رطوبت دارد. همچنین در محیط های کم نور مقاومت می باشد. در نتیجه از گزینه های بسیار مناسب برای نگهداری در آپارتمان و افراد مبتدی می باشد.''',
                      // textAlign: TextAlign.end,
                      textDirection: TextDirection.rtl,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: TextStyle(
                        fontSize: 16,
                        color: SabetHa.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomSheet: Container(
        color: SabetHa.primary!.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SizedBox(
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: SabetHa.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                SnackBar(
                  content: Text(
                    'به سبد خرید اضافه شد',
                    style: TextStyle(
                      fontSize: 18,
                      color: SabetHa.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
                setState(() {
                  DataBase.data[widget.id]!['is selected'] = true;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.shopping_cart_rounded,
                    size: 28,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'افزودن به سبد خرید',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
