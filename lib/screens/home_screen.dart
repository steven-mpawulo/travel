import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:travel/screens/country_detail_screen.dart';
import 'package:travel/services/travel_service.dart';
import 'package:travel/shared/loading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List fetchedCountries = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    TravelService travel = TravelService();
    travel.fetchCountries().then((value) {
      setState(() {
        fetchedCountries = value;
      });
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(
                "Choose Destination",
                style: GoogleFonts.oswald(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.cyanAccent,
            ),
            body: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      fetchedCountries[index]["name"],
                      style: GoogleFonts.oswald(
                        fontSize: 18.0,
                      ),
                    ),
                    tileColor: Colors.white,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => CountryDetailScreen(
                                url: fetchedCountries[index]["url"],
                                name: fetchedCountries[index]["name"],
                              )),
                        ),
                      );
                    },
                  ),
                );
              },
              itemCount: fetchedCountries.length.toInt(),
            ),
          );
  }
}
