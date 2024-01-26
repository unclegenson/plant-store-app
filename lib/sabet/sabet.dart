import 'package:flutter/material.dart';

class SabetHa {
  static String email = 'unclegenson@gmail.com';
  static String nickName = 'UncleGenSon';
  static String familyName = 'Daei Karim Zadeh';
  static Color? primary = Colors.green[900];
  static Color? second = Colors.green;
  static String myImage = 'assets/images/12.jpg';
}

class DataBase {
  static Map<int, Map> data = {
    0: {
      'name': 'گل لاله',
      'image': 'assets/images/1.png',
      'price': 200,
      'sort': 'آپارتمانی',
      'is liked': true,
      'is selected': false,
      'humidity': 34,
      'temp': '23-34',
      'size': 'بزرگ',
      'star': '5',
      'id': 0,
    },
    1: {
      'name': 'ارغوان',
      'image': 'assets/images/2.png',
      'price': 100,
      'sort': 'محل کار',
      'is liked': false,
      'is selected': false,
      'humidity': 28,
      'temp': '23-34',
      'size': 'بزرگ',
      'star': '4.7',
      'id': 1,
    },
    2: {
      'name': 'ارکیده کاتالیا',
      'image': 'assets/images/3.png',
      'price': 120,
      'sort': 'باغچه ای',
      'is liked': false,
      'is selected': false,
      'humidity': 25,
      'temp': '4-34',
      'size': 'متوسط',
      'star': '4.5',
      'id': 2,
    },
    3: {
      'name': 'اسطخودوس',
      'price': 312,
      'image': 'assets/images/4.png',
      'sort': 'باغچه ای',
      'is liked': true,
      'is selected': false,
      'humidity': 34,
      'temp': '4-30',
      'size': 'بزرگ',
      'star': '4.6',
      'id': 3,
    },
    4: {
      'name': 'اورینتال (لیلیوم)',
      'price': 419,
      'sort': 'باغچه ای',
      'image': 'assets/images/5.png',
      'is liked': true,
      'is selected': false,
      'humidity': 18,
      'temp': '0-26',
      'size': 'کوچک',
      'star': '4.1',
      'id': 4,
    },
    5: {
      'name': 'آچیلا',
      'price': 179,
      'image': 'assets/images/6.png',
      'sort': 'محل کار',
      'is liked': true,
      'is selected': false,
      'humidity': 14,
      'temp': '23-34',
      'size': 'متوسط',
      'star': '4.9',
      'id': 5,
    },
    6: {
      'name': 'آلسترومریا',
      'price': 207,
      'sort': 'آپارتمانی',
      'is liked': false,
      'image': 'assets/images/7.png',
      'is selected': false,
      'humidity': 18,
      'temp': '23-34',
      'size': 'بزرگ',
      'star': '3.9',
      'id': 6,
    },
    7: {
      'name': 'آلاله',
      'price': 130,
      'sort': 'محل کار',
      'image': 'assets/images/8.png',
      'is liked': true,
      'is selected': false,
      'humidity': 12,
      'temp': '20-34',
      'size': 'بزرگ',
      'star': '4.9',
      'id': 7,
    },
  };
  static List profileData = [
    {'title': 'اطلاعات من', 'icon1': Icons.person},
    {'title': 'تنظیمات', 'icon1': Icons.settings},
    {'title': 'اطلاع رسانی ها', 'icon1': Icons.notifications_on_rounded},
    {'title': 'شبکه های اجتماعی', 'icon1': Icons.share},
    {'title': 'خروج از حساب کاربری', 'icon1': Icons.logout},
  ];
}
