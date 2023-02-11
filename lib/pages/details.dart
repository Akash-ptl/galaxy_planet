import 'package:flutter/material.dart';
import 'package:galaxy_planet/widget/blur.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DetailPage extends StatefulWidget {
  String name;
  String detail;
  String diameter;
  String distance;
  String year;
  String image;

  DetailPage({
    super.key,
    required this.name,
    required this.image,
    required this.detail,
    required this.diameter,
    required this.distance,
    required this.year,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  TextStyle text1 = TextStyle(fontSize: 20, color: Colors.white);
  TextStyle text2 = TextStyle(fontSize: 20, color: Colors.green);

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
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 40),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      color: Colors.white,
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Text(
                    widget.name,
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    height: 250,
                    child: ModelViewer(
                      src: widget.image,
                      ar: true,
                      autoRotate: true,
                      cameraControls: true,
                      disablePan: false,
                    ),
                  ),
                  const SizedBox(height: 10),
                  BlurContainer(
                    height: 500,
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: <InlineSpan>[
                                TextSpan(text: 'Diameter : ', style: text2),
                                TextSpan(text: widget.diameter, style: text1)
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              children: <InlineSpan>[
                                TextSpan(
                                    text: 'Distance from Sun : ', style: text2),
                                TextSpan(text: widget.distance, style: text1)
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              children: <InlineSpan>[
                                TextSpan(
                                    text: 'Length of Year : ', style: text2),
                                TextSpan(text: widget.year, style: text1)
                              ],
                            ),
                          ),
                          AutoSizeText.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: 'Detail : ', style: text2),
                                TextSpan(text: widget.detail, style: text1)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
