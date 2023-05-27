import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:opencontrol/widgets/on_tap_scale_and_fade.dart';

import '../constants/constants_colors.dart';

const double _kItemExtent = 32.0;

class CustomSelect extends StatefulWidget {
  final String hint;
  final TextAlign textAlign;
  final BorderRadius borderRadius;
  final List<String> items;
  final Function(int) onChanged;
  final Color baseColor;

  const CustomSelect({
    super.key,
    this.hint = "",
    required this.onChanged,
    required this.items,
    this.textAlign = TextAlign.start,
    this.baseColor = kPrimaryColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(22)),
  });

  @override
  State<CustomSelect> createState() => _CustomSelectState();
}

class _CustomSelectState extends State<CustomSelect> {
  Color currentColor = Colors.black12;

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    currentColor = widget.baseColor;
    selectedIndex = -1;
  }

  @override
  Widget build(BuildContext context) {
    return OnTapScaleAndFade(
      lowerBound: 0.95,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.baseColor,
          borderRadius: widget.borderRadius,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  selectedIndex >= 0 && widget.items.isNotEmpty
                      ? widget.items[selectedIndex]
                      : widget.hint,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              widget.items.isEmpty
                  ? const CupertinoActivityIndicator(
                      radius: 12,
                    )
                  : Icon(
                      CupertinoIcons.chevron_down,
                      size: 24,
                      color: Theme.of(context).textTheme.titleLarge!.color,
                    )
            ],
          ),
        ),
      ),
      onTap: () {
        if (widget.items.isNotEmpty) {
          showSelectDialog();
        }
      },
    );
  }

  void showSelectDialog() {
    FixedExtentScrollController extentScrollController =
        FixedExtentScrollController(
            initialItem: selectedIndex < 0 ? 0 : selectedIndex);
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 250,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: Theme.of(context).scaffoldBackgroundColor,
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: CupertinoPicker(
                  scrollController: extentScrollController,
                  magnification: 1.22,
                  squeeze: 1.2,
                  useMagnifier: false,
                  looping: false,
                  itemExtent: _kItemExtent,
                  // This is called when selected item is changed.
                  onSelectedItemChanged: (int selectedItem) {
                    SystemSound.play(SystemSoundType.click);
                    HapticFeedback.mediumImpact();
                  },
                  children:
                      List<Widget>.generate(widget.items.length, (int index) {
                    return Center(
                      child: Text(
                        widget.items[index],
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  }),
                ),
              ),
              CupertinoButton(
                child: Text(
                  'Выбрать',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                onPressed: () {
                  setState(() {
                    selectedIndex = extentScrollController.selectedItem;
                  });
                  widget.onChanged(selectedIndex);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
