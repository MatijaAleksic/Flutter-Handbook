import 'package:flutter/material.dart';
import 'package:flutter_practice/model/wather.dart';

class ListViewBuilderExample extends StatelessWidget {
  const ListViewBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather Forcast",
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
          ),
        ),
        backgroundColor: Colors.teal[800],
        centerTitle: true,
      ),
      backgroundColor: Colors.black54,
      body: const ListViewBuilder(),
    );
  }
}

class ListViewBuilder extends StatefulWidget {
  const ListViewBuilder({super.key});

  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  List<Weather> weatherList = getWeatherList();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: weatherList.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 175,
          child: Card(
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _WeatherImage(day: weatherList[index]),
                _WeatherDescription(day: weatherList[index]),
                _WeatherTemperature(day: weatherList[index]),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _WeatherImage extends StatelessWidget {
  const _WeatherImage({required this.day});

  final Weather day;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      width: 175,
      child: Stack(
        fit: StackFit.expand,
        children: [
          DecoratedBox(
            position: DecorationPosition.foreground,
            decoration: BoxDecoration(
                gradient: RadialGradient(colors: [
              Colors.grey[800]!,
              Colors.transparent,
            ])),
          ),
          Image.asset(
            'assets/image.jpeg',
            fit: BoxFit.cover,
          ),
          Center(
            child: Text(
              textAlign: TextAlign.center,
              day.dateDay.toString(),
              style: const TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WeatherDescription extends StatelessWidget {
  const _WeatherDescription({required this.day});

  final Weather day;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                day.dayName,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(day.description),
          ],
        ),
      ),
    );
  }
}

class _WeatherTemperature extends StatelessWidget {
  const _WeatherTemperature({required this.day});

  final Weather day;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        day.temerature,
        style: const TextStyle(fontSize: 17),
      ),
    );
  }
}
