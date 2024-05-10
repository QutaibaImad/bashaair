// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:record/record.dart';

// class AudioPage extends StatefulWidget {
//   const AudioPage({super.key});

//   @override
//   State<AudioPage> createState() => _AudioPageState();
// }

// class _AudioPageState extends State<AudioPage> {
//   final AudioPlayer _audioPlayer = AudioPlayer();
//   final AudioRecorder _recorder = AudioRecorder();
//   bool _isRecording = false;
//   String? _filePath;
//   double _currentPosition = 0;
//   double _totalDuration = 0;

//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     _recorder.dispose();
//     super.dispose();
//   }

//   Future<void> _startRecording() async {
//     final bool isPermissionGranted = await _recorder.hasPermission();
//     if (!isPermissionGranted) {
//       return;
//     }
//     final directory = await getApplicationDocumentsDirectory();
//     String fileName = 'recording_${DateTime.now().microsecondsSinceEpoch}.m4a';

//     _filePath = '${directory.path}/$fileName';
//     const config = RecordConfig(
//       encoder: AudioEncoder.aacLc,
//       sampleRate: 44100,
//       bitRate: 128000,
//     );
//     await _recorder.start(config, path: _filePath!);
//     setState(() {
//       _isRecording = true;
//     });
//   }

//   Future<void> _stopRecording() async {
//     // final path = await _recorder.stop();
//     setState(() {
//       _isRecording = false;
//     });
//   }

//   Future<void> _playRecording() async {
//     if (_filePath != null) {
//       await _audioPlayer.setFilePath(_filePath!);
//       _totalDuration = _audioPlayer.duration?.inSeconds.toDouble() ?? 8;
//       _audioPlayer.positionStream.listen((position) {
//         setState(() {
//           _currentPosition = position.inSeconds.toDouble();
//         });
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Audio Test')),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Icon(
//               _isRecording ? Icons.mic : Icons.mic_none,
//               size: 100,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                     onPressed: () {
//                       _isRecording ? null : _startRecording();
//                     },
//                     child: Text('record')),
//                 ElevatedButton(
//                     onPressed: () {
//                       _isRecording ? _stopRecording() : null;
//                     },
//                     child: Text('stop')),
//               ],
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   !_isRecording ? _playRecording() : null;
//                 },
//                 child: Text('play')),
//             Slider(
//                 value: _currentPosition,
//                 max: _totalDuration,
//                 onChanged: (value) {
//                   setState(() {
//                     _currentPosition = value;
//                   });
//                   _audioPlayer.seek(Duration(seconds: value.toInt()));
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }
