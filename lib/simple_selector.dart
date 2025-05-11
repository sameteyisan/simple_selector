library simple_selector;

import 'package:flutter/material.dart';

class SimpleSelector extends StatefulWidget {
  const SimpleSelector({
    super.key,
    required this.items,
    required this.selectedIndex,
    this.duration = const Duration(milliseconds: 300),
    this.curve,
    this.itemExtent = 50,
    this.height = 25,
    this.indicatorColor = const Color(0xff2980b9),
    this.backgroundColor = const Color(0xff1D1F22),
    this.radius = 12,
    this.onChanged,
    this.animation = true,
    this.itemAlign,
    this.dense = false,
  });

  /// The items to be used in the selection are entered here.
  final List<Widget> items;

  /// Use this to change your selected item
  final int selectedIndex;

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

  /// Use this to eliminate the animation transition altogether.
  final bool animation;

  /// If you want to change where the items are aligned use this.
  final Alignment? itemAlign;

  /// This function is used to see the selected index.
  final Function(int index)? onChanged;

  /// If this is true, itemextent is ignored. It spreads to the area allocated to it on the screen.
  final bool dense;

  @override
  State<SimpleSelector> createState() => _SimpleSelectorState();
}

class _SimpleSelectorState extends State<SimpleSelector> {
  late Offset offset;

  @override
  void initState() {
    offset = Offset(widget.selectedIndex.toDouble(), 0);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SimpleSelector oldWidget) {
    setState(() {
      offset = Offset(widget.selectedIndex.toDouble(), 0);
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.selectedIndex >= widget.items.length ||
        widget.selectedIndex < 0) {
      throw "Array index out of bounds";
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: widget.dense
            ? constraints.maxWidth
            : widget.itemExtent * widget.items.length,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
          color: widget.backgroundColor,
        ),
        child: Stack(
          children: [
            AnimatedSlide(
              offset: offset,
              duration: widget.animation ? widget.duration : Duration.zero,
              curve: widget.curve ?? Curves.easeInOut,
              child: AnimatedContainer(
                duration: widget.animation ? widget.duration : Duration.zero,
                width: widget.dense
                    ? constraints.maxWidth / widget.items.length
                    : widget.itemExtent,
                height: widget.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.radius),
                  color: widget.indicatorColor,
                ),
              ),
            ),
            Row(
              children: widget.items
                  .asMap()
                  .entries
                  .map(
                    (kv) => Stack(
                      children: [
                        Container(
                          alignment: widget.itemAlign ?? Alignment.center,
                          width: widget.dense
                              ? constraints.maxWidth / widget.items.length
                              : widget.itemExtent,
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
                                final idxDouble = kv.key.toDouble();
                                if (offset.dx == idxDouble) {
                                  return;
                                }

                                if (widget.onChanged != null) {
                                  widget.onChanged!(kv.key);
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      );
    });
  }
}
