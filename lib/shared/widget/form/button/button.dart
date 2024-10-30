import 'package:flutter/material.dart';

import '../../../../core.dart';

class QButton extends StatefulWidget {
  const QButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.width,
    this.height,
    this.icon,
    this.sufixIcon,
    this.color,
    this.spaceBetween = false,
    this.isOutline = false,
    this.fontSize,
    this.enabled = true,
  });
  final String label;
  final Function onPressed;
  final double? width;
  final double? height;
  final IconData? icon;
  final IconData? sufixIcon;
  final Color? color;
  final bool spaceBetween;
  final bool? isOutline;
  final double? fontSize;
  final bool enabled;

  @override
  State<QButton> createState() => _QButtonState();
}

class _QButtonState extends State<QButton> {
  @override
  Widget build(BuildContext context) {
    var widgetWidth = widget.width ?? MediaQuery.of(context).size.width;
    var widgetHeight = 37.0;
    var widgetFontSize = 12.0;
    var widgetIconSize = 24.0;

    widgetHeight = widget.height ?? widgetHeight;

    return Container(
      width: widgetWidth,
      height: widgetHeight,
      decoration: (widget.isOutline ?? false)
          ? BoxDecoration(
              border: Border.all(
                width: 1.3,
                color: primaryColor,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
            )
          : null,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          backgroundColor: (widget.isOutline ?? false)
              ? scaffoldBackgroundColor
              : widget.enabled
                  ? (widget.color ?? primaryColor)
                  : disabledColor,
        ),
        onPressed: () {
          widget.enabled ? widget.onPressed() : {};
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.icon != null) ...[
              Icon(
                widget.icon,
                size: widgetIconSize,
                color: Colors.white,
              ),
              if (widget.label.isNotEmpty)
                const SizedBox(
                  width: 6,
                ),
            ],
            if (widget.spaceBetween && widget.icon != null) const Spacer(),
            if (widget.icon == null)
              Expanded(
                child: Text(
                  widget.label,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: widget.fontSize ?? widgetFontSize,
                    color: (widget.isOutline ?? false)
                        ? primaryColor
                        : Colors.white,
                  ),
                ),
              ),
            if (widget.icon != null)
              Text(
                widget.label,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: widget.fontSize ?? widgetFontSize,
                  color: Colors.white,
                ),
              ),
            if (widget.spaceBetween && widget.sufixIcon != null) const Spacer(),
            if (widget.sufixIcon != null) ...[
              Icon(
                widget.sufixIcon,
                size: widgetIconSize,
                color: Colors.white,
              ),
              const SizedBox(
                width: 6,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
