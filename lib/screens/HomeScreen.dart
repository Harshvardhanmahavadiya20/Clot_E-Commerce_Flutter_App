import 'package:clot_app/Provider/Provider.dart';
import 'package:clot_app/screens/All_Products_Screen.dart';
import 'package:clot_app/screens/Categoris_screen.dart';
import 'package:clot_app/screens/Product_Detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    super.initState();
    print(ClotProvider().categories);
  }

  @override
  Widget build(BuildContext context) {
    var mrp = 'mrp';
    // var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Consumer<ClotProvider>(
      builder: (context, clotProvider, child) {
        if (clotProvider.categories.isEmpty || clotProvider.prtoducts.isEmpty) {
          clotProvider.getCategories();
          clotProvider.getProducts();
        }
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
          body: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: h / 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[300]),
                  child: Center(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.search_rounded,
                          size: 30,
                        ),
                        Text(
                          'Search',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    TextButton(
                      onPressed: () {
                        clotProvider.getCategories();
                        print(clotProvider.categories);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CategorisScreen(),
                            ));
                      },
                      child: Text(
                        'See All',
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                Container(
                  // color: Colors.green,
                  height: h / 6.5,
                  // width: 200,
                  margin: const EdgeInsets.all(10),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: clotProvider.categories.length ~/ 10,
                    itemBuilder: (context, index) {
                      var cat = clotProvider.categories[index];
                      return Container(
                        padding: const EdgeInsets.only(right: 15),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                cat.image.toString(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                cat.name.toString(),
                                style: GoogleFonts.arvo(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All Products',
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    TextButton(
                      onPressed: () {
                        clotProvider.getCategories();
                        print(clotProvider.categories);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AllProductsScreen(),
                            ));
                      },
                      child: Text(
                        'See All',
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Container(
                    // margin: const EdgeInsets.all(10),
                    child: GridView.builder(
                      itemCount: clotProvider.prtoducts.length ~/ 2,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.6, // Adjusted to make items taller
                      ),
                      itemBuilder: (context, index) {
                        var pot = clotProvider.prtoducts[index];
                        return Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                clotProvider.productDiscription =
                                    pot.description.toString();
                                clotProvider.productPrice =
                                    pot.price.toString();
                                clotProvider.productImages = pot.images;
                                clotProvider.productName = pot.title.toString();
                                clotProvider.selectedSize =
                                    clotProvider.sizes[0].toString();

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ProductDetailScreen(),
                                    ));
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      // height: h / 5, // Adjust image container height
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
                                                decorationColor:
                                                    Colors.grey[600],
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
