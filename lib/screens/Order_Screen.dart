import 'package:clot_app/Provider/Provider.dart';
import 'package:clot_app/screens/Main_Screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
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
            body: clotProvider.orders.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: SizedBox(
                          child: Image.asset(
                            'assets/NoOrders.png',
                            scale: 0.8,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'No Orders yet',
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
                    child: const Center(
                      child: Text("NO ORDERS!!!"),
                    ),
                  ));
      },
    );
  }
}
