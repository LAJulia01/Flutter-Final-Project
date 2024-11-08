import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MapScreen(),
      ),
    );
  }
}

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // This Container represents the Map
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/map.png'), // Placeholder for map
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Legend Card
        Positioned(
          top: 50,
          left: 20,
          right: 20,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  LegendItem(color: Colors.blue, text: "Your Location"),
                  LegendItem(color: Colors.pink, text: "Anna Residence"),
                ],
              ),
            ),
          ),
        ),
        // Details Card
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Anna Residence",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text("Tuna street block 90"),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfoItem(icon: Icons.directions_car, text: "19 mins"),
                      InfoItem(icon: Icons.location_on, text: "3 km"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Start Route"),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text("Direction"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String text;
  
  const LegendItem({super.key, required this.color, required this.text});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 5),
        Text(text),
      ],
    );
  }
}

class InfoItem extends StatelessWidget {
  final IconData icon;
  final String text;
  
  const InfoItem({super.key, required this.icon, required this.text});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20),
        SizedBox(width: 5),
        Text(text),
      ],
    );
  }
}
