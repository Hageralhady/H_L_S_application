import 'package:flutter/material.dart';
import 'package:h_l_s_application/features/auth/presentation/views/login_page.dart';

class PasswordChangedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Getting screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Back Arrow
            Positioned(
              top: screenHeight * 0.03, // Higher position (3% from the top)
              left: screenWidth * 0.03, // More left position (3% from the left)
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image
                  AnimatedOpacity(
                    opacity: 1, // Adjust opacity to make it visible
                    duration: Duration(milliseconds: 300),
                    child: Container(
                      width: screenWidth * 0.25, // 25% of the screen width
                      height: screenWidth * 0.25, // Equal width and height
                      child: Image.asset(
                        'assets/images/Successmark.png', // Replace with your image asset path
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05), // 5% of screen height
                  // Title and Subtitle
                  AnimatedOpacity(
                    opacity: 1, // Adjust opacity to make it visible
                    duration: Duration(milliseconds: 300),
                    child: Container(
                      width: screenWidth * 0.7, // 70% of the screen width
                      child: Column(
                        children: [
                          Text(
                            "Password Changed!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize:
                                  screenWidth * 0.06, // 6% of screen width
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                              height:
                                  screenHeight * 0.02), // 2% of screen height
                          Text(
                            "Your password has been\nchanged successfully.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize:
                                  screenWidth * 0.035, // Slightly smaller size
                              color: Colors.white
                                  .withOpacity(0.8), // Lighter color
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.1), // 10% of screen height
                  // Button
                  AnimatedOpacity(
                    opacity: 1, // Adjust opacity to make it visible
                    duration: Duration(milliseconds: 300),
                    child: SizedBox(
                      width: screenWidth * 0.9, // 90% of the screen width
                      height: screenHeight * 0.08, // 8% of screen height
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF9EFF00),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                12), // Adjusted border radius
                          ),
                        ),
                        child: Text(
                          "Return to Login",
                          style: TextStyle(
                            fontSize:
                                screenWidth * 0.04, // Slightly smaller size
                            fontWeight: FontWeight.w600, // Thicker text
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
