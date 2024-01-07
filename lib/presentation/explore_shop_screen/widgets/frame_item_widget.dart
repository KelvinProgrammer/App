import '../models/frame_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kelvin_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class FrameItemWidget extends StatelessWidget {
  FrameItemWidget(
    this.frameItemModelObj, {
    Key? key,
    this.onSelectedChipView,
  }) : super(
          key: key,
        );

  FrameItemModel frameItemModelObj;

  Function(bool)? onSelectedChipView;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 8.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        frameItemModelObj.tabs!,
        style: TextStyle(
          color: (frameItemModelObj.isSelected ?? false)
              ? appTheme.whiteA700
              : theme.colorScheme.primary,
          fontSize: 14.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
      ),
      selected: (frameItemModelObj.isSelected ?? false),
      backgroundColor: appTheme.gray200,
      selectedColor: theme.colorScheme.primary,
      shape: (frameItemModelObj.isSelected ?? false)
          ? RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(
                18.h,
              ),
            )
          : RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(
                18.h,
              ),
            ),
      onSelected: (value) {
        onSelectedChipView?.call(value);
      },
    );
  }
}
