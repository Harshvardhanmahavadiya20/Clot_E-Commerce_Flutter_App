import 'package:clot_app/Provider/Provider.dart';
import 'package:clot_app/screens/Main_Screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NoticationScreen extends StatefulWidget {
  const NoticationScreen({super.key});

  @override
  State<NoticationScreen> createState() => _NoticationScreenState();
}

class _NoticationScreenState extends State<NoticationScreen> {
  @override
  Widget build(BuildContext context) {
    // var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Consumer<ClotProvider>(
      builder: (context, clotProvider, child) {
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  foregroundImage: AssetImage(
                    'assets/menUser.png',
                  ),
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  "Clot",
                  style: GoogleFonts.arvo(
                      fontSize: 35, color: const Color(0xff8E6CEF)),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Color(0xff8E6CEF))),
                      color: Colors.white,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart_checkout_sharp,
                        size: 20,
                      )),
                )
              ],
            ),
            body: clotProvider.notifation.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: SizedBox(
                          child: Image.asset(
                            'assets/notifcation.png',
                            scale: 0.8,
                          ),
                        ),
                      ),
                      Text(
                        'No Notification yet',
                        style: GoogleFonts.arvo(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      ),
                      InkWell(
                        onTap: () {
                          clotProvider.pageIndex = 0;
                          clotProvider.pages[0];
                          setState(() {});
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainScreen(),
                              ));
                        },
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          height: h / 15,
                          decoration: BoxDecoration(
                              color: const Color(0xff8E6CEF),
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Text(
                              'Explore Categories',
                              style: GoogleFonts.arvo(
                                  fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                : Container(
                    child: ListView.builder(
                      itemCount: clotProvider.notifation.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(20),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.notifications_none,
                                  size: 30,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Text(
                                    clotProvider.notifation[index].toString(),
                                    style: GoogleFonts.arvo(fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ));
      },
    );
  }
}
