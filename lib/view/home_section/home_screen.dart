import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_book/core/const/lists.dart';
import 'package:note_book/core/const/widget.dart';

const cellRed = Color(0xffc73232);
const cellMustard = Color(0xffd7aa22);
const cellGrey = Color(0xffcfd4e0);
const cellBlue = Color(0xff1553be);
const background = Color(0xff242830);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHight = size.height;
    double screenWidth = size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              spaceForHeight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                        style: GoogleFonts.inter(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.5),
                        children: [
                          const TextSpan(text: 'THI'),
                          TextSpan(
                            text: 'N',
                            style: GoogleFonts.inter(
                                color: const Color.fromARGB(255, 84, 222, 84)),
                          ),
                          const TextSpan(text: 'K')
                        ]),
                  ),
                ],
              ),
              spaceForHeight20,
              Container(
                height: 46,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 175, 172, 172)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    spaceForWidth10,
                    const Icon(Icons.search),
                    spaceForWidth10,
                    Expanded(
                      child: TextFormField(
                        cursorColor: const Color.fromARGB(255, 125, 123, 123),
                        decoration: InputDecoration(
                          hintText: 'Search for Notes',
                          hintStyle: GoogleFonts.roboto(
                              color: const Color.fromARGB(255, 125, 123, 123)),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: -15),
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              spaceForHeight20,
              Flexible(
                child: ListView(
                  children: [
                    StaggeredGrid.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 5,
                      children: List.generate(10, (index) {
                        Color color = noteTileColors[index % 5];
                        return Container(
                            padding: const EdgeInsets.all(8),
                            constraints: const BoxConstraints(
                                maxHeight: 200, minHeight: 100),
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Container(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Product design',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    index % 4 == 0
                                        ? Text(
                                            'Reply to emails'
                                            'Prepare presentation slides for the marketing meeting'
                                            'Conduct research on competitor products'
                                            'Schedule and plan customer interviews'
                                            'Take a break and recharge',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          )
                                        : Text(
                                            'Share insights and findings from recent competitive analysis.',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall),
                                  ],
                                ),
                              ),
                            ));
                      }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
