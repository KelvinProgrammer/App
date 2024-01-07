import 'bloc/onbording_one_bloc.dart';
import 'models/onbording_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kelvin_s_application1/core/app_export.dart';
import 'package:kelvin_s_application1/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:kelvin_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:kelvin_s_application1/widgets/custom_icon_button.dart';

class OnbordingOneScreen extends StatelessWidget {
  const OnbordingOneScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<OnbordingOneBloc>(
        create: (context) => OnbordingOneBloc(
            OnbordingOneState(onbordingOneModelObj: OnbordingOneModel()))
          ..add(OnbordingOneInitialEvent()),
        child: OnbordingOneScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnbordingOneBloc, OnbordingOneState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              extendBody: true,
              extendBodyBehindAppBar: true,
              body: Container(
                  width: SizeUtils.width,
                  height: SizeUtils.height,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ImageConstant.imgOnbordingOne),
                          fit: BoxFit.cover)),
                  child: SizedBox(
                      width: double.maxFinite,
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 13.v),
                          decoration: AppDecoration.gradientPrimaryToPrimary,
                          child: Column(children: [
                            _buildAppBar(context),
                            Spacer(),
                            Text("lbl_cool_product".tr,
                                style: theme.textTheme.headlineSmall),
                            SizedBox(height: 10.v),
                            Container(
                                width: 287.h,
                                margin: EdgeInsets.symmetric(horizontal: 44.h),
                                child: Text("msg_we_create_products".tr,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyles.bodyMediumWhiteA700
                                        .copyWith(height: 1.50))),
                            SizedBox(height: 38.v),
                            CustomIconButton(
                                height: 60.adaptSize,
                                width: 60.adaptSize,
                                padding: EdgeInsets.all(18.h),
                                decoration: IconButtonStyleHelper.fillWhiteA,
                                onTap: () {
                                  onTapBtnArrowDown(context);
                                },
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgArrowDown)),
                            SizedBox(height: 46.v)
                          ]))))));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(height: 27.v, actions: [
      AppbarSubtitleTwo(
          text: "lbl_skip".tr,
          margin: EdgeInsets.symmetric(horizontal: 16.h),
          onTap: () {
            onTapSkip(context);
          })
    ]);
  }

  /// Navigates to the signUpSignInScreen when the action is triggered.
  onTapSkip(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signUpSignInScreen,
    );
  }

  /// Navigates to the onbordingTwoScreen when the action is triggered.
  onTapBtnArrowDown(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.onbordingTwoScreen,
    );
  }
}
