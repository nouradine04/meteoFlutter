import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'weather_screen.dart';

class HomeSreen extends StatefulWidget {
  const HomeSreen({super.key});

  @override
  State<HomeSreen> createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        leading: Icon(Icons.menu_sharp,
          color: isDarkMode ? Colors.white : Colors.black,

        ),
        title: Text("Meteo",
          style: TextStyle(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
        ),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.nightlight_round_outlined : Icons.wb_sunny ,size: 29,),
            color: isDarkMode ? Colors.white : Colors.black,

            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
            },
          ),
          SizedBox(width: 10,)
        ],
        backgroundColor: isDarkMode ? Colors.grey[900]! : Colors.white24,
      ),


      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
             end: Alignment.topCenter,
            colors: isDarkMode
                ? [Colors.black.withOpacity(0.7), Colors.black.withOpacity(0.4)]
                : [Colors.deepOrange, Colors.white],
          ),

        ),
        // color: isDarkMode ? Colors.black87 : Colors.white,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  ' Bienvenue aventurier du climat ',
                  textStyle: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70, // Couleur plus dynamique
                  ),
                  speed: Duration(milliseconds: 100), // Animation plus fluide
                  cursor: '|',
                ),
                FadeAnimatedText(
                  'Explore la météo en temps réel',
                  textStyle: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.deepOrangeAccent,
                  ),
                  duration: Duration(seconds: 2),
                ),
                ScaleAnimatedText(
                  'Ramadan kerim !',
                  textStyle: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                  ),
                  duration: Duration(seconds: 2),
                ),
              ],
              repeatForever: true,
              pause: Duration(milliseconds: 500),
            ),

            SizedBox(height: 100,),
            // Text("🌍 Bienvenue aventurier du climat !"),
            Center(
              // child: Container(
              //   height: 300,
              //   child: Lottie.asset('lotties/Animation.json'),
              // ),
              child: Column(
                children: [
                  Center(
                    child:Lottie.network('https://lottie.host/5f3fb49b-d8ca-4ed9-9c67-d1d805dea884/38MfUDjvWo.json',
                      width: 800,
                      height: 300,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 200,),
                  Container(
                    child: FloatingActionButton(
                      backgroundColor: Colors.deepOrange,
                      onPressed: () {
                        Navigator.pushNamed(context, '/weather');
                      },
                      child: Icon(Icons.arrow_forward, color: Colors.white),

                    )
                  ),
                ],
              ),
            ),

          ],

        ),

      ),
    );
  }
}
