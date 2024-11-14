import 'package:clot_app/Provider/Provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategorisScreen extends StatefulWidget {
  const CategorisScreen({super.key});

  @override
  State<CategorisScreen> createState() => _CategorisScreenState();
}

class _CategorisScreenState extends State<CategorisScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ClotProvider>(
      builder: (context, clotProvider, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
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
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Shop by Categories",
                    style: GoogleFonts.arvo(
                      fontSize: 35,
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  margin: const EdgeInsets.all(10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: clotProvider.categories.length,
                    itemBuilder: (context, index) {
                      var cat = clotProvider.categories[index];
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey[300],
                            ),
                            margin: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(
                                    cat.image.toString(),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    cat.name.toString(),
                                    style: GoogleFonts.arvo(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    },
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
