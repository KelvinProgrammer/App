import '../explore_shop_screen/widgets/frame_item_widget.dart';
import 'bloc/explore_shop_bloc.dart';
import 'models/explore_shop_model.dart';
import 'models/frame_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kelvin_s_application1/core/app_export.dart';
import 'package:kelvin_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:kelvin_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:kelvin_s_application1/widgets/custom_elevated_button.dart';

class ExploreShopScreen extends StatelessWidget {
  const ExploreShopScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<ExploreShopBloc>(
      create: (context) => ExploreShopBloc(ExploreShopState(
        exploreShopModelObj: ExploreShopModel(),
      ))
        ..add(ExploreShopInitialEvent()),
      child: ExploreShopScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 8.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 304.h,
                margin: EdgeInsets.only(right: 38.h),
                child: Text(
                  "msg_choose_which_you".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    height: 1.50,
                  ),
                ),
              ),
              SizedBox(height: 28.v),
              _buildFrame(context),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildExploreShop(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 86.v,
      title: AppbarTitle(
        text: "msg_what_products_you".tr,
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return BlocSelector<ExploreShopBloc, ExploreShopState, ExploreShopModel?>(
      selector: (state) => state.exploreShopModelObj,
      builder: (context, exploreShopModelObj) {
        return Wrap(
          runSpacing: 12.v,
          spacing: 12.h,
          children: List<Widget>.generate(
            exploreShopModelObj?.frameItemList.length ?? 0,
            (index) {
              FrameItemModel model =
                  exploreShopModelObj?.frameItemList[index] ?? FrameItemModel();

              return FrameItemWidget(
                model,
                onSelectedChipView: (value) {
                  context.read<ExploreShopBloc>().add(
                      UpdateChipViewEvent(index: index, isSelected: value));
                },
              );
            },
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildExploreShop(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_explore_shop".tr,
      margin: EdgeInsets.only(
        left: 16.h,
        right: 16.h,
        bottom: 36.v,
      ),
    );
  }
}
