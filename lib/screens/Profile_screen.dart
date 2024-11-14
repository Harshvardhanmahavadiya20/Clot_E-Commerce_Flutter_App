import 'package:clot_app/Provider/Provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Consumer<ClotProvider>(
      builder: (context, clotProvider, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  child: const CircleAvatar(
                    radius: 50,
                    foregroundImage: AssetImage(
                      'assets/pf.png',
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(left: 20, right: 20),
                // height: h / 10,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Gilbert Jones",
                      style: GoogleFonts.arvo(fontSize: 18),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Glbertjones001@gmail.com",
                            style: GoogleFonts.arvo(fontSize: 18),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Edit",
                              style: GoogleFonts.arvo(
                                  fontSize: 18, color: const Color(0xff8E6CEF)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      "121-224-7890",
                      style: GoogleFonts.arvo(fontSize: 18),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                height: h / 15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[300]),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Address",
                        style: GoogleFonts.arvo(fontSize: 18),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                height: h / 15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[300]),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Wishlist",
                        style: GoogleFonts.arvo(fontSize: 18),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                height: h / 15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[300]),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Payment",
                        style: GoogleFonts.arvo(fontSize: 18),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                height: h / 15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[300]),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Help",
                        style: GoogleFonts.arvo(fontSize: 18),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                height: h / 15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[300]),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Support",
                        style: GoogleFonts.arvo(fontSize: 18),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  // margin: const EdgeInsets.all(20),
                  child: Center(
                      child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign Out',
                      style: GoogleFonts.arvo(
                          fontSize: 20,
                          color: Colors.red[400],
                          fontWeight: FontWeight.w600),
                    ),
                  )),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
