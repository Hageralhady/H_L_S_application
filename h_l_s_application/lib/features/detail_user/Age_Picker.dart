import 'package:flutter/material.dart';
import 'package:h_l_s_application/features/detail_user/Weight_Input_Screen.dart';

class AgeSelectionScreen extends StatefulWidget {
  @override
  _AgeSelectionScreenState createState() => _AgeSelectionScreenState();
}

class _AgeSelectionScreenState extends State<AgeSelectionScreen> {
  int selectedAge = 18; // Default selected age set to 18
  FixedExtentScrollController _controller = FixedExtentScrollController(
      initialItem: 18 - 12); // Set the initial item (18 is mapped to index 6)

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive design
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Top row with Arrow and Skip button
            Positioned(
              top: screenHeight * 0.05,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: SizedBox(
                      width: 32,
                      height: 32,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: GestureDetector(
                      onTap: () {
                        // Handle Skip action
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF9EFF00),
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Question text
            Positioned(
              top: screenHeight * 0.13,
              left: screenWidth * 0.07,
              child: Container(
                width: 178,
                height: 30,
                child: Opacity(
                  opacity: 1.0,
                  child: Text(
                    "How old are you?",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      backgroundColor: Colors.black,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            // Centered Number Picker with ListWheelScrollView
            Positioned(
              top: screenHeight * 0.17, // Adjusted for better placement
              left: (screenWidth - 70) / 2,
              child: SizedBox(
                width: 70,
                height: 600,
                child: ListWheelScrollView.useDelegate(
                  controller: _controller, // Set the controller here
                  physics: const FixedExtentScrollPhysics(),
                  itemExtent: 80, // Adjusted for better alignment
                  onSelectedItemChanged: (int index) {
                    setState(() {
                      selectedAge = 12 + index;
                    });
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                    builder: (context, index) {
                      int age = 12 + index;
                      return Center(
                        child: Container(
                          height: 50,
                          width: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: selectedAge == age
                                ? Color(0xFF9EFF00)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "$age",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 32, // Adjusted for better visibility
                              fontWeight: FontWeight.w500,
                              color: selectedAge == age
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: 69, // Range from 12 to 80
                  ),
                ),
              ),
            ),
            // Next Steps button
            Positioned(
              bottom: screenHeight * 0.08, // Moved up slightly
              left: screenWidth * 0.05,
              right: screenWidth * 0.05,
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF9EFF00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WeightInputScreen()),
                    );
                  },
                  child: Text(
                    "Next Steps",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
