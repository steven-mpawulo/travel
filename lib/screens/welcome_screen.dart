import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:travel/screens/home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Travel",
          style: GoogleFonts.oswald(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.cyanAccent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Get travel information about different countries.\nPlan for your flight.\nPack whatever you need.\nEnjoy your travels.",
                  style: GoogleFonts.oswald(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 25.0),
                Container(
                  width: 200.0,
                  height: 200.0,
                  child: Image.asset("assets/play_store_512.png"),
                ),
                SizedBox(height: 50.0),
                Center(
                  child: Container(
                    width: 300.0,
                    decoration: BoxDecoration(
                      color: Colors.cyanAccent,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const HomeScreen()),
                          ),
                        );
                      },
                      child: Text(
                        "Get Started",
                        style: GoogleFonts.oswald(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
