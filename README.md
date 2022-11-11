## Simple Selector

![showcase](https://github.com/sameteyisan/simple_selector/blob/main/sample.gif)

![showcase](https://github.com/sameteyisan/simple_selector/blob/main/sample_2.gif)

A simple and customizable selector widget with animated transition.

```dart
SimpleSelector(
  selectedIndex: 0,
  items: [
    Icon(Icons.lock),
    Icon(Icons.lock_open),
  ],
);
```

That's it. ☺️ I only need two things. ``items`` and ``selectedIndex`` ☺️

```dart
SimpleSelector(
  selectedIndex: 0,
  dense: true,
  items: const [
    Icon(
      Icons.lock,
      color: Colors.white,
    ),
    Icon(
      Icons.lock_open,
      color: Colors.white,
    ),
  ],
  indicatorColor: selected == 0
      ? const Color(0xff2980b9)
      : const Color(0xff2980b9).withOpacity(0.5),
  itemExtent: 60,
  height: 35,
  onChanged: (index) => print(index),
);
```
 - **items**  The items to be used in the selection are entered here.
 - **selectedIndex**  Use this to change your selected item.
 - **duration**  Use this to set the animation duration.
 - **curve**  Use this to change the animation curve type.
 - **itemExtent**  if dense is true, itemextent is ignored. If false, items have this width.
 - **height**  Use this to specify the height of the items.
 - **indicatorColor**  Use this to change the indicator color.
 - **backgroundColor**  Use this to change the background color.
 - **radius**  Use this to change the radius.
 - **itemPadding**  Use this to give padding to each of the items. This way you can leave space between items.
 - **animation**  Use this to eliminate the animation transition altogether.
 - **itemAlign**  If you want to change where the items are aligned use this.
 - **onChanged**  This function is used to see the selected index.
 - **dense**   If this is true, itemextent is ignored. It spreads to the area allocated to it on the screen.
