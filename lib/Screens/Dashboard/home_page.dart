import 'package:flutter/material.dart';

import '../widgets/back_view.dart';
import '../widgets/front_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool isFrontView = true;

  late AnimationController controller;

  switchView(){
    setState(() {
      isFrontView = !isFrontView;
    });
    if(isFrontView){
      controller.forward();
    }else{
      controller.reverse();
    }
  }

  @override
  void initState() {

    super.initState();
    controller = AnimationController(
        vsync: this,duration: const Duration(milliseconds: 300));
  }



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
                    onPressed: () {},
                    icon: const Icon(Icons.search_rounded),
                    iconSize: 35.0,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.short_text_rounded),
                    iconSize: 35.0,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30.0),

            //year selector
            DropdownButton(
              value: '2022',
              items: [
                const DropdownMenuItem(
                  value: '2022',
                  child: Text('2022'),
                ),
              ],
              onChanged: (value) {},
            ),
            const SizedBox(height: 30.0),

            //month cards
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 45.0),  //card height
                child: PageView.builder(
                  controller: PageController(
                    initialPage: 0,
                    viewportFraction: 0.78,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: 12,    //for 12 months
                  itemBuilder: (_,i) => AnimatedBuilder(
                      animation: controller,
                      builder: (_, child){
                      return isFrontView
                          ? FrontView(monthIndex: i + 1)
                          : BackView(
                              monthIndex: i + 1,
                            );
                    }
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30.0),

            //action buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  //today card
                  Container(
                    width: 155.0,
                    height: 50.0,
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //sun icon
                        const Icon(Icons.wb_sunny_rounded),
                        const SizedBox(width: 10.0),
                        //details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Today',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Text(
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
                  const Spacer(),
                  //edit button
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.mode_edit_outlined,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  //calender switch button
                  GestureDetector(
                    onTap: () => switchView(),
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: isFrontView ? Colors.black : Colors.teal.shade400,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isFrontView
                            ? Icons.calendar_month_rounded
                            : Icons.undo_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 75.0),
          ],
        ),
      ),
    );
  }
}

