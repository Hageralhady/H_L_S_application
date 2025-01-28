import 'package:flutter/material.dart';
import 'package:h_l_s_application/features/auth/presentation/views/create_password_page.dart';

class VerifyCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFF9EFF00),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/sms.png', // Replace with your image path
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Verify Code",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "We just sent a 4-digit verification code to\n+202334356769. Enter the code in the box below\nto continue",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 32),
            GestureDetector(
              onTap: () {
                // Handle edit number action
              },
              child: Text(
                "Edit the number",
                style: TextStyle(
                  color: Color(0xFF9EFF00),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                4,
                (index) => SizedBox(
                  width: (screenWidth - 120) / 4, // Responsive width for boxes
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(color: Color(0xFF9EFF00), width: 1.5),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 32), // Adjust space between input boxes and button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreatePasswordPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF9EFF00),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16), // Adjust padding below the button
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Don’t receive a code?",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    // Handle resend code action
                  },
                  child: Text(
                    "Resend",
                    style: TextStyle(
                      color: Color(0xFF9EFF00),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  "0:36",
                  style: TextStyle(color: Color(0xFF9EFF00)),
                ),
              ],
            ),
            Spacer(), // Ensure proper spacing below all elements
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VerifyCodeScreen(),
    ));
