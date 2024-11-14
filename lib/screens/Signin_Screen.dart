import 'package:clot_app/Provider/Provider.dart';
import 'package:clot_app/screens/Login_Screen.dart';
import 'package:clot_app/screens/Main_Screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  void initState() {
    super.initState();
    if (items.isEmpty) {
      for (int i = 1; i <= 100; i++) {
        items.add(i.toString());
      }
    }
  }

  final List<String> items = [];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Consumer<ClotProvider>(
      builder: (context, clotProvider, child) {
        return Scaffold(
            appBar: clotProvider.signIndone
                ? AppBar(
                    leading: IconButton(
                        onPressed: () {
                          setState(() {
                            clotProvider.signIndone = false;
                          });
                        },
                        icon: const Text('sdsa')),
                  )
                : AppBar(
                    leading: IconButton(
                        onPressed: () {
                          setState(() {
                            clotProvider.loginInPassword = false;
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const logininScreen(),
                                ));
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          // color: Color(0xff8E6CEF),
                        )),
                  ),
            body: clotProvider.signIndone
                ? Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tell us About yourself",
                          style: GoogleFonts.arvo(fontSize: 34),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 20, bottom: 20),
                          child: Text(
                            "Who do you shop for ?",
                            style: GoogleFonts.arvo(fontSize: 18),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  clotProvider.genderCheck = 'men';
                                });
                              },
                              child: Container(
                                height: h / 12,
                                width: w / 2.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: clotProvider.genderCheck == 'men'
                                        ? const Color(0xFF8E6CEF)
                                        : Colors.grey[300]),
                                child: Center(
                                    child: Text(
                                  "Men",
                                  style: GoogleFonts.arvo(
                                      fontSize: 18,
                                      color: clotProvider.genderCheck == 'men'
                                          ? Colors.white
                                          : Colors.black),
                                )),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  clotProvider.genderCheck = 'women';
                                });
                              },
                              child: Container(
                                height: h / 12,
                                width: w / 2.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: clotProvider.genderCheck == 'women'
                                        ? const Color(0xFF8E6CEF)
                                        : Colors.grey[300]),
                                child: Center(
                                    child: Text(
                                  "Women",
                                  style: GoogleFonts.arvo(
                                      fontSize: 18,
                                      color: clotProvider.genderCheck == 'women'
                                          ? Colors.white
                                          : Colors.black),
                                )),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 20, bottom: 20),
                          child: Text(
                            "How Old are you ?",
                            style: GoogleFonts.arvo(fontSize: 18),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey[300],
                            ),
                            margin: const EdgeInsets.all(20),
                            padding: const EdgeInsets.all(10),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                hint: Text(
                                  'Age Range',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                                items: items
                                    .map((String item) =>
                                        DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                value: selectedValue,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedValue = value;
                                  });
                                },
                                buttonStyleData: const ButtonStyleData(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  height: 40,
                                  width: 140,
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                ),
                              ),
                            ),
                          ),
                        )),
                        InkWell(
                          onTap: () {
                            if (selectedValue != null) {
                              ClotProvider().getCategories();

                              setState(() {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MainScreen(),
                                    ));
                              });
                            } else if (selectedValue == null) {
                              Fluttertoast.showToast(
                                  msg: "Please Select Age",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red[200],
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            height: h / 15,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: const Color(0xFF8E6CEF)),
                            child: Center(
                              child: Text(
                                "Finish",
                                style: GoogleFonts.arvo(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      key: clotProvider.signInFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Create Account",
                            style: GoogleFonts.arvo(fontSize: 34),
                          ),
                          Container(
                            margin: const EdgeInsets.all(20),
                            height: h / 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey[300],
                            ),
                            child: Center(
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter Firstname';
                                  }

                                  return null;
                                },
                                controller:
                                    clotProvider.signinInFirstNameController,
                                decoration: const InputDecoration(
                                  hintText: 'Firstname',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(20),
                            height: h / 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey[300],
                            ),
                            child: Center(
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter Lastname';
                                  }

                                  return null;
                                },
                                controller:
                                    clotProvider.signinInLastNameController,
                                decoration: const InputDecoration(
                                  hintText: 'Firstname',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(20),
                            height: h / 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey[300],
                            ),
                            child: Center(
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter Email';
                                  } else if (!RegExp(
                                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                      .hasMatch(value)) {
                                    return 'Enter a valid email';
                                  }
                                  return null;
                                },
                                controller:
                                    clotProvider.signinInEmailController,
                                decoration: const InputDecoration(
                                  hintText: 'Email Address',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(20),
                            height: h / 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey[300],
                            ),
                            child: Center(
                              child: TextFormField(
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter Password';
                                  }

                                  return null;
                                },
                                controller:
                                    clotProvider.signinInPasswordController,
                                decoration: const InputDecoration(
                                  hintText: 'Password',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (clotProvider.signInFormKey.currentState!
                                  .validate()) {
                                setState(() {
                                  clotProvider.signIndone = true;
                                });
                              }
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              height: h / 15,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: const Color(0xFF8E6CEF)),
                              child: Center(
                                child: Text(
                                  "Continue",
                                  style: GoogleFonts.arvo(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
      },
    );
  }
}
