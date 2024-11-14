import 'package:clot_app/Provider/Provider.dart';
import 'package:clot_app/screens/HomeScreen.dart';
import 'package:clot_app/screens/Notication_Screen.dart';
import 'package:clot_app/screens/Order_Screen.dart';
import 'package:clot_app/screens/Profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ClotProvider>(
      builder: (context, clotProvider, child) {
        return Scaffold(
          body: clotProvider.pages[clotProvider.pageIndex],
          bottomNavigationBar: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      clotProvider.pageIndex = 0;
                    });
                  },
                  icon: clotProvider.pageIndex == 0
                      ? const Icon(
                          Icons.home_filled,
                          color: Colors.white,
                          size: 30,
                        )
                      : const Icon(
                          Icons.home_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      clotProvider.pageIndex = 1;
                    });
                  },
                  icon: clotProvider.pageIndex == 1
                      ? const Icon(
                          Icons.notifications_sharp,
                          color: Colors.white,
                          size: 30,
                        )
                      : const Icon(
                          Icons.notifications_none_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      clotProvider.pageIndex = 2;
                    });
                  },
                  icon: clotProvider.pageIndex == 2
                      ? const Icon(
                          Icons.shopping_bag_rounded,
                          color: Colors.white,
                          size: 30,
                        )
                      : const Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      clotProvider.pageIndex = 3;
                    });
                  },
                  icon: clotProvider.pageIndex == 3
                      ? const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30,
                        )
                      : const Icon(
                          Icons.person_outline,
                          color: Colors.white,
                          size: 30,
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
