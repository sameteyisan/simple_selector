library simple_selector;

import 'package:flutter/material.dart';

class SimpleSelector extends StatefulWidget {
  const SimpleSelector({
    Key? key,
    required this.items,
    this.duration = const Duration(milliseconds: 300),
    this.curve,
    this.itemExtent = 50,
    this.height = 25,
    this.indicatorColor = const Color(0xff2980b9),
    this.backgroundColor = const Color(0xff1D1F22),
    this.radius = 12,
    this.itemPadding,
    this.mainAxisSize,
    this.onChanged,
    this.animation = true,
    this.itemAlign,
  }) : super(key: key);

  /// The items to be used in the selection are entered here.
  final List<Widget> items;

  /// Use this to set the animation duration.
  final Duration duration;

  /// Use this to change the animation curve type.
  final Curve? curve;

  /// Use this to specify the width of the items.
  final double itemExtent;

  /// Use this to specify the height of the items.
  final double height;

  /// Use this to change the indicator color.
  final Color indicatorColor;

  /// Use this to change the background color.
  final Color backgroundColor;

  /// Use this to change the radius.
  final double radius;

  /// Use this to give padding to each of the items. This way you can leave space between items.
  final EdgeInsets? itemPadding;

  /// Use this to organize the space occupied by items horizontally.
  final MainAxisSize? mainAxisSize;

  /// Use this to eliminate the animation transition altogether.
  final bool animation;

  /// If you want to change where the items are aligned use this.
  final Alignment? itemAlign;

  /// This function is used to see the selected index.
  final Function(int index)? onChanged;

  @override
  State<SimpleSelector> createState() => _MyaAckageState();
}

class _MyaAckageState extends State<SimpleSelector> {
  var offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.itemExtent * widget.items.length,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius),
        color: widget.backgroundColor,
      ),
      child: Stack(
        children: [
          if (widget.items.isNotEmpty)
            AnimatedSlide(
              offset: offset,
              duration: widget.animation ? widget.duration : Duration.zero,
              curve: widget.curve ?? Curves.easeInOut,
              child: Container(
                width: widget.itemExtent,
                height: widget.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.radius),
                  color: widget.indicatorColor,
                ),
              ),
            ),
          Row(
            mainAxisSize: widget.mainAxisSize ?? MainAxisSize.max,
            children: widget.items
                .asMap()
                .entries
                .map(
                  (kv) => Padding(
                    padding: widget.itemPadding ?? EdgeInsets.zero,
                    child: Stack(
                      children: [
                        Container(
                          alignment: widget.itemAlign ?? Alignment.center,
                          width: widget.itemExtent,
                          height: widget.height,
                          child: kv.value,
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius:
                                  BorderRadius.circular(widget.radius),
                              onTap: () {
                                if (offset.dx == kv.key.toDouble()) {
                                  return;
                                }
                                setState(() {
                                  offset = Offset(kv.key.toDouble(), 0);
                                });
                                if (widget.onChanged != null) {
                                  widget.onChanged!(kv.key);
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
