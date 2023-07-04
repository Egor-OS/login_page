import 'package:flutter/material.dart';
import 'package:training_and_testing/theme/app_colors.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({
    required this.value,
    required this.onChanged,
    this.thumbPadding = 2,
    this.disabled = false,
    this.activeColors,
    this.inactiveColors,
    super.key,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;
  final double thumbPadding;
  final bool disabled;
  final SwitchColors? activeColors;
  final SwitchColors? inactiveColors;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  //
  late Animation<Alignment> _circleAnimation;
  late AnimationController _animationController;
  //
  late SwitchColors activeColors;
  late SwitchColors inactiveColors;
  late SwitchColors disabledInactiveColors;
  late SwitchColors disabledActiveColors;
  //
  bool get disabled => (widget.onChanged == null) || widget.disabled;

  @override
  void initState() {
    super.initState();
    //
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    //
    _circleAnimation = AlignmentTween(
      begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
      end: widget.value ? Alignment.centerLeft : Alignment.centerRight,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );
  }

  @override
  void didChangeDependencies() {
    // set colors
    activeColors = widget.activeColors ?? _activeColors();
    inactiveColors = widget.inactiveColors ?? _inactiveColors();
    disabledActiveColors = _disabledActiveColors();
    disabledInactiveColors = _disabledInactiveColors();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    !widget.value
        ? _animationController.reverse()
        : _animationController.forward();

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (widget.onChanged != null && !disabled) {
              if (_animationController.isCompleted) {
                widget.onChanged!(false);
              } else {
                widget.onChanged!(true);
              }
            }
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: _circleAnimation.value.x > Alignment.center.x
                  ? disabled
                      ? disabledActiveColors.track
                      : activeColors.track
                  : disabled
                      ? disabledInactiveColors.track
                      : inactiveColors.track,
            ),
            child: Padding(
              padding: EdgeInsets.all(widget.thumbPadding),
              child: Container(
                alignment: _circleAnimation.value,
                child: LayoutBuilder(
                  builder: (context, constraints) => Container(
                    width: constraints.maxHeight,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _circleAnimation.value.x > Alignment.center.x
                          ? disabled
                              ? disabledActiveColors.thumb
                              : activeColors.thumb
                          : disabled
                              ? disabledInactiveColors.thumb
                              : inactiveColors.thumb,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // default colors
  final _disabledOpacity = 0.4;

  SwitchColors _activeColors() {
    return SwitchColors(
      Theme.of(context).colorScheme.white,
      Theme.of(context).colorScheme.blue50,
    );
  }

  SwitchColors _inactiveColors() {
    return SwitchColors(
      Theme.of(context).colorScheme.grey10.withOpacity(0.5),
      Theme.of(context).colorScheme.grey50,
    );
  }

  SwitchColors _disabledActiveColors() {
    return SwitchColors(
      activeColors.thumb.withOpacity(_disabledOpacity),
      activeColors.track.withOpacity(_disabledOpacity),
    );
  }

  SwitchColors _disabledInactiveColors() {
    return SwitchColors(
      inactiveColors.thumb.withOpacity(_disabledOpacity),
      inactiveColors.track.withOpacity(_disabledOpacity),
    );
  }
}

class SwitchColors {
  SwitchColors(this.thumb, this.track);

  final Color thumb;
  final Color track;
}
