import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:image_picker/image_picker.dart';

class AccountDashboard extends StatefulWidget {
  const AccountDashboard({Key? key}) : super(key: key);

  @override
  _AccountDashboardState createState() => _AccountDashboardState();
}

class _AccountDashboardState extends State<AccountDashboard> {
  File? _image;
  final bool _isLoading = false;
  final picker = ImagePicker();

  Future<List<Map<String, dynamic>>> _fetchUserData() async {
  print('Fetching user data...');

  final response = await http.get(Uri.parse('https://kayegm.helioho.st/serve/user_read.php'));

  if (response.statusCode == 200) {
    print('Response body: ${response.body}');
    return jsonDecode(response.body).cast<Map<String, dynamic>>();
  } else {
    print('Failed to load user data. Status code: ${response.statusCode}');
    throw Exception('Failed to load user data');
  }
}
  


  Widget _buildProfileAvatar() {
    return Center(
      child: GestureDetector(
        onTap: _showImagePickerDialog,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.white,
              backgroundImage: _image != null ? FileImage(_image!) : null,
              child: _image == null
                  ? const Icon(
                      Icons.account_circle,
                      size: 120,
                      color: Colors.black26,
                    )
                  : null,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: _showImagePickerDialog,
              ),
            ),
            if (_isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return FutureBuilder(
      future: _fetchUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<Map<String, dynamic>> users =
              snapshot.data as List<Map<String, dynamic>>;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> userData = users[index];
              return ListTile(
                title: Text('Full Name: ${userData['fullname']}'),
                subtitle: Text('Username: ${userData['username']}'),
                // Add other user data fields here
              );
            },
          );
        }
      },
    );
  }

  Widget _buildLogoutButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: ElevatedButton.icon(
          onPressed: _logoutUser,
          icon: const Icon(Icons.logout),
          label: const Text('Log Out'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(136, 196, 196, 196),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 75),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Colors.black12),
            ),
          ),
        ),
      ),
    );
  }

  void _logoutUser() async {
  final response = await http.post(
    Uri.parse('https://kayegm.helioho.st/logout.php'),
    // Add any necessary headers or authentication tokens
  );

  if (response.statusCode == 200) {
    // If the logout request was successful, navigate to the login screen
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
      (route) => false,
    );
  } else {
    // Handle error response from the server
    // For example, display an error message to the user
    print('Error: ${response.body}');
  }
}


  Future<void> _showImagePickerDialog() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background - design4.png"),
                fit: BoxFit.cover,
              ),
            ),
            height: MediaQuery.of(context).size.height,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProfileAvatar(),
                const SizedBox(height: 20),
                Expanded(
                  child: _buildUserInfo(),
                ),
                _buildLogoutButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
