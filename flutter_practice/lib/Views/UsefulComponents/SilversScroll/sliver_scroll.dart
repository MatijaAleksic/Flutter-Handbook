import 'package:flutter/material.dart';
import 'package:flutter_practice/model/wather.dart';

class SliverScroll extends StatefulWidget {
  const SliverScroll({super.key});

  @override
  State<SliverScroll> createState() => _SliverScrollState();
}

class _SliverScrollState extends State<SliverScroll> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black54,
      body: SliverScrollExample(),
    );
  }
}

class SliverScrollExample extends StatefulWidget {
  const SliverScrollExample({super.key});

  @override
  State<SliverScrollExample> createState() => _SliverScrollExampleState();
}

class _SliverScrollExampleState extends State<SliverScrollExample> {
  List<Weather> weatherList = getWeatherList();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const _WeatherSliverAppBar(),
        _WeatherSliverList(
          weatherList: weatherList,
        )
      ],
    );
  }
}

class _WeatherSliverAppBar extends StatelessWidget {
  const _WeatherSliverAppBar();

  Future<void> onStrech() async {
    print('=========');
    print("On Streched Triggered");
    print('=========');
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.teal[800],
      centerTitle: true,

      //GLAVNE OPCIJE
      //================
      pinned: true, // da bude pined na vrhu
      // floating: true, //da floatuje na vrhu al kad skrolujemo gore vrati se
      // snap: true,
      expandedHeight: 200,
      //================

      //Kada se odradi kao refresh - MOZE SAMO NA IPHONE
      stretch: true,
      onStretchTrigger: onStrech,

      flexibleSpace: FlexibleSpaceBar(
        //SAMO IPHONE - Animacija za app bar
        stretchModes: const [
          StretchMode.zoomBackground, // default
          StretchMode.blurBackground,
          StretchMode.fadeTitle
        ],

        //koja animacija da se koristi kada se expanduje app bar
        // collapseMode: CollapseMode.parallax,
        title: const Text(
          textAlign: TextAlign.center,
          "Weather Forcast",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),

        //Da se doda gradijent i slika u pozadini na vrhu
        background: DecoratedBox(
          position: DecorationPosition.foreground,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                Colors.teal[800]!,
                Colors.transparent,
              ])),
          child: Image.asset(
            'assets/beach.webp',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class _WeatherSliverList extends StatelessWidget {
  const _WeatherSliverList({required this.weatherList});

  final List<Weather> weatherList;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
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
      }, childCount: weatherList.length),
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
            Text(
              day.dayName,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
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
