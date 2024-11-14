import 'package:clot_app/Provider/Provider.dart';
import 'package:clot_app/screens/Forgot_Password_screen.dart';
import 'package:clot_app/screens/HomeScreen.dart';
import 'package:clot_app/screens/Main_Screen.dart';
import 'package:clot_app/screens/SignIn_Screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class logininScreen extends StatefulWidget {
  const logininScreen({super.key});

  @override
  State<logininScreen> createState() => _logininScreenState();
}

class _logininScreenState extends State<logininScreen> {
  @override
  Widget build(BuildContext context) {
    // var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Consumer<ClotProvider>(
      builder: (context, clotProvider, child) {
        return Scaffold(
          appBar: clotProvider.loginInPassword
              ? AppBar(
                  leading: IconButton(
                      onPressed: () {
                        setState(() {
                          clotProvider.forgetpassworddone = false;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        // color: Color(0xff8E6CEF),
                      )),
                )
              : AppBar(),
          body: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: clotProvider.loginInPassword
                  ? Form(
                      autovalidateMode: AutovalidateMode.always,
                      key: clotProvider.loginInPasswordFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "login in",
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
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter Password';
                                  }

                                  return null;
                                },
                                controller:
                                    clotProvider.loginInPasswordController,
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
                              if (clotProvider
                                  .loginInPasswordFormKey.currentState!
                                  .validate()) {
                                ClotProvider().getCategories();

                                setState(() {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const MainScreen(),
                                      ));
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
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Text(
                                  "Forgot Password ? ",
                                  style: GoogleFonts.arvo(fontSize: 16),
                                ),
                                InkWell(
                                  onTap: () {
                                    clotProvider.loginInPassword = false;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ForgotPasswordScreen(),
                                        ));
                                  },
                                  child: Text(
                                    "Reset",
                                    style: GoogleFonts.arvo(
                                        color: const Color(0xff8E6CEF),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Form(
                      autovalidateMode: AutovalidateMode.always,
                      key: clotProvider.loginInEmailFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "login in",
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
                                    return 'Enter Email';
                                  } else if (!RegExp(
                                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                      .hasMatch(value)) {
                                    return 'Enter a valid email';
                                  }
                                  return null;
                                },
                                controller: clotProvider.loginInEmailController,
                                decoration: const InputDecoration(
                                  hintText: 'Email Address',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (clotProvider.loginInEmailFormKey.currentState!
                                  .validate()) {
                                setState(() {
                                  clotProvider.loginInPassword = true;
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
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Text(
                                  "Dont have an Account ? ",
                                  style: GoogleFonts.arvo(fontSize: 16),
                                ),
                                InkWell(
                                  onTap: () => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SigninScreen(),
                                      )),
                                  child: Text(
                                    "Create One",
                                    style: GoogleFonts.arvo(
                                        color: const Color(0xff8E6CEF),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(
                              child: Container(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.grey[300]),
                                  padding: const EdgeInsets.all(10),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Image(
                                            image: AssetImage(
                                                'assets/iphoneLogo.png')),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: Text(
                                            "Continue With Apple",
                                            style:
                                                GoogleFonts.arvo(fontSize: 16),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.grey[300]),
                                  padding: const EdgeInsets.all(10),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Image(
                                            image: AssetImage(
                                                "assets/GoogleLogo.png")),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: Text(
                                            "Continue With google",
                                            style:
                                                GoogleFonts.arvo(fontSize: 16),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.grey[300]),
                                  padding: const EdgeInsets.all(10),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Image(
                                            image: AssetImage(
                                                'assets/FacebookLogo.png')),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: Text(
                                            "Continue With Facebook",
                                            style:
                                                GoogleFonts.arvo(fontSize: 16),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    )),
        );
      },
    );
  }
}
