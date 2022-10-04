import 'package:surgery_ar_app/views/signup/signupView.dart';
import 'package:surgery_ar_app/views/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../core/config/app_configs.dart';
import '../../core/utils/app_utils.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> with TickerProviderStateMixin {
  final int _numPages = 4;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  bool startNowBtnActive = true;
  late AnimationController _animationController;
  static String img1 = 'https://assets6.lottiefiles.com/packages/lf20_clujqcpl.json';


  List<String> myCareer = ['Geral','Cardiovascular','Cabeça e pescoço','Torácica','Ortopédica'];

  @override
  initState() {
    _animationController = AnimationController(vsync: this);
    _animationController.duration = Duration(milliseconds: 500);
    _animationController.reset();
  }

  @override
  dispose() {
    _animationController.dispose();
    _pageController.dispose();

    super.dispose();
  }

  List<Widget> _buildPageIndicator() {
    _animationController.reset();
    List<Widget> list = [];
    for (int i = 0;
         i < _numPages;
         i++)
    {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: 8.0,
      width: isActive ? 50 : 25,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryColor : Color(0xffcccccc),
        borderRadius: BorderRadius.all(Radius.circular(12))
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.4,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState( () {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      dadosOnBoarding(
                          imgUrl: AppFiles.onBoardingAnimation1,
                          titulo: 'Educação médica é essencial',
                          subtitulo:
                          'A qualidade da educação reflete o estado da saúde pública'),
                      dadosOnBoarding(
                          imgUrl: AppFiles.onBoardingAnimation2,
                          titulo: 'Simular ajuda a salvar vidas',
                          subtitulo:
                          'Alguns cenários não podem ser simulados no mundo real'),
                      dadosOnBoarding(
                          imgUrl: AppFiles.onBoardingAnimation3,
                          titulo: 'Inúmeras possibilidades',
                          subtitulo:
                          'No mundo virtual não há limitações'),
                      dadosOnBoarding(
                          imgUrl: AppFiles.onBoardingAnimation4,
                          titulo: 'Segurança e perfomance',
                          subtitulo:
                          'Seu Código Inzo está disponível apenas aos seus contactos, e com sua permissão. '),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if(startNowBtnActive) {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SignUp())
                        );
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      height: MediaQuery.of(context).size.height / 12.5,
                      decoration: BoxDecoration(
                        color: Color(0xff44ec9e),
                        borderRadius: BorderRadius.all(Radius.circular(26))
                      ),
                      child: Center(
                        child: Text(
                          "COMEÇAR",
                          style: TextStyle(
                            //fontFamily: "Roboto",
                            fontWeight: FontWeight.w800,
                            fontSize: MediaQuery.of(context).size.width / 24,
                            color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

      ),
    );
  }

  Widget dadosOnBoarding({required String imgUrl, required String titulo, required String subtitulo}) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.width / 1.8,
              child: Lottie.asset(imgUrl),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            titulo,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: MediaQuery.of(context).size.width / 17,
                //fontFamily: 'RalewayBold'
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            subtitulo,
            style: TextStyle(
                color: Color(0xff6e7179),
                fontSize: MediaQuery.of(context).size.width / 20),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

}