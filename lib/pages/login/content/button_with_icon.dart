import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  final IconData? icon;
  final Function()? onPressed;
  final String? title;
  final bool? isIconShow;
  final Color? color;
  final Color? titleColor;

  const ButtonWithIcon(
      {super.key,
      this.onPressed,
      this.icon,
      this.title,
      this.isIconShow = true,
      this.color = Colors.white,
      this.titleColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            side: const BorderSide(width: 0.6, color: Colors.black)),
        child: isIconShow == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon),
                  const SizedBox(width: 6),
                  Text(title ?? "", style: TextStyle(color: titleColor)),
                ],
              )
            : Text(title ?? "",style: TextStyle(color: titleColor)),
      ),
    );
  }
}
