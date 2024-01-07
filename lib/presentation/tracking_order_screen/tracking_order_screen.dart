import 'bloc/tracking_order_bloc.dart';
import 'dart:async';
import 'models/tracking_order_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kelvin_s_application1/core/app_export.dart';
import 'package:kelvin_s_application1/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:kelvin_s_application1/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:kelvin_s_application1/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class TrackingOrderScreen extends StatelessWidget {
  TrackingOrderScreen({Key? key}) : super(key: key);

  Completer<GoogleMapController> googleMapController = Completer();

  Completer<GoogleMapController> googleMapController1 = Completer();

  static Widget builder(BuildContext context) {
    return BlocProvider<TrackingOrderBloc>(
        create: (context) => TrackingOrderBloc(
            TrackingOrderState(trackingOrderModelObj: TrackingOrderModel()))
          ..add(TrackingOrderInitialEvent()),
        child: TrackingOrderScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackingOrderBloc, TrackingOrderState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: SizedBox(
                  width: double.maxFinite,
                  child: SizedBox(
                      height: 768.v,
                      width: double.maxFinite,
                      child: Stack(alignment: Alignment.topCenter, children: [
                        _buildMapImage(context),
                        _buildAppBar(context),
                        _buildMap(context)
                      ])))));
    });
  }

  /// Section Widget
  Widget _buildMapImage(BuildContext context) {
    return SizedBox(
        height: 768.v,
        width: double.maxFinite,
        child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
                target: LatLng(37.43296265331129, -122.08832357078792),
                zoom: 14.4746),
            onMapCreated: (GoogleMapController controller) {
              googleMapController.complete(controller);
            },
            zoomControlsEnabled: false,
            zoomGesturesEnabled: false,
            myLocationButtonEnabled: false,
            myLocationEnabled: false));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 69.v,
        leadingWidth: 56.h,
        leading: AppbarLeadingIconbuttonOne(
            imagePath: ImageConstant.imgArrowDown,
            margin: EdgeInsets.only(left: 16.h, top: 5.v, bottom: 24.v),
            onTap: () {
              onTapArrowDown(context);
            }),
        centerTitle: true,
        title: AppbarSubtitleOne(text: "lbl_tracking_order".tr),
        styleType: Style.bgShadow);
  }

  /// Section Widget
  Widget _buildMap(BuildContext context) {
    return Container(
        height: 455.v,
        width: 343.h,
        margin: EdgeInsets.only(bottom: 68.v),
        child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
                target: LatLng(37.43296265331129, -122.08832357078792),
                zoom: 14.4746),
            onMapCreated: (GoogleMapController controller) {
              googleMapController1.complete(controller);
            },
            zoomControlsEnabled: false,
            zoomGesturesEnabled: false,
            myLocationButtonEnabled: false,
            myLocationEnabled: false));
  }

  /// Navigates to the previous screen.
  onTapArrowDown(BuildContext context) {
    NavigatorService.goBack();
  }
}
