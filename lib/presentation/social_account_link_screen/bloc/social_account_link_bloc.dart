import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/socialaccountlink_item_model.dart';
import 'package:kelvin_s_application1/presentation/social_account_link_screen/models/social_account_link_model.dart';
part 'social_account_link_event.dart';
part 'social_account_link_state.dart';

/// A bloc that manages the state of a SocialAccountLink according to the event that is dispatched to it.
class SocialAccountLinkBloc
    extends Bloc<SocialAccountLinkEvent, SocialAccountLinkState> {
  SocialAccountLinkBloc(SocialAccountLinkState initialState)
      : super(initialState) {
    on<SocialAccountLinkInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SocialAccountLinkInitialEvent event,
    Emitter<SocialAccountLinkState> emit,
  ) async {
    emit(state.copyWith(
        socialAccountLinkModelObj: state.socialAccountLinkModelObj?.copyWith(
            socialaccountlinkItemList:
                fillSocialaccountlinkItemList()))); // TODO: implement Actions
  }

  List<SocialaccountlinkItemModel> fillSocialaccountlinkItemList() {
    return [
      SocialaccountlinkItemModel(
          facebook: ImageConstant.imgLogosFacebook,
          facebook1: "Facebook",
          welcomeToFacebook: "Welcome to Facebook",
          facebook2: ImageConstant.imgGroup1198),
      SocialaccountlinkItemModel(
          facebook: ImageConstant.imgGroup1194,
          facebook1: "Instagram",
          welcomeToFacebook: "Welcome to Instagram",
          facebook2: ImageConstant.imgGroup1198),
      SocialaccountlinkItemModel(
          facebook: ImageConstant.imgLogosTwitter,
          facebook1: "Twitter",
          welcomeToFacebook: "Welcome to Twitter",
          facebook2: ImageConstant.imgGroup1198Red800),
      SocialaccountlinkItemModel(
          facebook: ImageConstant.imgGoogle,
          facebook1: "Google",
          welcomeToFacebook: "Welcome to Google",
          facebook2: ImageConstant.imgGroup1198)
    ];
  }
}
