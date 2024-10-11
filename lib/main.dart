import 'package:flutter/material.dart';
import 'package:super_tooltip/super_tooltip.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Super Tooltip Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends StatefulWidget {
  const ExamplePage({
    super.key,
  });
  @override
  State createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: TooltipWidget(
          content: const Text(
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. ",
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          child: Container(
            width: 40.0,
            height: 40.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class TooltipWidget extends StatefulWidget {
  final Widget content;
  final Widget child;
  const TooltipWidget({required this.child, required this.content, super.key});

  @override
  State createState() => _TooltipWidgetState();
}

class _TooltipWidgetState extends State<TooltipWidget> {
  final _controller = SuperTooltipController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: GestureDetector(
        onTap: () async {
          await _controller.showTooltip();
        },
        child: SuperTooltip(
          controller: _controller,
          popupDirection: TooltipDirection.down,
          backgroundColor: const Color(0xff2f2d2f),
          left: 10,
          right: 150,
          arrowTipDistance: 10.0,
          arrowBaseWidth: 20.0,
          arrowLength: 20.0,
          constraints: const BoxConstraints(
            minHeight: 0.0,
            maxHeight: 100,
            minWidth: 0.0,
            maxWidth: 100,
          ),
          touchThroughAreaShape: ClipAreaShape.rectangle,
          touchThroughAreaCornerRadius: 30,
          barrierColor: Colors.transparent,
          content: widget.content,
          child: widget.child,
        ),
      ),
    );
  }
}
