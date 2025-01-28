import 'package:flutter/material.dart';
import 'package:h_l_s_application/features/auth/presentation/views/VerifyCodeScreen.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _phoneController = TextEditingController();
  bool _isFieldFocused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/password.png', // Replace with your image asset
                height: 200,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Reset Password',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Text color changed to white
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Please enter your phone number below to\nrecover your password',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white, // Text color changed to white
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xFF9EFF00), width: 1),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/image 2.png', // Replace with your flag image asset
                        height: 18, // Smaller flag size
                        width: 18, // Smaller flag size
                      ),
                      SizedBox(width: 8),
                      Text(
                        '+20',
                        style: TextStyle(
                            color: Colors.white), // Text color changed to white
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.white),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Focus(
                    onFocusChange: (hasFocus) {
                      setState(() {
                        _isFieldFocused = hasFocus;
                      });
                    },
                    child: TextField(
                      controller: _phoneController,
                      style: TextStyle(
                          color: Colors.white), // Text color changed to white
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(
                          color: _isFieldFocused
                              ? Color(0xFF9EFF00)
                              : Colors.white54,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF9EFF00), width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF9EFF00), width: 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40), // Increased height to move the button lower
            Center(
              child: SizedBox(
                width: double
                    .infinity, // Ensure the button takes full width of the container
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VerifyCodeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9EFF00),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Send',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
