import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

import 'package:latlong2/latlong.dart';

class Utils {
  static Duration stringToDuration(String input) {
    final parts = input.split('h');
    final hours = int.parse(parts[0]);
    final minutes = int.parse(parts[1]);

    return Duration(hours: hours, minutes: minutes);
  }

  static DateTime getNextWeekday(String weekday) {
    // Obtenir le jour actuel
    final now = DateTime.now();
    final formatter =
        DateFormat('EEEE'); // Formatteur pour les jours de la semaine

    // Convertir le jour de la semaine en entrée en majuscules pour une comparaison uniforme
    final targetWeekday = weekday.toUpperCase();

    // Trouver le prochain jour correspondant
    int daysToAdd = 1;
    while (true) {
      final nextDay = now.add(Duration(days: daysToAdd));
      if (formatter.format(nextDay).toUpperCase() == targetWeekday) {
        return nextDay;
      }
      daysToAdd++;
    }
  }

  static DateTime setDateTime(DateTime date, TimeOfDay time) {
    // Calculate the number of microseconds since the epoch for the date and time
    final microsecondsSinceEpoch = date.microsecondsSinceEpoch +
        time.hour * 60 * 60 * 1000000 +
        time.minute * 60 * 1000000;

    // Create a new DateTime object using the calculated microseconds
    final dateTime =
        DateTime.fromMicrosecondsSinceEpoch(microsecondsSinceEpoch);

    return dateTime;
  }

  static TimeOfDay stringToTimeOfDay(String input) {
    final formatter = DateFormat('hh:mm a');
    final parsedTime = formatter.parse(input);
    return TimeOfDay.fromDateTime(parsedTime);
  }

  static Color randomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(1.0);
  }

  static Map<String, String> formatDates(DateTime startDate, DateTime endDate) {
    final now = DateTime.now();
    final formatter = DateFormat('HH:mm');

    if (DateUtils.isSameDay(startDate, now) &&
        DateUtils.isSameDay(endDate, now)) {
      return {
        'day': 'Today',
        'time': '${formatter.format(startDate)} - ${formatter.format(endDate)}'
      };
    } else if (startDate.isAfter(now) && endDate.isAfter(now)) {
      return {
        'day': 'Tomorrow',
        'time': '${formatter.format(startDate)} - ${formatter.format(endDate)}'
      };
    } else if (startDate.isBefore(now) && endDate.isBefore(now)) {
      return {
        'day': 'yesterday',
        'time': '${formatter.format(startDate)} - ${formatter.format(endDate)}'
      };
    } else {
      final dayOfWeek = DateFormat('EEEE').format(startDate);
      return {
        'day': dayOfWeek,
        'time': '${formatter.format(startDate)} - ${formatter.format(endDate)}'
      };
    }
  }

  static int calculateDistance(LatLng point1, LatLng point2) {
    const Distance distance = Distance();
    return distance(point1, point2).toInt();
  }

  static String distanceToText(LatLng point1, LatLng point2) {
    int va = calculateDistance(point1, point2);

    if (va >= 1000) {
      // Convertir en kilomètres et arrondir à deux décimales
      return '${double.parse((va / 1000).toStringAsFixed(2)).toInt()} km';
    } else {
      // Retourner la distance en mètres
      return '${va} m';
    }
  }

  static String imageLoader(fileId) {
    return AppWriteBucket.urlBucket.replaceAll("fileId", fileId);
  }

  static String generateTransactionID() {
    const prefix = 'SF_';
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    const length = 15 - prefix.length;

    var transactionID = prefix;
    var random = math.Random();

    for (var i = 0; i < length; i++) {
      var randomIndex = random.nextInt(characters.length);
      transactionID += characters[randomIndex];
    }

    return transactionID;
  }

  static Map<String, double> maxAndMin(LatLng center, int distance) {
    double radiusInMeters = distance * 1000; // Rayon en mètres
    double latitudeDegreePerMeter = 1 /
        111111; // Approximation de la distance en degrés de latitude par mètre
    double longitudeDegreePerMeter = 1 / (111111 * math.cos(center.latitude));

    double deltaLat = radiusInMeters * latitudeDegreePerMeter;
    double deltaLon = radiusInMeters * longitudeDegreePerMeter;

    return {
      "minLat": center.latitude - deltaLat, // Latitude minimale
      "maxLat": center.latitude + deltaLat, // Latitude maximale
      "minLong": center.longitude - deltaLon, // Longitude minimale
      "maxLong": center.longitude + deltaLon, // Longitude maximale
    };
  }
  static String calculateSince(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
  print(difference.inDays);
    if (difference.inDays < 7) {
      return '1 week';
    } else if (difference.inDays < 30) {
      return '${difference.inDays ~/ 7}+ weeks';
    } else if (difference.inDays < 365) {
      return '${difference.inDays ~/ 30}+ months';
    } else {
      return '${difference.inDays ~/ 365}+ years';
    }
  }

}
