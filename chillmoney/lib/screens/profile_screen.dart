import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 51, 51, 51),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 51, 51, 51),
        title: Text(
          'Профиль',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.contact_support,
                  color: Colors.white,
                  size: 30,
                )),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 1.0,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color.fromARGB(255, 181, 181, 181)),
                      child: Center(
                        child: Text(
                          'U',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Username',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'email@gmail.com',
                      style: TextStyle(
                          color: Color.fromARGB(255, 192, 192, 192),
                          fontSize: 16,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(
                      height: 37,
                    ),
                    Container(
                      width: double.infinity,
                      height: 600,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 67, 67, 67),
                          borderRadius: BorderRadius.circular(15)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
