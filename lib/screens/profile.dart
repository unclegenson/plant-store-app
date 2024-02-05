import 'package:flutter/material.dart';
import 'package:ghaleb_1/sabet/sabet.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
              'پروفایل',
              style: TextStyle(
                fontSize: 22,
                color: SabetHa.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          CircleAvatar(
            radius: 105,
            backgroundColor: Colors.green[900],
            child: CircleAvatar(
              radius: 100,
              backgroundColor: SabetHa.primary,
              backgroundImage: AssetImage(SabetHa.myImage),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                SabetHa.nickName,
                style: TextStyle(
                  fontSize: 20,
                  color: SabetHa.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Image.asset(
                'assets/images/10.png',
                width: 20,
                height: 20,
              )
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            SabetHa.email,
            style: TextStyle(
              fontSize: 18,
              color: SabetHa.primary,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            color: Colors.white,
            height: size.width / 1.5,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTileBuild(
                  text: DataBase.profileData[index]['title'],
                  icon1: DataBase.profileData[index]['icon1'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ListTileBuild extends StatelessWidget {
  const ListTileBuild({
    super.key,
    required this.text,
    required this.icon1,
  });
  final String text;
  final IconData icon1;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: ListTile(
          trailing: Icon(
            icon1,
            size: 22,
            color: SabetHa.primary,
          ),
          title: Text(
            text,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 18,
              color: SabetHa.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Icon(
            Icons.arrow_back_ios_rounded,
            color: SabetHa.primary,
            size: 20,
          ),
        ),
      ),
    );
  }
}
