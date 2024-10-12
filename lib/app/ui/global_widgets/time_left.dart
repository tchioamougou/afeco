import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeLeft extends StatefulWidget {
  final DateTime targetDate;

  const TimeLeft({super.key, required this.targetDate});

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<TimeLeft> {
  late Timer _timer;
  int _timeRemaining = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        final now = DateTime.now();
        final difference = widget.targetDate.difference(now);
        _timeRemaining = difference.inSeconds;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final days = _timeRemaining ~/ (60 * 60 * 24);
    final hours = (_timeRemaining ~/ (60 * 60)) % 24;
    final minutes = (_timeRemaining ~/ 60) % 60;
    final seconds = _timeRemaining % 60;
    String end = 'minutes';
    if (days > 0) {
      end = "days".tr;
    } else if (hours > 0) {
      end = "hours".tr;
    }
    final daysText = days > 0 ? '${days < 10 ? "0${days}" : "${days}"}:' : "";
    final hoursText =
        hours > 0 ? '${hours < 10 ? "0${hours}" : "${hours}"}:' : "";
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(color: Colors.red.withOpacity(0.2)),
      child: Text(
        '${daysText}${hoursText}${minutes < 10 ? "0${minutes}" : "${minutes}"}:${seconds < 10 ? "0${seconds}" : "${seconds}"} $end left to reserve',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
    );
  }
}
