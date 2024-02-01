import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import '../sabet/sabet.dart';
import 'itemDetail.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  var formatter = intl.NumberFormat.decimalPattern('hi');

  late List showFlowers;
  double sum = 0;
  @override
  void initState() {
    setState(() {
      showFlowers = DataBase.data.values.where((element) {
        return element['is selected'] == true;
      }).toList();

      for (var number in showFlowers) {
        sum += number['price'] * number['count'];
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      bottomSheet: Container(
        color: Colors.white,
        width: size.width,
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 14,
                ),
                Image.asset(
                  'assets/images/9.png',
                  width: 30,
                  height: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  formatter.format(sum.toInt()).toString(),
                  style: TextStyle(
                    fontSize: 24,
                    color: SabetHa.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ',000',
                  style: TextStyle(
                    fontSize: 17,
                    color: SabetHa.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              'جمع کل:',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 24,
                color: SabetHa.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'سبد خرید',
              style: TextStyle(
                fontSize: 24,
                color: SabetHa.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: showFlowers.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'هنوز چیزی نخریدی!',
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Icon(
                    Icons.remove_shopping_cart_outlined,
                    size: 40,
                    color: Colors.black,
                  )
                ],
              ),
            )
          : SizedBox(
              height: size.height - 40,
              width: size.width,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  itemCount: showFlowers.length,
                  reverse: false,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return PlantDetails(id: showFlowers[index]['id']);
                            },
                          ));
                        },
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[300],
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          formatter
                                              .format(showFlowers[index]
                                                      ['price'] *
                                                  showFlowers[index]['count'])
                                              .toString(),
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: SabetHa.primary,
                                          ),
                                        ),
                                        Text(
                                          '000,',
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: SabetHa.primary,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Image.asset(
                                      'assets/images/9.png',
                                      width: 28,
                                      height: 28,
                                    )
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    showFlowers[index]['name'],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    showFlowers[index]!['sort'],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black87.withOpacity(0.5),
                                    ),
                                  ),
                                  Text(
                                    '${showFlowers[index]['count'].toString()} عدد',
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87.withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: SabetHa.primary!.withAlpha(200),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 5,
                                      left: 0,
                                      top: -10,
                                      right: 0,
                                      child: Image.asset(
                                        showFlowers[index]!['image'],
                                        height: 85,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
