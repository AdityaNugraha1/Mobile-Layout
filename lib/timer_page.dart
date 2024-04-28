import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  List<String> _lapTimes = [];

  void _startStopwatch() {
    if (!_stopwatch.isRunning) {
      _stopwatch.start();
      _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
        setState(() {});
      });
    }
  }

  void _stopStopwatch() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
      _timer?.cancel();
    }
  }

  void _resetStopwatch() {
    _stopwatch.reset();
    _lapTimes.clear();
    setState(() {});
  }

  void _recordLapTime() {
    final String formattedTime = _formattedTime();
    setState(() {
      _lapTimes.insert(0, formattedTime);
    });
  }

  void _removeLapTime(int index) {
    setState(() {
      _lapTimes.removeAt(index);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formattedTime() {
    final int milliseconds = _stopwatch.elapsed.inMilliseconds % 1000;
    final int seconds = _stopwatch.elapsed.inSeconds % 60;
    final int minutes = _stopwatch.elapsed.inMinutes % 60;
    final int hours = _stopwatch.elapsed.inHours;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}.${(milliseconds / 100).floor().toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(143, 148, 251, 1), // Violet background
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                _formattedTime(),
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Monospace',
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            height: 350,
            child: ListView.builder(
              itemCount: _lapTimes.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  'Lap ${_lapTimes.length - index}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _lapTimes[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _removeLapTime(index),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: _startStopwatch,
                  tooltip: 'Start',
                  child: Icon(Icons.play_arrow),
                ),
                SizedBox(width: 20),
                FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: _stopStopwatch,
                  tooltip: 'Stop',
                  child: Icon(Icons.stop),
                ),
                SizedBox(width: 20),
                FloatingActionButton(
                  backgroundColor: Colors.grey,
                  onPressed: _resetStopwatch,
                  tooltip: 'Reset',
                  child: Icon(Icons.refresh),
                ),
                SizedBox(width: 20),
                FloatingActionButton(
                  backgroundColor: Colors.orange,
                  onPressed: _stopwatch.isRunning ? _recordLapTime : null,
                  tooltip: 'Lap',
                  child: Icon(Icons.flag),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
