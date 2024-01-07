import '../social_account_link_screen/widgets/socialaccountlink_item_widget.dart';
import 'bloc/social_account_link_bloc.dart';
import 'models/social_account_link_model.dart';
import 'models/socialaccountlink_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kelvin_s_application1/core/app_export.dart';
import 'package:kelvin_s_application1/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:kelvin_s_application1/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:kelvin_s_application1/widgets/app_bar/custom_app_bar.dart';

class SocialAccountLinkScreen extends StatelessWidget {
  const SocialAccountLinkScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SocialAccountLinkBloc>(
        create: (context) => SocialAccountLinkBloc(SocialAccountLinkState(
            socialAccountLinkModelObj: SocialAccountLinkModel()))
          ..add(SocialAccountLinkInitialEvent()),
        child: SocialAccountLinkScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Padding(
                padding: EdgeInsets.only(left: 16.h, top: 24.v, right: 16.h),
                child: BlocSelector<SocialAccountLinkBloc,
                        SocialAccountLinkState, SocialAccountLinkModel?>(
                    selector: (state) => state.socialAccountLinkModelObj,
                    builder: (context, socialAccountLinkModelObj) {
                      return ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 16.v);
                          },
                          itemCount: socialAccountLinkModelObj
                                  ?.socialaccountlinkItemList.length ??
                              0,
                          itemBuilder: (context, index) {
                            SocialaccountlinkItemModel model =
                                socialAccountLinkModelObj
                                        ?.socialaccountlinkItemList[index] ??
                                    SocialaccountlinkItemModel();
                            return SocialaccountlinkItemWidget(model);
                          });
                    }))));
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
        title: AppbarSubtitleOne(text: "lbl_social_network".tr));
  }

  /// Navigates to the previous screen.
  onTapArrowDown(BuildContext context) {
    NavigatorService.goBack();
  }
}
