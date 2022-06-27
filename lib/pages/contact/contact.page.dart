import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ContactPage());
}

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Contact Us"),backgroundColor: Color.fromARGB(255, 124, 208, 219)),
        backgroundColor: Color.fromARGB(255, 124, 208, 219),
        body: Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: ContactUs(
            dividerColor: Colors.white,
            textFont: "Andika",
            cardColor: Colors.white,
            companyColor: Colors.black,
            taglineColor: Color.fromARGB(255, 124, 208, 219),
            textColor: Colors.black,
            logo: AssetImage('images/logo1.png'),
            email: 'Parapharmacy@gmail.com',
            emailText: "Email",
            companyName: 'Parapharmacy',
            phoneNumber: '+212323232',
            dividerThickness: 2,
            website: 'https://theparapharmacy.ca/',
          ),
        ),
      ),
    );
  }
}