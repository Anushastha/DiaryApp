import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //search and menu
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.search_rounded),
                      iconSize: 35.0,
                    ),
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.short_text_rounded),
                      iconSize: 35.0,
                    ),
                  ],
                ),
              ),
            SizedBox(height: 30.0),

            //year selector
            DropdownButton(
              value: '2023',
              items: [
                DropdownMenuItem(
                  value: '2023',
                  child: Text('2023'),
                ),
              ],
              onChanged: (value){},
            ),
            SizedBox(height: 30.0),
            
            //month cards
            Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: PageView(
                    controller: PageController(
                      initialPage: 0,
                      viewportFraction: 0.75,
                    ),
                    scrollDirection: Axis.horizontal,
                    children: [
                      //card
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.teal.shade400,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8.0,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //month number
                              Text(
                                '1',
                                textScaleFactor: 3.5,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'JAN',
                                textScaleFactor: 2.5,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  //progress bar
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '5/31',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 3.0),
                                        Container(
                                          width: double.infinity,
                                          height: 3.0,
                                          color: Colors.white30,
                                          child: FractionallySizedBox(
                                            alignment: Alignment.centerLeft,
                                            widthFactor: 5/31,
                                            child: Container(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //option button
                                  Icon(
                                    Icons.more_vert_rounded,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
            ),
            SizedBox(height: 30.0),

            //action buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  //today card
                  Container(
                    width: 155.0,
                    height: 50.0,
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //sun icon
                        Icon(Icons.wb_sunny_rounded),
                        SizedBox(width: 10.0),
                        //details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Today',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'JAN 28/2023',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  //edit button
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.mode_edit_outlined,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  //calender switch button
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.calendar_month_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 80.0),
          ],
        ),
      ),
    );
  }
}
