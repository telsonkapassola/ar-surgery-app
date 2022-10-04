
import 'package:lottie/lottie.dart';
import 'package:surgery_ar_app/core/config/app_configs.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../core/utils/app_utils.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  List<String> myCareer = ['Geral','Cardiovascular','Cabeça e pescoço','Torácica','Ortopédica'];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(16),
          child: GestureDetector(
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.black26,
            ),
          ),
        ),
        leadingWidth: 70,
        toolbarHeight: 70,
        //title: Text(this.title),
        backgroundColor: AppColors.primaryColor,
        actions: [
          Row(
            children: [
              Container(
                  height: 40, width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(blurRadius: 7, spreadRadius: 3, color: AppColors.primaryColorDarker)
                    ],
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                  ),
                  child: GestureDetector(
                    onTap: ()=> print('marcações'),
                    child: Icon(Icons.bookmark, color: Colors.white, size: 23),
                  )
              ),
              SizedBox(width: 18),
              Container(
                height: 40, width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(blurRadius: 7, spreadRadius: 3, color: AppColors.primaryColorDarker)
                  ],
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                ),
                child: GestureDetector(
                  onTap: ()=> print('notificações'),
                  child: Icon(Icons.notifications, color: Colors.white,),
                )
              ),
              SizedBox(width: 28)
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Positioned(
            top: 0,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 10,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                      )
                  ),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Row(
                children: [
                  SizedBox(width: 24),
                  Text(
                    "Meu percurso",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 22,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff464646)
                    ),
                  ),
                ],
              ),
              SizedBox(
               height: 10,
              ),
              Positioned(
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 240,
                      child: ListView.builder(
                        padding: EdgeInsets.only(left: 22),
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        itemCount: myCareer.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: ()=> print("object"),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.9,
                              margin: EdgeInsets.only(right: 22),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(spreadRadius: 7, blurRadius: 10, color: Color(
                                      0xfff6f6f6))
                                ]
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                    child: Text(
                                      myCareer.elementAt(index),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xffc5c5c5)
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    child: Center(
                                      child: Image(image: AssetImage('assets/heart.png'), width: 120)
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 16,
                                    left: 16,
                                    child: Column(
                                      children: [
                                        new CircularPercentIndicator(
                                          radius: 12.0,
                                          lineWidth: 4.0,
                                          percent: 0.2,
                                          progressColor: Colors.green,
                                        )
                                      ],
                                    )
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(width: 24),
                  Text(
                    "Minha avaliação",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 22,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff464646)
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 4.5,
                        margin: EdgeInsets.only(left: 16, right: 8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(spreadRadius: 7, blurRadius: 10, color: Color(
                                  0xfff6f6f6))
                            ]
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                              child: Text(
                                "Cognitiva",
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width / 24,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffb9b9b9)
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            Center(
                              child: Lottie.asset(AppFiles.cognitiveIcon, reverse: false)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 4,
                        margin: EdgeInsets.only(left: 8, right: 16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(spreadRadius: 7, blurRadius: 10, color: Color(
                                  0xfff6f6f6))
                            ]
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                              child: Text(
                                "Prática",
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width / 24,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffb9b9b9)
                                ),
                              ),
                            ),
                            Positioned(
                              child: Center(
                                  //child: Image(image: AssetImage('assets/heart.png'), width: 120)
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

}