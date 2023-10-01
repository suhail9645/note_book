import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_book/controller/controllers/auth_controller.dart';
import 'package:note_book/core/const/widget.dart';
import 'package:note_book/model/user/user_model.dart';
import 'package:provider/provider.dart';

import '../../../core/const/lists.dart';
import '../../widget/primary_form.dart';

class LogiView extends StatelessWidget {
  LogiView({
    super.key,
    required this.formKey,
  });

  final UserMOdel userMOdel = UserMOdel();
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Welcome\nBack',
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
                  userMOdel: userMOdel,
                  title: loginFormTitles[index],
                  hint: loginFormHints[index],
                ),
              ),
              spaceForHeight30,
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Provider.of<AuthController>(context, listen: false)
                            .onGoogleSignin();
                      },
                      child: Container(
                        height: 47,
                        decoration: BoxDecoration(
                          color: const Color(0xFFA9AEAF),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            'G',
                            style: GoogleFonts.lato(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                    flex: 3,
                    child: Consumer<AuthController>(
                      builder: (context, value, child) {
                        WidgetsBinding.instance
                            .addPostFrameCallback((timeStamp) {
                          if (value.failure != null && !value.isLoading) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(value.failure!.message),
                              ),
                            );
                            value.failure = null;
                          } else if (value.isSuccess) {
                             Navigator.pushReplacementNamed(context, 'Home Screen');
                          }
                        });
                        if (!value.isLoading) {
                          return InkWell(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                Provider.of<AuthController>(context,
                                        listen: false)
                                    .onSignIn(userMOdel);
                              }
                            },
                            child: Container(
                              height: 47,
                              decoration: BoxDecoration(
                                color: const Color(0xFF68D4EB),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  'Sign In',
                                  style: GoogleFonts.lato(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            height: 47,
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
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
