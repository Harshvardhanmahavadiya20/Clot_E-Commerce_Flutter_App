import 'package:clot_app/Provider/Provider.dart';
import 'package:clot_app/screens/Login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    // var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Consumer<ClotProvider>(
      builder: (context, clotProvider, child) {
        return Scaffold(
          appBar: AppBar(),
          body: clotProvider.forgetpassworddone
              ? Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/forgetpassword.png',
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "We Sent you an Email to reset your password.",
                          style: GoogleFonts.arvo(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                        InkWell(
                          onTap: () {
                            clotProvider.loginInPassword = false;
                            clotProvider.forgetpassworddone = false;

                            setState(() {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const logininScreen(),
                                  ));
                            });
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
                                "Return to Login",
                                style: GoogleFonts.arvo(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: clotProvider.forgotPasswordFormKey,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Forgot Password",
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
                              controller:
                                  clotProvider.forgotPasswordEmailController,
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
                            if (clotProvider.forgotPasswordFormKey.currentState!
                                .validate()) {
                              setState(() {
                                clotProvider.forgetpassworddone = true;
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
                ),
        );
      },
    );
  }
}
