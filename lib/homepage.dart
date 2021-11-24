import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task7/stylesheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<String> options;
  late String selectedOption;
  late int optionIndex;
  late bool isSelected = false;

  @override
  void initState() {
    optionIndex = 0;
    selectedOption = '';
    options = [
      "Useful and Interesting!",
      "Wow! that's a cool effect",
      "Haha's That's funnny",
      "That looks beautiful"
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xEE000000),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 15),
              SizedBox(
                height: 270,
                width: 270,
                child: Image.asset('assets/stats.png'),
              ),
              const SizedBox(height: 20),
              Text(
                "What kind of Audiance",
                style: style(24.0, FontWeight.bold),
              ),
              Text(
                "you have for your content ?",
                style: style(24.0, FontWeight.bold),
              ),
              const SizedBox(height: 20),
              buildChoiceChips(),
              const SizedBox(height: 20),
              buildBottomBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBottomBar() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Back",
              style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
          SizedBox(
            width: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Skip",
              style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold, fontSize: 15),
            ),
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(6.0),
                primary: Colors.black12,
                onPrimary: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0))),
          )
        ],
      ),
    );
  }

  Widget buildChoiceChips() {
    return Column(
      children: List.generate(
        options.length,
        (index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12.0),
            child: ChoiceChip(
              padding: const EdgeInsets.all(0.0),
              backgroundColor: Colors.black45,
              selected: optionIndex == index,
              selectedColor: Colors.black12,
              onSelected: (bool selected) {
                setState(() {
                  optionIndex = selected ? index : 0;
                  selectedOption = options[optionIndex];
                  isSelected = true;
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              label: SizedBox(
                height: 65,
                child: Center(
                  child: Text(
                    options[index],
                    style: GoogleFonts.quicksand(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
