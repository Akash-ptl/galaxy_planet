import 'package:flutter/material.dart';
import 'package:galaxy_planet/global.dart';
import 'package:galaxy_planet/pages/details.dart';
import 'package:galaxy_planet/widget/blur.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List detail = [
    "Our home planet is the third planet from the Sun, and the only place we know of so far that’s inhabited by living things."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'images/denys-churchyn-Kwmz_c_NiYk-unsplash.jpg'),
                  fit: BoxFit.cover)),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 250,
                    child: GestureDetector(
                      onTap: () {},
                      child: ModelViewer(
                        src: data[index]['Image'],
                        ar: false,
                        autoRotate: true,
                        cameraControls: false,
                        disablePan: false,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BlurContainer(
                        height: 40,
                        width: 80,
                        child: Text(
                          data[index]['Name'],
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                  image: data[index]['Image'],
                                  name: data[index]['Name'],
                                  detail: data[index]['Detail'],
                                  diameter: data[index]['Diameter'],
                                  distance: data[index]['Distance'],
                                  year: data[index]['Year'],
                                ),
                              ));
                        },
                        child: const BlurContainer(
                          height: 40,
                          width: 80,
                          child: Text(
                            'Details',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
