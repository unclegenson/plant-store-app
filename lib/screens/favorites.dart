import 'package:flutter/material.dart';
import 'package:ghaleb_1/sabet/sabet.dart';
import 'package:ghaleb_1/screens/itemDetail.dart';

List favoritePlants = [];

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  void initState() {
    favoritePlants = DataBase.data.values.where((element) {
      return element['is liked'] == true;
    }).toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: IconButton(
            icon: Tooltip(
              message: 'double tap to send all to shopping list',
              child: Icon(
                Icons.shopping_bag_outlined,
                color: SabetHa.primary,
                size: 30,
              ),
            ),
            onPressed: () {},
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'علاقه مندی ها',
              style: TextStyle(
                fontSize: 23,
                color: SabetHa.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: size.height,
        child: ListView.builder(
          itemCount: favoritePlants.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PlantDetails(
                          id: favoritePlants[index]['id'],
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green[50],
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
                                  favoritePlants[index]['price'].toString(),
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
                            favoritePlants[index]['name'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            favoritePlants[index]!['sort'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
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
                                favoritePlants[index]['image'],
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
    );
  }
}
