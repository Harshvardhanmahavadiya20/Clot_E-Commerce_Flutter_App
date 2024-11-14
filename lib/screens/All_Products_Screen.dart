import 'package:clot_app/Provider/Provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  var totalpot;
  @override
  Widget build(BuildContext context) {
    var mrp = 'mrp';

    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
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
                    "All Products ($totalpot)",
                    style: GoogleFonts.arvo(
                      fontSize: 35,
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  margin: const EdgeInsets.all(10),
                  child: Container(
                    // margin: const EdgeInsets.all(10),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: clotProvider.prtoducts.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.6, // Adjusted to make items taller
                      ),
                      itemBuilder: (context, index) {
                        var pot = clotProvider.prtoducts[index];
                        totalpot = clotProvider.prtoducts.length;
                        return Stack(
                          children: [
                            InkWell(onTap: () {
                              
                            },
                              child: Container(
                                height: h /
                                    1.5, // Increased height for inner container
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                margin: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      // height:
                                      // h / 5, // Adjust image container height
                                      decoration: BoxDecoration(
                                        // color: Colors.black,
                                        borderRadius: BorderRadius.circular(22),
                                      ),
                                      child: Image.network(
                                        pot.images[0].toString(),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    // Space between image and title
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 5),
                                      child: Text(pot.title.toString(),
                                          style: GoogleFonts.arvo(
                                            fontSize: 16,
                                          )),
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                              "\$ ${pot.price.toString()}",
                                              style: GoogleFonts.arvo(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700)),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                          child: Text("\$ $mrp",
                                              style: GoogleFonts.arvo(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                decorationColor: Colors.grey[600],
                                                decorationThickness: 2,
                                                color: Colors.grey[500],
                                                fontSize: 18,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Positioned(
                              top: 20,
                              right: 20,
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                              ),
                            )
                          ],
                        );
                      },
                    ),
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
