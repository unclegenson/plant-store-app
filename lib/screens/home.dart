import 'package:flutter/material.dart';
import 'package:ghaleb_1/sabet/sabet.dart';
import 'package:ghaleb_1/screens/itemDetail.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

List<String> tabItems = ['گلدانی', 'باغچه ای', 'محل کار', 'آپارتمانی'];

class _HomeState extends State<Home> {
  late List showFlowers;
  @override
  void initState() {
    showFlowers = DataBase.data.values.where((element) {
      return element.toString().contains(tabItems[3]);
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
        leading: IconButton(
          icon: Icon(
            Icons.notifications,
            color: SabetHa.primary,
          ),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'خانه',
              style: TextStyle(
                fontSize: 26,
                color: SabetHa.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                  width: size.width * 0.9,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[300],
                    ),
                    child: TextFormField(
                      onChanged: (value) {
                        showFlowers = DataBase.data.values.toList();

                        setState(() {
                          showFlowers = showFlowers.where((element) {
                            return element['name'].contains(value);
                          }).toList();
                        });
                      },
                      cursorColor: SabetHa.primary,
                      cursorHeight: 20,
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'جست و جو...',
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: const TextStyle(fontSize: 17, height: 1.1),
                        prefixIcon: IconButton(
                          icon: Icon(
                            Icons.mic,
                            color: SabetHa.primary,
                          ),
                          onPressed: () {},
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.search,
                            color: SabetHa.primary,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            DefaultTabController(
              initialIndex: 3,
              length: 4,
              child: TabBar(
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                indicatorColor: SabetHa.primary,
                labelColor: SabetHa.primary,
                indicatorSize: TabBarIndicatorSize.tab,
                onTap: (int value) {
                  showFlowers = DataBase.data.values.toList();

                  setState(() {
                    showFlowers = showFlowers.where((element) {
                      return element['sort'].contains(tabItems[value]);
                    }).toList();
                  });
                },
                tabs: [
                  Tab(
                    text: tabItems[0],
                  ),
                  Tab(
                    text: tabItems[1],
                  ),
                  Tab(
                    text: tabItems[2],
                  ),
                  Tab(
                    text: tabItems[3],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            showFlowers.isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 194,
                      width: size.width * 0.96,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: SabetHa.primary,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'اتمام موجودی!',
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.remove_shopping_cart_outlined,
                              size: 40,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : SizedBox(
                    height: 210,
                    width: size.width * 1,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: showFlowers.length,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return PlantDetails(
                                          id: showFlowers[index]['id'],
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 200,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: SabetHa.primary!.withAlpha(200),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Image.asset(
                                          showFlowers[index]!['image'],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 145,
                                      child: Container(
                                        width: 70,
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                          ),
                                          color: Colors.white,
                                        ),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    showFlowers[index]['price']
                                                        .toString(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: SabetHa.primary,
                                                    ),
                                                  ),
                                                  Text(
                                                    '000,',
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: SabetHa.primary,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Image.asset(
                                                'assets/images/9.png',
                                                width: 20,
                                                height: 20,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 12,
                                      bottom: 8,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            showFlowers[index]['name'],
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            showFlowers[index]['sort'],
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white70,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      showFlowers[index]['is liked']
                                          ? showFlowers[index]['is liked'] =
                                              false
                                          : showFlowers[index]['is liked'] =
                                              true;
                                    });
                                  },
                                  icon: Icon(
                                    showFlowers[index]['is liked']
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_back_rounded,
                    size: 22,
                    color: SabetHa.primary,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 14),
                  child: Text(
                    'تمامی محصولات',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              height: 296,
              width: size.width,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  itemCount: 8,
                  reverse: false,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return PlantDetails(id: index);
                              },
                            ),
                          );
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
                                          DataBase.data[index]!['price']
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
                                    DataBase.data[index]!['name'],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    DataBase.data[index]!['sort'],
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
                                        DataBase.data[index]!['image'],
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
            )
          ],
        ),
      ),
    );
  }
}
