import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_book/core/const/lists.dart';

import 'note_view_alert.dart';

class NotesGrid extends StatelessWidget {
  const NotesGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHight = size.height;
    
    return Flexible(
      child: ListView(
        children: [
          StaggeredGrid.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 5,
            children: List.generate(10, (index) {
              Color color = noteTileColors[index % 5];
              return GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        NoteViewAlert(color: color, screenHight: screenHight),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  constraints:
                      const BoxConstraints(maxHeight: 200, minHeight: 100),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Product design',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        index % 4 == 0
                            ? Text(
                                'Reply to emails'
                                'Prepare presentation slides for the marketing meeting'
                                'Conduct research on competitor products'
                                'Schedule and plan customer interviews'
                                'Take a break and recharge',
                                style: Theme.of(context).textTheme.titleSmall,
                              )
                            : Text(
                                'Share insights and findings from recent competitive analysis.',
                                style: Theme.of(context).textTheme.titleSmall),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
