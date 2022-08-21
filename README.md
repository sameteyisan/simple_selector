## Simple Selector



A simple and customizable selector widget with animated transition.

```dart
SimpleSelector(
      items: [
        Icon(Icons.lock),
        Icon(Icons.lock_open),
      ],
     );
```

That's it. ☺️ You can only use it by giving an ``items``.

```dart
SimpleSelector(
      items: [
        Icon(Icons.lock),
        Icon(Icons.lock_open),
      ],
    duration: const  Duration(milliseconds: 300),
	curve: Curves.easeInOutCubic,
	onChanged: (index) {
		print(index);
	},
  );
```

 -  *items*  `The items to be used in the selection are entered here.`
 - *duration*  `Use this to set the animation duration.`
 - *curve*  `Use this to change the animation curve type.`
 - *itemExtent*  `Use this to specify the width of the items.`
 - *height*  `Use this to specify the height of the items.`
 - *indicatorColor*  `Use this to change the indicator color.`
 - *backgroundColor*  `Use this to change the background color.`
 - *radius*  `Use this to change the radius.`
 - *itemPadding*  `Use this to give padding to each of the items. This way you can leave space between items.`
 - *mainAxisSize*  `Use this to organize the space occupied by items horizontally.`
 - *animation*  `Use this to eliminate the animation transition altogether.`
 - *itemAlign*  `If you want to change where the items are aligned use this.`
 - *onChanged*  `This function is used to see the selected index.`