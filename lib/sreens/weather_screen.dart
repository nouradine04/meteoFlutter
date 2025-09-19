import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Météo",
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.nightlight_round_outlined : Icons.wb_sunny, size: 29),
            color: isDarkMode ? Colors.white : Colors.black,
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
            },
          ),
          SizedBox(width: 10)
        ],
        backgroundColor: isDarkMode ? Colors.grey[900]! : Colors.white24,
      ),
      body: Stack(
        children: [
          // Couche 1: GIF animé en arrière-plan
          Positioned.fill(
            child: Image.network(
              'https://media.giphy.com/media/t7Qb8655Z1VfBGr5XB/giphy.gif',
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.deepOrange,
                  ),
                );
              },
            ),
          ),

          // Couche 2: Gradient par-dessus le GIF
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: isDarkMode
                      ? [Colors.deepOrange.withOpacity(0.7), Colors.grey[900]!.withOpacity(0.7)]
                      : [Colors.deepOrange.withOpacity(0.7), Colors.white.withOpacity(0.5)],
                ),
              ),
            ),
          ),

          // Couche 3: Contenu principal
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Météo Aujourd'hui",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 3.0,
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: SearchBar(
                    leading: Icon(Icons.search_outlined),
                    hintText: 'Recherche',
                    backgroundColor: MaterialStateProperty.all(
                        isDarkMode ? Colors.grey[800]!.withOpacity(0.8) : Colors.white.withOpacity(0.8)
                    ),
                    hintStyle: MaterialStateProperty.all(
                        TextStyle(color: isDarkMode ? Colors.white70 : Colors.black54)
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? Colors.grey[800]!.withOpacity(0.85)
                        : Colors.deepOrangeAccent.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 9,
                        offset: Offset(0, 9),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Température",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "23°C",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Humidité",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "65%",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? Colors.grey[700]!.withOpacity(0.85)
                        : Colors.deepOrange[300]!.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 9,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Précipitations",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "70%",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Vent",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "10 km/h",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}