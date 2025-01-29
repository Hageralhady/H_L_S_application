import 'package:flutter/material.dart';
import 'package:h_l_s_application/features/detail_user/Height_Input_Screen.dart';
import 'package:h_l_s_application/features/detail_user/Weight_Input_Screen.dart';

class GoalWeightScreen extends StatefulWidget {
  @override
  _GoalWeightScreenState createState() => _GoalWeightScreenState();
}

class _GoalWeightScreenState extends State<GoalWeightScreen> {
  bool isKgSelected = true;
  TextEditingController weightController = TextEditingController(text: "65");

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Top Navigation (Back & Skip)
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WeightInputScreen()),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HeightInputScreen()),
                        );
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

            // Title Text
            Positioned(
              top: screenHeight * 0.13,
              left: screenWidth * 0.07,
              child: Container(
                width: 280,
                height: 30,
                child: Text(
                  "What's your goal weight ?",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),

            // Centered Content
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // KG / LBS Toggle
                    Container(
                      width: 122,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildToggleButton("LBS", !isKgSelected),
                          _buildToggleButton("KG", isKgSelected),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),

                    // Weight Input Box (Perfectly Aligned)
                    Container(
                      width: 322,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Number Input
                          SizedBox(
                            width: 30,
                            child: TextField(
                              controller: weightController,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),

                          // Vertical Separator
                          Container(
                            width: 1.5,
                            height: 40,
                            color: Colors.white,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                          ),

                          // Unit Text (kg/lbs)
                          Text(
                            isKgSelected ? "kg" : "lbs",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
                          builder: (context) => HeightInputScreen()),
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

  // Reusable Toggle Button
  Widget _buildToggleButton(String label, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isKgSelected = label == "KG";
          });
        },
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? Color(0xFF9EFF00) : Colors.transparent,
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.black : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
