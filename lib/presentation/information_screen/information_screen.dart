import 'bloc/information_bloc.dart';
import 'models/information_model.dart';
import 'package:flutter/material.dart';
import 'package:kelvin_s_application1/core/app_export.dart';
import 'package:kelvin_s_application1/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:kelvin_s_application1/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:kelvin_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:kelvin_s_application1/widgets/custom_elevated_button.dart';
import 'package:kelvin_s_application1/widgets/custom_icon_button.dart';
import 'package:kelvin_s_application1/widgets/custom_text_form_field.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    var arg =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return BlocProvider<InformationBloc>(
        create: (context) => InformationBloc(InformationState(
            informationModelObj: InformationModel(),
            id: arg[NavigationArgs.id]))
          ..add(InformationInitialEvent()),
        child: InformationScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.v),
                child: Column(children: [
                  SizedBox(
                      height: 105.v,
                      width: 92.h,
                      child:
                          Stack(alignment: Alignment.bottomCenter, children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgEllipse5,
                            height: 91.v,
                            width: 92.h,
                            radius: BorderRadius.circular(46.h),
                            alignment: Alignment.topCenter),
                        CustomIconButton(
                            height: 30.adaptSize,
                            width: 30.adaptSize,
                            padding: EdgeInsets.all(7.h),
                            decoration: IconButtonStyleHelper.outlineWhiteA,
                            alignment: Alignment.bottomCenter,
                            onTap: () {
                              onTapBtnIcon(context);
                            },
                            child: CustomImageView(
                                imagePath: ImageConstant.imgIconWhiteA700))
                      ])),
                  SizedBox(height: 5.v),
                  Text("lbl_anne_christion".tr,
                      style: theme.textTheme.titleLarge),
                  SizedBox(height: 1.v),
                  Text("lbl_xyz_gmail_com".tr,
                      style: CustomTextStyles.bodyMediumGray500_1),
                  SizedBox(height: 18.v),
                  _buildInputFieldWith(context),
                  SizedBox(height: 19.v),
                  _buildInputFieldWith1(context),
                  SizedBox(height: 19.v),
                  _buildInputFieldWith2(context),
                  SizedBox(height: 19.v),
                  _buildInputFieldWith3(context),
                  SizedBox(height: 8.v)
                ])),
            bottomNavigationBar: _buildComplete(context)));
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
        title: AppbarSubtitleOne(text: "lbl_information".tr));
  }

  /// Section Widget
  Widget _buildInputFieldWith(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_account_name".tr, style: theme.textTheme.titleSmall),
      SizedBox(height: 8.v),
      BlocSelector<InformationBloc, InformationState, TextEditingController?>(
          selector: (state) => state.nameController,
          builder: (context, nameController) {
            return CustomTextFormField(
                controller: nameController, hintText: "lbl_anne_christion".tr);
          })
    ]);
  }

  /// Section Widget
  Widget _buildInputFieldWith1(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_date_of_birth".tr, style: theme.textTheme.titleSmall),
      SizedBox(height: 8.v),
      BlocSelector<InformationBloc, InformationState, TextEditingController?>(
          selector: (state) => state.dateOfBirthController,
          builder: (context, dateOfBirthController) {
            return CustomTextFormField(
                controller: dateOfBirthController,
                hintText: "lbl_11_01_1997".tr);
          })
    ]);
  }

  /// Section Widget
  Widget _buildInputFieldWith2(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_address".tr, style: theme.textTheme.titleSmall),
      SizedBox(height: 8.v),
      BlocSelector<InformationBloc, InformationState, TextEditingController?>(
          selector: (state) => state.addressController,
          builder: (context, addressController) {
            return CustomTextFormField(
                controller: addressController,
                hintText: "msg_new_south_wales".tr);
          })
    ]);
  }

  /// Section Widget
  Widget _buildInputFieldWith3(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_mobile_number".tr, style: theme.textTheme.titleSmall),
      SizedBox(height: 8.v),
      BlocSelector<InformationBloc, InformationState, TextEditingController?>(
          selector: (state) => state.mobileNumberController,
          builder: (context, mobileNumberController) {
            return CustomTextFormField(
                controller: mobileNumberController,
                hintText: "lbl_9999_999_999".tr,
                textInputAction: TextInputAction.done);
          })
    ]);
  }

  /// Section Widget
  Widget _buildComplete(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_complete".tr,
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 44.v),
        onPressed: () {
          onTapComplete(context);
        });
  }

  /// Navigates to the previous screen.
  onTapArrowDown(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Requests permission to access the camera and storage, and displays a model
  /// sheet for selecting images.
  ///
  /// Throws an error if permission is denied or an error occurs while selecting images.
  onTapBtnIcon(BuildContext context) async {
    await PermissionManager.askForPermission(Permission.camera);
    await PermissionManager.askForPermission(Permission.storage);
    List<String?>? imageList = [];
    await FileManager().showModelSheetForImage(getImages: (value) async {
      imageList = value;
    });
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapComplete(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeContainerScreen,
    );
  }
}
