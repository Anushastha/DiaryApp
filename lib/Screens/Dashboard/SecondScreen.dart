import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("2023"),value: "2023"),
    DropdownMenuItem(child: Text("2024"),value: "2024"),
    DropdownMenuItem(child: Text("2025"),value: "2025"),
    DropdownMenuItem(child: Text("2026"),value: "2026"),
  ];
  return menuItems;
}

class _SecondScreenState extends State<SecondScreen> {
  String selectedValue = "2023";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //BackGround
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.black,
                          ))
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 40.0, bottom: 30.0),
                  child: Text(
                    "Make yourself a priority",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 38,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            //January
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 220,
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(10.0),
                                        child: Image.network(
                                          "https://i.pinimg.com/originals/5a/f3/21/5af321a255a5777c029e8cb97dfdeceb.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight:
                                              Radius.circular(10.0)),
                                          color: Colors.teal.shade400,
                                        ),
                                        child: GestureDetector(
                                          onTap: (){
                                            Navigator.of(context).pushNamed('/entry');
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0,bottom: 20.0),
                                  child: const Text(
                                    "January",
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            //March
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 220,
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(10.0),
                                        child: Image.network(
                                          "https://p0.pikist.com/photos/954/908/aesthetic-nature-golden-flowers-beautiful-hello-march-love-nature-graphy-cute-wallpaper.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight:
                                              Radius.circular(10.0)),
                                          color: Colors.teal.shade400,
                                        ),
                                        child: GestureDetector(
                                          onTap: (){
                                            Navigator.of(context).pushNamed('/entry');
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0, bottom: 20.0),
                                  child: const Text(
                                    "March",
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            //May
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                    height: 220,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16.0),
                                      child: Image.network(
                                        "https://thebeautymay.com/wp-content/uploads/2021/02/Aesthetic-spring-images-4.jpg",
                                        fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight:
                                              Radius.circular(10.0)),
                                          color: Colors.teal.shade400,
                                        ),
                                        child: GestureDetector(
                                          onTap: (){
                                            Navigator.of(context).pushNamed('/entry');
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0,bottom: 20.0),
                                  child: const Text(
                                    "May",
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            //July
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 220,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16.0),
                                        child: Image.network(
                                          "https://66.media.tumblr.com/62d2f24f23265bce757c441fe3b3444c/tumblr_pbdcnf6VBS1vpulzeo1_500.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight:
                                              Radius.circular(10.0)),
                                          color: Colors.teal.shade400,
                                        ),
                                        child: GestureDetector(
                                          onTap: (){
                                            Navigator.of(context).pushNamed('/entry');
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0,bottom: 20.0),
                                  child: const Text(
                                    "July",
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            //September
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 220,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16.0),
                                        child: Image.network(
                                          "https://i.pinimg.com/originals/e0/3d/f7/e03df76336a306beb1a5a04db260c823.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight:
                                              Radius.circular(10.0)),
                                          color: Colors.teal.shade400,
                                        ),
                                        child: GestureDetector(
                                          onTap: (){
                                            Navigator.of(context).pushNamed('/entry');
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0,bottom: 20.0),
                                  child: const Text(
                                    "September",
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            //November
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 220,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16.0),
                                        child: Image.network(
                                          "https://i.pinimg.com/originals/6a/e4/81/6ae4812121786560b24d11c36c4e69c5.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight:
                                              Radius.circular(10.0)),
                                          color: Colors.teal.shade400,
                                        ),
                                        child: GestureDetector(
                                          onTap: (){
                                            Navigator.of(context).pushNamed('/entry');
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0,bottom: 20.0),
                                  child: const Text(
                                    "November",
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                            //February
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                    height: 220,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16.0),
                                      child: Image.network(
                                        "https://www.pixel4k.com/wp-content/uploads/2018/10/roses-bush-bloom-garden-red-contrast-4k_1540064894.jpg",
                                        fit: BoxFit.cover,
                                       ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight:
                                              Radius.circular(10.0)),
                                          color: Colors.teal.shade400,
                                        ),
                                        child: GestureDetector(
                                          onTap: (){
                                            Navigator.of(context).pushNamed('/entry');
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0,bottom: 20.0),
                                  child: const Text(
                                    "February",
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            //April
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                    height: 220,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16.0),
                                      child: Image.network(
                                        "https://i.pinimg.com/originals/d7/2f/c2/d72fc2b94f3a259fa3c95f668fe7b60a.jpg",
                                        fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight:
                                              Radius.circular(10.0)),
                                          color: Colors.teal.shade400,
                                        ),
                                        child: GestureDetector(
                                          onTap: (){
                                            Navigator.of(context).pushNamed('/entry');
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0,bottom: 20.0),
                                  child: const Text(
                                    "April",
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            //June
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 220,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16.0),
                                        child: Image.network(
                                          "https://www.weather2travel.com/images_content/weather-in-june-algarve.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight:
                                              Radius.circular(10.0)),
                                          color: Colors.teal.shade400,
                                        ),
                                        child: GestureDetector(
                                          onTap: (){
                                            Navigator.of(context).pushNamed('/entry');
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0,bottom: 20.0),
                                  child: const Text(
                                    "June",
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            //August
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 220,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16.0),
                                        child: Image.network(
                                          "https://i.pinimg.com/736x/9e/85/99/9e859965aad6c046c7222959854288da.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight:
                                              Radius.circular(10.0)),
                                          color: Colors.teal.shade400,
                                        ),
                                        child: GestureDetector(
                                          onTap: (){
                                            Navigator.of(context).pushNamed('/entry');
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0,bottom: 20.0),
                                  child: const Text(
                                    "August",
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            //October
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 220,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16.0),
                                        child: Image.network(
                                          "https://i.pinimg.com/736x/35/2b/35/352b35a51c83a59d3b43171500a55c0c.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight:
                                              Radius.circular(10.0)),
                                          color: Colors.teal.shade400,
                                        ),
                                        child: GestureDetector(
                                          onTap: (){
                                            Navigator.of(context).pushNamed('/entry');
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0,bottom: 20.0),
                                  child: const Text(
                                    "October",
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            //December
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 220,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16.0),
                                        child: Image.network(
                                          "https://i.pinimg.com/originals/d7/29/75/d72975458cecdc14561737502ccb6dae.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight:
                                              Radius.circular(10.0)),
                                          color: Colors.teal.shade400,
                                        ),
                                        child: GestureDetector(
                                          onTap: (){
                                            Navigator.of(context).pushNamed('/entry');
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0,bottom: 20.0),
                                  child: const Text(
                                    "December",
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}