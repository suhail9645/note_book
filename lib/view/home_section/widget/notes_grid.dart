
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_book/controller/controllers/note_controller.dart';
import 'package:note_book/controller/controllers/search_controller.dart';
import 'package:note_book/core/const/lists.dart';
import 'package:note_book/model/note_model/note_model.dart';
import 'package:provider/provider.dart';

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
          StreamBuilder(
              stream: Provider.of<NoteController>(context).fetchAllNotes(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Note>allNotes=[];
                  return Consumer<SearchResultController>(
                    builder: (context, value, child) {
                      
                  
                    return StaggeredGrid.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 5,
                      children:
                          List.generate(!value.isSearch&&value.query.isEmpty? snapshot.data!.docs.length:value.searchResult.length, (index) {
                        Color color = noteTileColors[index % 5];
                        late Note note;
                        if(!value.isSearch&&value.query.isEmpty){
                        note = Note(
                            content: snapshot.data!.docs[index].data()['content'],
                            heading:
                                snapshot.data!.docs[index].data()['heading'],docId:snapshot.data!.docs[index].id);
                        allNotes.add(note);
                        if((snapshot.data!.docs.length-1)==index){
                       Provider.of<SearchResultController>(context,listen: false).allNotes=allNotes;
                       
                        }
                        }else{
                          note=value.searchResult[index];
                          
                        }
                        return GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => NoteViewAlert(
                                note: note,
                                  color: color, screenHight: screenHight),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            constraints: const BoxConstraints(
                                maxHeight: 200, minHeight: 100),
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
                                    note.heading,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(
                                    note.content,
                                    style: Theme.of(context).textTheme.titleSmall,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                    }
                  );
                } else {
                  return const Text('Please Wait ..');
                }
              })
        ],
      ),
    );
  }
}
