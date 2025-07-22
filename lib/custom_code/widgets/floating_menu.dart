// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class FloatingMenu extends StatefulWidget {
  const FloatingMenu({
    super.key,
    this.width,
    this.height,
    this.onNewChat,
    this.onNewCommunity,
  });

  final double? width;
  final double? height;
  final Future Function()? onNewChat;
  final Future Function()? onNewCommunity;

  @override
  State<FloatingMenu> createState() => _FloatingMenuState();
}

class _FloatingMenuState extends State<FloatingMenu>
    with TickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  void toggleMenu() {
    setState(() {
      isOpen = !isOpen;
      if (isOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        // Curved Background with Buttons
        Positioned(
          right: 10,
          bottom: 10,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: isOpen ? 1.0 : 0.0,
            child: ScaleTransition(
              scale: _animation,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  // Curved Background Shape
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.black
                            .withOpacity(0.2), // Adjust transparency
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(120),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                    ),
                  ),

                  // New Chat Button
                  Positioned(
                    top: 25,
                    left: 25,
                    child: FadeTransition(
                      opacity: _animation,
                      child: Column(
                        children: [
                          FloatingActionButton(
                            heroTag: "newChat",
                            backgroundColor: Colors.white,
                            onPressed: widget.onNewChat,
                            child:
                                Icon(Icons.chat_bubble, color: Colors.purple),
                          ),
                          SizedBox(height: 5),
                          Text("New Chat",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                        ],
                      ),
                    ),
                  ),

                  // New Community Button
                  Positioned(
                    bottom: 65,
                    left: 65,
                    child: FadeTransition(
                      opacity: _animation,
                      child: Column(
                        children: [
                          FloatingActionButton(
                            heroTag: "newCommunity",
                            backgroundColor: Colors.white,
                            onPressed: widget.onNewCommunity,
                            child: Icon(Icons.group, color: Colors.purple),
                          ),
                          SizedBox(height: 5),
                          Text("New Community",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Main Floating Action Button (FAB)
        FloatingActionButton(
          heroTag: "toggle",
          backgroundColor: Colors.purple,
          onPressed: toggleMenu,
          child: Icon(isOpen ? Icons.close : Icons.add, color: Colors.white),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
