import 'package:surgery_ar_app/core/config/app_configs.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:surgery_ar_app/views/onboarding/onboardingView.dart';
import 'package:surgery_ar_app/views/welcome_view.dart';
import '../../views/signup/signupView.dart';

import 'package:lottie/lottie.dart';
import '../../core/config/app_configs.dart';
import '../../core/utils/app_utils.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
String userName = "";
String userEmail = "";
String userPassword = "";

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: GestureDetector(
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 33,
                ),
              ],
            ),
          ),
        ),
        title: Text(
          "Entrar",
          style: AppFont.regular,
        ),
        leadingWidth: MediaQuery.of(context).size.width,
        toolbarHeight: 70,
      ),
      body: SafeArea(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: AppColors.primaryColor,
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.01,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: AppColors.whiteShade,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(48),
                          topRight: Radius.circular(48))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 180,
                        width: MediaQuery.of(context).size.width * 0.8,
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.09),
                        child: Lottie.asset(AppFiles.onBoardingAnimation1),
                      ),
                      InputField(
                        headerText: "Email",
                        formWidget: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            userEmail = value.toString().trim();
                          },
                          decoration: InputDecoration(
                            hintText: "Ex:. telson@gmail.com",
                            border: InputBorder.none,
                          ),
                        )
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      InputFieldPassword(
                        headerText: "Senha",
                        hintTexti: "Pelo menos 8 caracteres",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CheckerBox(),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: InkWell(
                              onTap: () {},
                              child: Text(
                                "Esqueceu a senha?",
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      InkWell(
                        onTap: () {
                          print("Login click");
                        },
                        child: GestureDetector(
                          onTap: ()async {
                            try {
                              await _auth.signInWithEmailAndPassword(
                                  email: userEmail, password: userPassword
                              );
                              await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => WelcomePage(title: "Home")
                                )
                              );
                            } on FirebaseAuthException catch (e) {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: Text("Opa! Login falhou"),
                                  content: Text('${e.message}'),
                                )
                              );
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.07,
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius:
                                const BorderRadius.all(Radius.circular(24))),
                            child: Center(
                              child: Text(
                                "Entrar",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.whiteShade),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.149,
                            top: MediaQuery.of(context).size.height * 0.08),
                        child: Text.rich(
                          TextSpan(
                              text: "Ainda não tem uma conta? ",
                              style: TextStyle(
                                  color: AppColors.grayShade.withOpacity(0.8), fontSize: 16),
                              children: [
                                TextSpan(
                                    text: "Cadastra-se",
                                    style: TextStyle(color: AppColors.primaryColor, fontSize: 16),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => SignUp()));
                                        print("Sign Up click");
                                      }),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class CheckerBox extends StatefulWidget {
  const CheckerBox({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckerBox> createState() => _CheckerBoxState();
}

class _CheckerBoxState extends State<CheckerBox> {
  bool? isCheck;
  @override
  void initState() {
    // TODO: implement initState
    isCheck = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
              value: isCheck,
              checkColor: AppColors.whiteShade, // color of tick Mark
              activeColor: AppColors.primaryColor,
              onChanged: (val) {
                setState(() {
                  isCheck = val!;
                  print(isCheck);
                });
              }),
          Text.rich(
            TextSpan(
              text: "Lembrar-me",
              style: TextStyle(color: AppColors.primaryColor.withOpacity(0.8), fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class InputField extends StatelessWidget {
  String headerText;
  TextFormField? formWidget;

  InputField({Key? key, required this.headerText, required this.formWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: Text(
            headerText,
            style: AppFont.regularBoldDark
          ),
        ),
        Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: AppColors.grayShade.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
              child: formWidget,
            )
          //IntrinsicHeight

        ),
      ],
    );
  }
}

class InputFieldPassword extends StatefulWidget {
  String headerText;
  String hintTexti;
  Widget? formWidget;

  InputFieldPassword(
      {Key? key, required this.headerText, required this.hintTexti})
      : super(key: key);

  @override
  State<InputFieldPassword> createState() => _InputFieldPasswordState();
}

class _InputFieldPasswordState extends State<InputFieldPassword> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: Text(
            widget.headerText,
            style: const TextStyle(
                color: Color(0xff2d2d2d), fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            color: AppColors.grayShade.withOpacity(0.2),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
            child: TextField(
              obscureText: _visible,
              onChanged: (value) {
                userPassword = value.toString().trim();
              },
              decoration: InputDecoration(
                  hintText: widget.hintTexti,
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                      icon: Icon(
                          _visible ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _visible = !_visible;
                        });
                      })),
            ),
          ),
        ),
      ],
    );
  }
}
