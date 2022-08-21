library simple_selector;

import 'package:flutter/material.dart';

class SimpleSelector extends StatefulWidget {
  const SimpleSelector({
    Key? key,
    required this.items,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeInOut,
    this.itemExtent = 50,
    this.height = 25,
    this.indicatorColor = const Color(0xffD2D8DD),
    this.backgroundColor = const Color(0xff1D1F22),
    this.radius = 12,
    this.itemPadding,
    this.mainAxisSize,
    this.onChanged,
    this.animation = true,
    this.itemAlign,
    this.axis,
  }) : super(key: key);
  final List<Widget> items;
  final Duration duration;
  final Curve curve;
  final double itemExtent;
  final double height;
  final Color indicatorColor;
  final Color backgroundColor;
  final double radius;
  final EdgeInsets? itemPadding;
  final MainAxisSize? mainAxisSize;
  final Function(int index)? onChanged;
  final bool animation;
  final Alignment? itemAlign;
  final Axis? axis;

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
              curve: widget.curve,
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
