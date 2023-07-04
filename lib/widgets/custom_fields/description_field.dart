import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/constants/app_icons.dart';
import 'package:training_and_testing/constants/app_styles.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/utils/extensions/extensions.dart';
import 'package:training_and_testing/widgets/svg_asset.dart';

class DropDownTextWidget extends StatefulWidget {
  const DropDownTextWidget({
    required this.title,
    required this.description,
    super.key,
  });

  final String title;
  final String description;

  @override
  State<DropDownTextWidget> createState() => _DropDownTextWidgetState();
}

class _DropDownTextWidgetState extends State<DropDownTextWidget>
    with TickerProviderStateMixin {
  String get title => widget.title;
  String get description => widget.description;
  bool get isOpened => _controller.isCompleted;

  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    //
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

    //
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
      reverseCurve: Curves.fastOutSlowIn,
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyL.semibold,
          ),
        ),
        if (isOpened)
          SvgAsset(
            assetName: AppIcons.chevronUp,
            color: Theme.of(context).colorScheme.white,
          )
        else
          SvgAsset(
            assetName: AppIcons.chevronDown,
            color: Theme.of(context).colorScheme.white.withOpacity(0.4),
          ),
      ],
    ).paddingSymmetric(vertical: padding16);
  }

  Widget _buildDescription() {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height / 2,
      ),
      child: SingleChildScrollView(
        child: SizeTransition(
          axisAlignment: 1,
          sizeFactor: _animation,
          child: SizedBox(
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.only(bottom: padding24),
              child: Text(
                description,
                style: Theme.of(context).textTheme.bodyM.light,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Border _buildBorder() {
    return Border(
      bottom: BorderSide(
        color: isOpened && !_controller.isAnimating
            ? Theme.of(context).colorScheme.grey10
            : Theme.of(context).colorScheme.white.withOpacity(0.4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => setState(() {
            !isOpened
                ? _controller.forward().whenComplete(() => setState(() {}))
                : _controller.reverse();
          }),
          child: DecoratedBox(
            decoration: BoxDecoration(border: _buildBorder()),
            child: Column(
              children: [
                _buildHeader(),
                _buildDescription(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
