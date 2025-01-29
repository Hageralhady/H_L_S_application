import 'package:flutter/material.dart';
import 'package:h_l_s_application/features/detail_user/Goal_Level.dart';
import 'package:h_l_s_application/features/detail_user/Height_Input_Screen.dart';

class FitnessLevelScreen extends StatefulWidget {
  @override
  _FitnessLevelScreenState createState() => _FitnessLevelScreenState();
}

class _FitnessLevelScreenState extends State<FitnessLevelScreen> {
  String? selectedLevel;

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
                                builder: (context) => HeightInputScreen()),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: GestureDetector(
                      onTap: () {},
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
                  "What's your goal weight?",
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

            // Centered Fitness Level Selection
            Center(
              child: Container(
                width: 380,
                height: 390,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.black, width: 0), // Outer border
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FitnessLevelButton(
                      level: 'Beginner',
                      isSelected: selectedLevel == 'Beginner',
                      onSelect: () {
                        setState(() {
                          selectedLevel = 'Beginner';
                        });
                      },
                    ),
                    SizedBox(height: 50), // Adjusted margin
                    FitnessLevelButton(
                      level: 'Intermediate',
                      isSelected: selectedLevel == 'Intermediate',
                      onSelect: () {
                        setState(() {
                          selectedLevel = 'Intermediate';
                        });
                      },
                    ),
                    SizedBox(height: 50), // Adjusted margin
                    FitnessLevelButton(
                      level: 'Advanced',
                      isSelected: selectedLevel == 'Advanced',
                      onSelect: () {
                        setState(() {
                          selectedLevel = 'Advanced';
                        });
                      },
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
                          builder: (context) => GoalLevelScreen()),
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

class FitnessLevelButton extends StatelessWidget {
  final String level;
  final bool isSelected;
  final VoidCallback onSelect;

  const FitnessLevelButton({
    required this.level,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300), // Smooth transition
        width: 330,
        height: 65,
        margin: EdgeInsets.only(bottom: 30), // Adjusted margin
        decoration: BoxDecoration(
          color: isSelected
              ? Color(0xFF9EFF00)
              : Colors.black, // Background color change
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white, width: 1.5),
        ),
        child: Center(
          child: Text(
            level,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color:
                  isSelected ? Colors.black : Colors.white, // Text color change
              height: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
