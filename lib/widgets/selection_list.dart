import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class SelectionListWidget extends StatefulWidget {
  const SelectionListWidget({
    required this.options,
    this.titleButton,
    this.applyCallback,
    this.initialIndex,
    super.key,
  });

  final Map<int, String> options;

  final void Function(int?)? applyCallback;

  final int? initialIndex;

  final String? titleButton;

  @override
  State<SelectionListWidget> createState() => _SelectionListWidgetState();
}

class _SelectionListWidgetState extends State<SelectionListWidget> {
  Map<int, String> get options => widget.options;

  String get titleButton => widget.titleButton ?? 'Apply';

  late int? selectedIndex = widget.initialIndex;

  @override
  Widget build(BuildContext context) {
    final listKeys = options.keys.toList();
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: options.length,
              itemBuilder: (context, index) {
                return MenuItem(
                  title: '${options[listKeys[index]]}',
                  onPressed: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  isSelected: index == selectedIndex,
                );
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: padding16),
              child: BrandButton(
                padding: const EdgeInsets.symmetric(vertical: padding16),
                onPressed: (selectedIndex != null)
                    ? () => widget.applyCallback?.call(listKeys[selectedIndex!])
                    : null,
                child: Text(titleButton),
              ),
            ),
          )
        ],
      ),
    );
  }
}
