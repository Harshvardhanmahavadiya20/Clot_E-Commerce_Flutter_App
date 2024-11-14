import 'package:clot_app/Provider/Provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    // var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Consumer<ClotProvider>(
      builder: (context, clotProvider, child) {

        SelectSize() {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                height: h / 2,
                width: double.maxFinite,
                child: Column(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 40,
                          ),
                          Text(
                            "Size",
                            style: GoogleFonts.arvo(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Image.asset(
                                'assets/x.png',
                                filterQuality: FilterQuality.high,
                                color: Colors.black,
                                scale: 1.5,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 400,
                      width: double.maxFinite,
                      child: ListView.builder(
                        itemCount: clotProvider.sizes.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              clotProvider.selectedSize =
                                  clotProvider.sizes[index].toString();

                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: clotProvider.selectedSize ==
                                          clotProvider.sizes[index]
                                      ? const Color(0xff8E6CEF)
                                      : Colors.grey[300],
                                  borderRadius: BorderRadius.circular(25)),
                              padding: const EdgeInsets.all(20),
                              margin: const EdgeInsets.only(
                                  left: 10, right: 10, top: 20),
                              child: Center(
                                child: Text(
                                  clotProvider.sizes[index].toString(),
                                  style: GoogleFonts.arvo(
                                      color: clotProvider.selectedSize ==
                                              clotProvider.sizes[index]
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          );
        }

        SelectColor() {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                height: h / 2,
                width: double.maxFinite,
                child: Column(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 40),
                          Text(
                            "Color",
                            style: GoogleFonts.arvo(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Image.asset(
                              'assets/x.png',
                              filterQuality: FilterQuality.high,
                              color: Colors.black,
                              scale: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 400,
                      width: double.maxFinite,
                      child: ListView.builder(
                        itemCount: clotProvider.colorslist.length,
                        itemBuilder: (context, index) {
                          String currentColor = clotProvider.colorslist[index];
                          return InkWell(
                            onTap: () {
                              clotProvider.selectcolor(currentColor);
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: clotProvider.selectColor ==
                                          currentColor
                                      ? clotProvider.color
                                      : Colors.grey[300], // Show selected color
                                  borderRadius: BorderRadius.circular(25)),
                              padding: const EdgeInsets.all(20),
                              margin: const EdgeInsets.only(
                                  left: 10, right: 10, top: 20),
                              child: Center(
                                child: Text(
                                  currentColor,
                                  style: GoogleFonts.arvo(
                                      color: clotProvider.selectColor ==
                                              currentColor
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          );
        }

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
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(children: [
                          Container(
                            margin: const EdgeInsets.only(top: 40),
                            height: h / 2.5,
                            // color: Colors.deepOrange,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: clotProvider.productImages.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(
                                      right: 10, left: 10, top: 10),
                                  child: Image.network(clotProvider
                                      .productImages[index]
                                      .toString()),
                                );
                              },
                            ),
                          ),
                          Positioned(
                              right: 10,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite_border,
                                    size: 30,
                                  )))
                        ]),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(clotProvider.productName,
                              style: GoogleFonts.arvo(
                                fontSize: 20,
                              )),
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text("\$ ${clotProvider.productPrice}",
                                  style: GoogleFonts.arvo(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text("\$ mrp",
                                  style: GoogleFonts.arvo(
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.grey[600],
                                    decorationThickness: 2,
                                    color: Colors.grey[500],
                                    fontSize: 18,
                                  )),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            SelectSize();
                          },
                          child: Container(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            margin: const EdgeInsets.only(top: 20),
                            height: h / 15,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Size",
                                  style: GoogleFonts.arvo(fontSize: 20),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      clotProvider.selectedSize.toString(),
                                      style: GoogleFonts.arvo(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      width: 50,
                                    ),
                                    const Icon(Icons.arrow_drop_down)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            SelectColor();
                          },
                          child: Container(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            margin: const EdgeInsets.only(top: 20),
                            height: h / 15,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Color",
                                  style: GoogleFonts.arvo(fontSize: 20),
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: clotProvider.color,
                                      maxRadius: 15,
                                    ),
                                    const SizedBox(
                                      width: 50,
                                    ),
                                    const Icon(Icons.arrow_drop_down)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          margin: const EdgeInsets.only(top: 20),
                          height: h / 15,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Quantity",
                                style: GoogleFonts.arvo(fontSize: 20),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                        Color(0xff8E6CEF),
                                      )),
                                      onPressed: () {
                                        if (clotProvider.quantity >= 1) {
                                          clotProvider.quantity += 1;
                                          setState(() {});
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 30,
                                      )),
                                  SizedBox(
                                    width: 50,
                                    child: Center(
                                      child: Text(
                                        clotProvider.quantity.toString(),
                                        style: GoogleFonts.arvo(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                        Color(0xff8E6CEF),
                                      )),
                                      onPressed: () {
                                        if (clotProvider.quantity > 1) {
                                          clotProvider.quantity -= 1;
                                          setState(() {});
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.remove_outlined,
                                        color: Colors.white,
                                        size: 30,
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text('Product Discription',
                              style: GoogleFonts.arvo(
                                fontSize: 20,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(clotProvider.productDiscription,
                              style: GoogleFonts.arvo(
                                fontSize: 16,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin:
                      const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  height: h / 15,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color(0xFF8E6CEF)),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${clotProvider.productPrice.toString()}",
                        style: GoogleFonts.arvo(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Add to Bag",
                        style: GoogleFonts.arvo(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  )),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
