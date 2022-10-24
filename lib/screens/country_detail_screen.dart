import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel/services/travel_service.dart';
import 'package:travel/shared/loading.dart';

class CountryDetailScreen extends StatefulWidget {
  final String url;
  final String name;

  const CountryDetailScreen({Key? key, required this.url, required this.name})
      : super(key: key);

  @override
  State<CountryDetailScreen> createState() => _CountryDetailScreenState();
}

class _CountryDetailScreenState extends State<CountryDetailScreen> {
  bool isLoading = true;
  List country = [];
  bool isLengthGreater = true;
  bool isLanguageLengthGreater = true;
  @override
  void initState() {
    super.initState();
    TravelService travel = TravelService();
    print(widget.url);
    travel.fetchCountry(widget.url).then((value) {
      setState(() {
        List values = [value];
        country = values;
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
                widget.name,
                style: GoogleFonts.oswald(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.cyanAccent,
            ),
            body: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                List language = country[index]["language"];
                int languageLength = language.length.toInt();
                if (languageLength == 0) {
                  isLanguageLengthGreater = false;
                } else if (languageLength == 1) {
                  country[index]["language"] = [
                    {"language": "English", "official": "Yes"},
                    {"language": "Other", "official": "No"},
                  ];
                } else if (languageLength == 3) {
                  country[index]["language"] = [
                    {"language": "English", "official": "Yes"},
                    {"language": "Other", "official": "Yes"},
                  ];
                }
                List vaccination = country[index]["vaccinations"];
                int vaccinationLength = vaccination.length.toInt();
                if (vaccinationLength == 0) {
                  isLengthGreater = false;
                } else if (vaccinationLength == 1) {
                  country[index]["vaccinations"] = [
                    {
                      "name": "Yellow fever",
                      "message":
                          "Yellow fever does not occur in this country. However, vaccination is required if you are traveling from a country with the risk of yellow fever"
                    },
                    {"name": "Malaria", "message": "No information available"},
                    {"name": "Tyfoid", "message": "No information available"},
                    {
                      "name": "Hepatitis A",
                      "message": "No information available"
                    },
                  ];
                } else if (vaccinationLength == 3) {
                  country[index]["vaccinations"] = [
                    {
                      "name": "Yellow fever",
                      "message":
                          "Yellow fever does not occur in this country. However, vaccination is required if you are traveling from a country with the risk of yellow fever"
                    },
                    {
                      "name": "DTP",
                      "message":
                          "Vaccination is recommended for all travelers to this country"
                    },
                    {
                      "name": "Hepatitis B",
                      "message":
                          "Thevaccination advice is personal. Consult a qualified medical professional to determine whether vaccination is useful for you"
                    },
                    {
                      "name": "Hepatitis A",
                      "message":
                          "Vaccination is recommended for all travelers to this country"
                    },
                  ];
                }
                return Column(
                  children: [
                    Container(
                      width: 300.0,
                      height: 80.0,
                      decoration: const BoxDecoration(),
                      child: Card(
                        child: Column(
                          children: [
                            Container(
                              width: 300.0,
                              color: Colors.cyan,
                              child: Center(
                                child: Text(
                                  "TimeZone",
                                  style: GoogleFonts.oswald(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const Divider(
                              height: 1.0,
                            ),
                            Text(
                              country[index]["timezone"]["name"] ??
                                  "Not available",
                              style: GoogleFonts.oswald(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      width: 300.0,
                      height: 120.0,
                      decoration: const BoxDecoration(),
                      child: isLanguageLengthGreater
                          ? Card(
                              child: Column(
                                children: [
                                  Container(
                                    width: 300.0,
                                    color: Colors.cyan,
                                    child: Center(
                                      child: Text(
                                        "Langauge",
                                        style: GoogleFonts.oswald(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    height: 1.0,
                                  ),
                                  Text(
                                    country[index]["language"][0]["language"],
                                    style: GoogleFonts.oswald(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Text(
                                    country[index]["language"][1]["language"],
                                    style: GoogleFonts.oswald(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Card(
                              child: Column(
                                children: [
                                  Container(
                                    width: 300.0,
                                    color: Colors.cyan,
                                    child: Center(
                                      child: Text(
                                        "Langauge",
                                        style: GoogleFonts.oswald(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    height: 1.0,
                                  ),
                                  Text(
                                    "No information available",
                                    style: GoogleFonts.oswald(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                    const SizedBox(height: 5.0),
                    Container(
                      width: 300.0,
                      height: 120.0,
                      decoration: const BoxDecoration(),
                      child: Card(
                        child: Column(
                          children: [
                            Container(
                              width: 300.0,
                              color: Colors.cyan,
                              child: Center(
                                child: Text(
                                  "Currency",
                                  style: GoogleFonts.oswald(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const Divider(
                              height: 1.0,
                            ),
                            Text(
                              "Name : ${country[index]["currency"]["name"]}",
                              style: GoogleFonts.oswald(
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              "Code : ${country[index]["currency"]["code"]}",
                              style: GoogleFonts.oswald(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Container(
                      width: 300.0,
                      height: 120.0,
                      decoration: const BoxDecoration(),
                      child: Card(
                        child: Column(
                          children: [
                            Container(
                              width: 300.0,
                              color: Colors.cyan,
                              child: Center(
                                child: Text(
                                  "Electricity",
                                  style: GoogleFonts.oswald(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const Divider(
                              height: 1.0,
                            ),
                            Text(
                              "Voltage : ${country[index]["electricity"]["voltage"]}",
                              style: GoogleFonts.oswald(
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              "Frequency : ${country[index]["electricity"]["frequency"]}",
                              style: GoogleFonts.oswald(
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              "Plug : ${country[index]["electricity"]["plugs"]}",
                              style: GoogleFonts.oswald(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Container(
                      width: 300.0,
                      height: 150.0,
                      decoration: const BoxDecoration(),
                      child: Card(
                        child: Column(
                          children: [
                            Container(
                              width: 300.0,
                              color: Colors.cyan,
                              child: Center(
                                child: Text(
                                  "Telephone",
                                  style: GoogleFonts.oswald(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const Divider(
                              height: 1.0,
                            ),
                            Text(
                              "Calling Code : ${country[index]["telephone"]["calling_code"]}",
                              style: GoogleFonts.oswald(
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              "Police : ${country[index]["telephone"]["police"]}",
                              style: GoogleFonts.oswald(
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              "Ambulance : ${country[index]["telephone"]["ambulance"]}",
                              style: GoogleFonts.oswald(
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              "Fire : ${country[index]["telephone"]["fire"]}",
                              style: GoogleFonts.oswald(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Container(
                      width: 300.0,
                      height: 600.0,
                      decoration: const BoxDecoration(),
                      child: isLengthGreater
                          ? Card(
                              child: Column(
                                children: [
                                  Container(
                                    width: 300.0,
                                    color: Colors.cyan,
                                    child: Center(
                                      child: Text(
                                        "Vaccinations",
                                        style: GoogleFonts.oswald(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    height: 1.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${country[index]["vaccinations"][0]["name"]} : ${country[index]["vaccinations"][0]["message"]}",
                                      style: GoogleFonts.oswald(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${country[index]["vaccinations"][1]["name"]} : ${country[index]["vaccinations"][1]["message"]}",
                                      style: GoogleFonts.oswald(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${country[index]["vaccinations"][2]["name"]} : ${country[index]["vaccinations"][2]["message"]}",
                                      style: GoogleFonts.oswald(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${country[index]["vaccinations"][3]["name"]} : ${country[index]["vaccinations"][3]["message"]}",
                                      style: GoogleFonts.oswald(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Card(
                              child: Column(
                                children: [
                                  Container(
                                    width: 300.0,
                                    color: Colors.cyan,
                                    child: Center(
                                      child: Text(
                                        "Vaccinations",
                                        style: GoogleFonts.oswald(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    height: 1.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Malaria : No information available",
                                      style: GoogleFonts.oswald(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Hepatitis A : No information available",
                                      style: GoogleFonts.oswald(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Hepatitis B : No information available",
                                      style: GoogleFonts.oswald(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Yellow fever : No information available",
                                      style: GoogleFonts.oswald(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ],
                );
              },
              itemCount: country.length.toInt(),
            ),
          );
  }
}
