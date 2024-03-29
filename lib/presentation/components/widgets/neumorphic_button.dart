import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomNeumorphicButton extends StatelessWidget {
  final String screen;
  final VoidCallback onPressed;
  const CustomNeumorphicButton({
    Key? key,
    required this.formKey,
    required this.screen,
    required this.onPressed,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      
      onPressed: onPressed,
      style: const NeumorphicStyle(
        shape: NeumorphicShape.flat,
        color: Colors.blue,
        depth: 5,
        boxShape: NeumorphicBoxShape.circle(),
        surfaceIntensity: 0.5,
      ),
      padding: const EdgeInsets.all(12.0),
      child: const Icon(
        Icons.arrow_circle_right,
        size: 50,
        color: Colors.white,
      ),
    );
  }
}
