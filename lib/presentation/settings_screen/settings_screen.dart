import 'bloc/settings_bloc.dart';
import 'models/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:kelvin_s_application1/core/app_export.dart';
import 'package:kelvin_s_application1/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:kelvin_s_application1/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:kelvin_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:kelvin_s_application1/widgets/custom_switch.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SettingsBloc>(
        create: (context) =>
            SettingsBloc(SettingsState(settingsModelObj: SettingsModel()))
              ..add(SettingsInitialEvent()),
        child: SettingsScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.v),
                child: Column(children: [
                  _buildFrame1(context),
                  SizedBox(height: 26.v),
                  _buildFrame6(context),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 56.h,
        leading: AppbarLeadingIconbuttonOne(
            imagePath: ImageConstant.imgArrowDown,
            margin: EdgeInsets.only(left: 16.h, top: 5.v, bottom: 5.v),
            onTap: () {
              onTapArrowDown(context);
            }),
        centerTitle: true,
        title: AppbarSubtitleOne(text: "lbl_settings".tr));
  }

  /// Section Widget
  Widget _buildFrame1(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.h),
        decoration: AppDecoration.fillGray
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomImageView(
              imagePath: ImageConstant.imgEllipse45,
              height: 64.adaptSize,
              width: 64.adaptSize,
              radius: BorderRadius.circular(32.h)),
          Padding(
              padding: EdgeInsets.only(left: 16.h, top: 6.v, bottom: 6.v),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("lbl_anne_christion".tr,
                        style: CustomTextStyles.bodyLarge18),
                    SizedBox(height: 3.v),
                    Text("lbl_premium_user".tr,
                        style: CustomTextStyles.bodyMediumGray500_1)
                  ])),
          Spacer(),
          CustomImageView(
              imagePath: ImageConstant.imgArrowRight,
              height: 16.adaptSize,
              width: 16.adaptSize,
              margin: EdgeInsets.symmetric(vertical: 24.v))
        ]));
  }

  /// Section Widget
  Widget _buildFrame6(BuildContext context) {
    return Column(children: [
      Align(
          alignment: Alignment.centerLeft,
          child: Text("lbl_settings".tr, style: theme.textTheme.titleMedium)),
      SizedBox(height: 9.v),
      GestureDetector(
          onTap: () {
            onTapFrame(context);
          },
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 11.v),
              decoration: AppDecoration.fillGray
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgNotificationsActive,
                    height: 24.adaptSize,
                    width: 24.adaptSize),
                Padding(
                    padding: EdgeInsets.only(left: 24.h),
                    child: Text("lbl_notifications".tr,
                        style: theme.textTheme.bodyLarge)),
                Spacer(),
                BlocSelector<SettingsBloc, SettingsState, bool?>(
                    selector: (state) => state.isSelectedSwitch,
                    builder: (context, isSelectedSwitch) {
                      return CustomSwitch(
                          margin: EdgeInsets.symmetric(vertical: 4.v),
                          value: isSelectedSwitch,
                          onChange: (value) {
                            context
                                .read<SettingsBloc>()
                                .add(ChangeSwitchEvent(value: value));
                          });
                    })
              ]))),
      SizedBox(height: 16.v),
      _buildFrame(context,
          timer: ImageConstant.imgTimeline,
          orderStatus: "lbl_tracking_order".tr, onTapFrame: () {
        onTapFrame1(context);
      }),
      SizedBox(height: 16.v),
      _buildFrame(context,
          timer: ImageConstant.imgTimer,
          orderStatus: "lbl_order_status".tr, onTapFrame: () {
        onTapFrame2(context);
      }),
      SizedBox(height: 16.v),
      _buildFrame(context,
          timer: ImageConstant.imgTranslate, orderStatus: "lbl_language".tr),
      SizedBox(height: 16.v),
      _buildFrame(context,
          timer: ImageConstant.imgQuestionAnswer, orderStatus: "lbl_faqs".tr)
    ]);
  }

  /// Common widget
  Widget _buildFrame(
    BuildContext context, {
    required String timer,
    required String orderStatus,
    Function? onTapFrame,
  }) {
    return GestureDetector(
        onTap: () {
          onTapFrame!.call();
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 11.v),
            decoration: AppDecoration.fillGray
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomImageView(
                  imagePath: timer, height: 24.adaptSize, width: 24.adaptSize),
              Padding(
                  padding: EdgeInsets.only(left: 24.h),
                  child: Text(orderStatus,
                      style: theme.textTheme.bodyLarge!
                          .copyWith(color: theme.colorScheme.primary))),
              Spacer(),
              CustomImageView(
                  imagePath: ImageConstant.imgArrowRight,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                  margin: EdgeInsets.symmetric(vertical: 4.v))
            ])));
  }

  /// Navigates to the previous screen.
  onTapArrowDown(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the notificationScreen when the action is triggered.
  onTapFrame(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.notificationScreen,
    );
  }

  /// Navigates to the trackingOrderScreen when the action is triggered.
  onTapFrame1(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.trackingOrderScreen,
    );
  }

  /// Navigates to the orderStatusScreen when the action is triggered.
  onTapFrame2(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.orderStatusScreen,
    );
  }
}
