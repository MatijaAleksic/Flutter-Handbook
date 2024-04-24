class Weather {
  final int dateDay;
  final String dayName;
  final String description;
  final String temerature;

  Weather({
    required this.dateDay,
    required this.dayName,
    required this.description,
    required this.temerature,
  });
}

List<Weather> getWeatherList() {
  return [
    Weather(
        dateDay: 13,
        dayName: "Friday",
        description:
            "Partly cloudy in the morning, with sun appearing in the afternoon",
        temerature: "73|52 F"),
    Weather(
        dateDay: 14,
        dayName: "Saturday",
        description:
            "Partly cloudy in the morning, with sun appearing in the afternoon",
        temerature: "73|52 F"),
    Weather(
        dateDay: 15,
        dayName: "Sunday",
        description:
            "Partly cloudy in the morning, with sun appearing in the afternoon",
        temerature: "73|52 F"),
    Weather(
        dateDay: 16,
        dayName: "Monday",
        description:
            "Partly cloudy in the morning, with sun appearing in the afternoon",
        temerature: "73|52 F"),
    Weather(
        dateDay: 17,
        dayName: "Tuesday",
        description:
            "Partly cloudy in the morning, with sun appearing in the afternoon",
        temerature: "73|52 F"),
    Weather(
        dateDay: 18,
        dayName: "Wednsday",
        description:
            "Partly cloudy in the morning, with sun appearing in the afternoon",
        temerature: "73|52 F"),
    Weather(
        dateDay: 19,
        dayName: "Thursday",
        description:
            "Partly cloudy in the morning, with sun appearing in the afternoon",
        temerature: "73|52 F"),
    Weather(
        dateDay: 21,
        dayName: "Firday",
        description:
            "Partly cloudy in the morning, with sun appearing in the afternoon",
        temerature: "65|45 F"),
    Weather(
        dateDay: 22,
        dayName: "Saturday",
        description:
            "Partly cloudy in the morning, with sun appearing in the afternoon",
        temerature: "47|32 F"),
    Weather(
        dateDay: 23,
        dayName: "Sunday",
        description:
            "Partly cloudy in the morning, with sun appearing in the afternoon",
        temerature: "72|62 F"),
    Weather(
        dateDay: 24,
        dayName: "Monday",
        description:
            "Partly cloudy in the morning, with sun appearing in the afternoon",
        temerature: "51|26 F"),
    Weather(
        dateDay: 25,
        dayName: "Thuesday",
        description:
            "Partly cloudy in the morning, with sun appearing in the afternoon",
        temerature: "48|56 F"),
    Weather(
        dateDay: 26,
        dayName: "Wednesday",
        description:
            "Partly cloudy in the morning, with sun appearing in the afternoon",
        temerature: "84|26 F"),
  ];
}
