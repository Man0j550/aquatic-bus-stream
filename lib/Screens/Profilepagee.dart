import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../acc/LoginPage.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2E2E2E),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF212121),
        title: Text(
          'My Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              // Mobile layout
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey[400],
                        child: Icon(
                          Icons.account_circle,
                          size: 60,
                          color: Color(0xFF2E2E2E),
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ghost', // Replace with the user's name
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'ghost123@gmail.com', // Replace with the user's email
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[300],
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '000000000', // Replace with the user's email
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      // Add functionality to edit profile
                    },
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Color.fromARGB(255, 236, 96, 94),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              );
            } else {
              // Desktop layout
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey[400],
                            child: Icon(
                              Icons.account_circle,
                              size: 60,
                              color: Color(0xFF2E2E2E),
                            ),
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ghost', // Replace with the user's name
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'ghost123@gmail.com', // Replace with the user's email
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[300],
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '000000000', // Replace with the user's email
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[300],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          // Add functionality to edit profile
                        },
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Color.fromARGB(255, 236, 96, 94),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
