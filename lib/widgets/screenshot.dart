import 'package:screenshot/screenshot.dart';
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
@override
_HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

// Create an instance of ScreenshotController
ScreenshotController screenshotController = ScreenshotController();

@override
void initState() {
	super.initState();
}

// create a variable of type Timer
late Timer _timer;
int _start = 0;
int _startTwo = 61;

// function to increment the timer until
// 61 and set the state
void increasingStartTimer() {
	const oneSec = const Duration(seconds: 1);
	_timer = new Timer.periodic(
	oneSec,
	(Timer timer) => setState(
		() {
		if (_start > 60) {
			timer.cancel();
		} else {
			_start = _start + 1;
		}
		},
	),
	);
}

// function to decrease the timer
// until 1 and set the state
void decreasingStartTimer() {
	const oneSec =  Duration(seconds: 1);
	_timer = Timer.periodic(
	oneSec,
	(Timer timer) => setState(
		() {
		if (_startTwo < 0) {
			timer.cancel();
		} else {
			_startTwo = _startTwo - 1;
		}
		},
	),
	);
}

@override
void dispose() {
	_timer.cancel();
	super.dispose();
}

@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: AppBar(
		title: const Text("GeeksForGeeks"),
		centerTitle: true,
	),
	body: Center(
		child: Column(
		children: [
			const SizedBox(height: 30),
			Screenshot(
			controller: screenshotController,
			child: Column(
				children: [
				const Text("Decreasing Timer : "),
				const SizedBox(
					height: 10,
				),
				Container(
					padding: const EdgeInsets.all(30.0),
					decoration: BoxDecoration(
						border:
							Border.all(color: Colors.blueAccent, width: 5.0),
						color: Colors.amberAccent,
					),
					child: Text(_startTwo.toString())),
				const SizedBox(
					height: 25,
				),
				const Text("Increasing Timer : "),
				const SizedBox(
					height: 10,
				),
				Container(
					padding: const EdgeInsets.all(30.0),
					decoration: BoxDecoration(
						border:
							Border.all(color: Colors.blueAccent,
									width: 5.0),
						color: Colors.amberAccent,
					),
					child: Text("$_start")),
				],
			),
			),
			ElevatedButton(
			onPressed: () {
				
				// invoking both functions for timer to start
				increasingStartTimer();
				decreasingStartTimer();
			},
			child: const Text("start"),
			),
			ElevatedButton(
				onPressed: () {
				setState(() {
					_start = 0;
					_startTwo = 61;
				});
				},
				child: const Text("Refresh")),
			ElevatedButton(
			child: const Text(
				'Capture Above Widget',
			),
			onPressed: () {
				
				// invoking capture on
				// screenshotController
				screenshotController
					.capture(delay: const Duration(milliseconds: 10))
					.then((capturedImage) async {
					
				// showing the captured widget
				// through ShowCapturedWidget
				ShowCapturedWidget(context,
									capturedImage!);
				}).catchError((onError) {
				print(onError);
				});
			},
			),
			ElevatedButton(
			child: const Text(
				'Capture An Invisible Widget',
			),
			onPressed: () {
				var container = Container(
					padding: const EdgeInsets.all(30.0),
					decoration: BoxDecoration(
					border: Border.all(color: Colors.blueAccent,
										width: 5.0),
					color: Colors.pink,
					),
					child: Text(
					"This is an invisible widget",
					style: Theme.of(context).textTheme.headline6,
					));
				
				// capturing all the widgets
				// that are invisible
				screenshotController
					.captureFromWidget(
						InheritedTheme.captureAll(
							context, Material(child: container)),
						delay: const Duration(seconds: 1))
					.then((capturedImage) {
					
				// showing the captured invisible widgets
				ShowCapturedWidget(context, capturedImage);
				});
			},
			),
		],
		),
	),
	);
}

// function to show captured widget
Future<dynamic> ShowCapturedWidget(
	BuildContext context, Uint8List capturedImage) {
	return showDialog(
	useSafeArea: false,
	context: context,
	builder: (context) => Scaffold(
		appBar: AppBar(
		title: const Text("Captured widget screenshot"),
		),
		body: Center(
			child: capturedImage != null
				? Image.memory(capturedImage)
				: Container()),
	),
	);
}
}
