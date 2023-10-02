
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_book/controller/controllers/search_controller.dart';
import 'package:note_book/core/const/widget.dart';
import 'package:provider/provider.dart';

class SearchContainer extends StatelessWidget {
   SearchContainer({
    super.key,
  });
final TextEditingController controller=TextEditingController();
 final searchFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
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
              controller: controller,
              focusNode:searchFocusNode ,
              onChanged: (value) {
                Provider.of<SearchResultController>(context,listen: false).searchNotes(value);
              },
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
          Consumer<SearchResultController>(
            builder: (context, value, child) {
              
            if(value.isSearch){
            return InkWell(
              onTap: () {
                controller.clear();
                searchFocusNode.unfocus();
                Provider.of<SearchResultController>(context,listen: false).onCancelSearch();
              },
              child: const Icon(Icons.cancel_outlined),);
            }else{
              return const SizedBox();
            }
            }
          ),
          spaceForWidth10,
        ],
      ),
    );
  }
}
