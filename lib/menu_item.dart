import 'package:flutter/material.dart';
import 'constants.dart';
import 'list_item_model.dart';

class SideBarItem extends StatelessWidget {
  const SideBarItem(
    this.toolbarItem, {
    Key? key,
    required this.height,
    required this.scrollScale,
    this.isLongPressed = false,
    this.isSelected = false,
    this.moveOnLongPress = false,
    this.gutter = 10,
    this.toolbarWidth,
    this.itemsOffset,
    this.itemPadding = 12,
    this.onItemSelect,
  }) : super(key: key);

  final ListItemModel toolbarItem;
  final double height;
  final double scrollScale;
  final bool isLongPressed;
  final bool isSelected;
  final bool moveOnLongPress;
  final double gutter;
  final double? toolbarWidth;
  final double? itemsOffset;
  final double itemPadding;
  final VoidCallback? onItemSelect;

  @override
  Widget build(BuildContext context) {
    return Align(
      key: ValueKey(toolbarItem.title),
      alignment: AlignmentDirectional.centerStart,
      child: GestureDetector(
        onTap: () {
          toolbarItem.onTap?.call();
          onItemSelect?.call();
        },
        child: SizedBox(
          height: height + gutter + (isLongPressed ? 10 : 0),
          // width: Constants.toolbarWidth,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedScale(
                duration: Constants.scrollScaleAnimationDuration,
                curve: Constants.scrollScaleAnimationCurve,
                scale: scrollScale,
                child: AnimatedContainer(
                  duration: Constants.longPressAnimationDuration,
                  curve: Constants.scrollScaleAnimationCurve,
                  height: height + (isLongPressed ? 10 : 0),
                  width: isLongPressed ? toolbarWidth! * 3 : height,
                  decoration: BoxDecoration(
                    color: isSelected && toolbarItem.selectedColor != null
                        ? toolbarItem.selectedColor
                        : toolbarItem.color,
                    borderRadius: toolbarItem.borderRadius,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  margin: EdgeInsetsDirectional.only(
                    // bottom: gutter,
                    start: moveOnLongPress && isLongPressed ? itemsOffset! : 0,
                  ),
                ),
              ),
              Positioned.fill(
                child: AnimatedPadding(
                  duration: Constants.longPressAnimationDuration,
                  curve: Constants.longPressAnimationCurve,
                  padding: EdgeInsetsDirectional.only(
                    // bottom: gutter,
                    start:
                        (moveOnLongPress && isLongPressed ? itemsOffset! : 0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: AnimatedScale(
                            scale: scrollScale,
                            duration: Constants.scrollScaleAnimationDuration,
                            curve: Constants.scrollScaleAnimationCurve,
                            child: toolbarItem.icon,
                          ),
                        ),
                      ),
                      Flexible(
                        child: AnimatedAlign(
                          duration: Constants.longPressAnimationDuration,
                          alignment: AlignmentDirectional.centerEnd,
                          widthFactor: isLongPressed ? 1 : 0,
                          child: AnimatedOpacity(
                            opacity: isLongPressed ? 1 : 0,
                            duration: Constants.longPressAnimationDuration,
                            curve: Constants.longPressAnimationCurve,
                            child: Text(
                              toolbarItem.title,
                              style: isSelected &&
                                      toolbarItem.selectedTextStyle != null
                                  ? toolbarItem.selectedTextStyle
                                  : toolbarItem.textStyle ??
                                      const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
