import 'bloc/complete_bloc.dart';
import 'models/complete_model.dart';
import 'package:flutter/material.dart';
import 'package:kelvin_s_application1/core/app_export.dart';
import 'package:kelvin_s_application1/widgets/custom_elevated_button.dart';

class CompleteScreen extends StatelessWidget {
  const CompleteScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<CompleteBloc>(
        create: (context) =>
            CompleteBloc(CompleteState(completeModelObj: CompleteModel()))
              ..add(CompleteInitialEvent()),
        child: CompleteScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompleteBloc, CompleteState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgCheckmark,
                            height: 97.v,
                            width: 87.h),
                        SizedBox(height: 39.v),
                        Container(
                            width: 279.h,
                            margin: EdgeInsets.only(left: 33.h, right: 31.h),
                            child: Text("msg_order_completed".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: CustomTextStyles.bodyLargeGray500
                                    .copyWith(height: 1.50))),
                        SizedBox(height: 53.v),
                        CustomElevatedButton(
                            text: "lbl_my_order".tr,
                            onPressed: () {
                              onTapMyOrder(context);
                            }),
                        SizedBox(height: 5.v)
                      ]))));
    });
  }

  /// Navigates to the trackingOrderScreen when the action is triggered.
  onTapMyOrder(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.trackingOrderScreen,
    );
  }
}
