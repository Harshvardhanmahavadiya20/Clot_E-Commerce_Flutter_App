import 'dart:convert';

import 'package:clot_app/Models/Categories_Model.dart';
import 'package:clot_app/Models/Products_Model.dart';
import 'package:clot_app/screens/HomeScreen.dart';
import 'package:clot_app/screens/Notication_Screen.dart';
import 'package:clot_app/screens/Order_Screen.dart';
import 'package:clot_app/screens/Profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ClotProvider extends ChangeNotifier {
  int pageIndex = 0; // Moved pageIndex here to maintain state across rebuilds

  final pages = [
    const Homescreen(),
    const NoticationScreen(),
    const OrderScreen(),
    const ProfileScreen(),
  ];
  var loginInEmailFormKey = GlobalKey<FormState>();
  var loginInPasswordFormKey = GlobalKey<FormState>();
  var signInFormKey = GlobalKey<FormState>();
  var forgotPasswordFormKey = GlobalKey<FormState>();

  bool loginInPassword = false;
  bool signIndone = false;
  bool forgetpassworddone = false;
  var genderCheck = 'men';

  TextEditingController loginInEmailController = TextEditingController();
  TextEditingController forgotPasswordEmailController = TextEditingController();

  TextEditingController loginInPasswordController = TextEditingController();
  TextEditingController signinInFirstNameController = TextEditingController();
  TextEditingController signinInPasswordController = TextEditingController();
  TextEditingController signinInEmailController = TextEditingController();
  TextEditingController signinInLastNameController = TextEditingController();
  List<CategoriesModel> categories = [];
  List<ProductsModel> prtoducts = [];
  var productDiscription = '';
  var productImages = [];
  var productPrice = '';
  var productName = '';
  var sizes = ['XS', 'S', 'M', 'L', 'XL'];
  var selectedSize = '';
  var selectColor = 'red';
  var colorslist = ['red', 'yellow', 'blue', 'black', 'white'];
  var color = const Color(0xff8E6CEF);
  var quantity = 1;
  List<String> notifation = [
    'Gilbert, you placed and order check your order history for full details Explore Categories',
    'Gilbert, you placed and order check your order history for full details Explore Categories',
    'Gilbert, you placed and order check your order history for full details Explore Categories'
  ];
  List orders = [];

  void selectcolor(String selectedColor) {
    selectColor = selectedColor;
    if (selectColor == 'red') {
      color = Colors.red;
    } else if (selectColor == 'yellow') {
      color = Colors.yellow;
    } else if (selectColor == 'blue') {
      color = Colors.blue;
    } else if (selectColor == 'black') {
      color = Colors.black;
    } else if (selectColor == 'white') {
      color = Colors.white;
    }
    notifyListeners();
  }

  Future<void> getCategories() async {
    var url = 'https://api.escuelajs.co/api/v1/categories';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      categories = data.map((item) => CategoriesModel.fromJson(item)).toList();
      notifyListeners();
      print("CHECK:   $categories");
    } else {
      print("Failed to load categories");
    }
    notifyListeners();
  }

  Future<void> getProducts() async {
    var url = 'https://api.escuelajs.co/api/v1/products';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      prtoducts = data.map((item) => ProductsModel.fromJson(item)).toList();
      notifyListeners();
      print("CHECK:   $prtoducts");
    } else {
      print("Failed to load categories");
    }
    notifyListeners();
  }
}
