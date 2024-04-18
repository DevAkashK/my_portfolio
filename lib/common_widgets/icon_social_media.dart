import 'package:flutter/material.dart';
class SocialMediaIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onClick;
  const SocialMediaIcon({super.key, required this.icon, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(24.0)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(icon,color: Colors.white70,),
            )),
      ),
    );
  }
}
