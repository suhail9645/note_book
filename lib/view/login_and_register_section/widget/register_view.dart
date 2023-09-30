import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_book/controller/controllers/auth_controller.dart';
import 'package:note_book/model/user/user_model.dart';
import 'package:note_book/view/login_and_register_section/login_register_screen.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/const/lists.dart';
import '../../../core/const/widget.dart';
import '../../widget/primary_form.dart';

class RegisterView extends StatelessWidget {
  RegisterView({
    super.key,
    required this.screenWidth,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;
  final double screenWidth;

  final UserMOdel userModel = UserMOdel();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Register\nNow',
                    style: GoogleFonts.inika(
                        letterSpacing: 2,
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              spaceForHeight30,
              ...List.generate(
                2,
                (index) => PrimaryForm(
                  title: loginFormTitles[index],
                  hint: loginFormHints[index],
                  userMOdel: userModel,
                ),
              ),
              spaceForHeight30,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Consumer<AuthController>(builder: (context, value, child) {
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      if (value.failure != null && !value.isLoading) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(value.failure!.message),
                          ),
                        );
                        value.failure = null;
                      } else if (value.isSuccess) {
                        Navigator.pushNamed(context, 'Home Screen');
                      }
                    });

                    if (!value.isLoading) {
                      return InkWell(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            Provider.of<AuthController>(context, listen: false)
                                .onSignUp(userModel);
                          }
                        },
                        child: Container(
                          height: 47,
                          width: screenWidth * 0.50,
                          decoration: BoxDecoration(
                            color: const Color(0xFF6885EB),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              'Register',
                              style: GoogleFonts.lato(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        height: 47,
                        width: screenWidth * 0.50,
                        decoration: BoxDecoration(
                          color: const Color(0xFF68D4EB),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            'Wait',
                            style: GoogleFonts.lato(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    }
                  }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
