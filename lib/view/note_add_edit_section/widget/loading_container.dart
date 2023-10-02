
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 150,
      decoration: BoxDecoration(
        color: const Color(0xFF689FF3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Row(
          children: [
            Text(
              'Wait',
              style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
