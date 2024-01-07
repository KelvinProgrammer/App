// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'socialaccountlink_item_model.dart';

/// This class defines the variables used in the [social_account_link_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SocialAccountLinkModel extends Equatable {
  SocialAccountLinkModel({this.socialaccountlinkItemList = const []}) {}

  List<SocialaccountlinkItemModel> socialaccountlinkItemList;

  SocialAccountLinkModel copyWith(
      {List<SocialaccountlinkItemModel>? socialaccountlinkItemList}) {
    return SocialAccountLinkModel(
      socialaccountlinkItemList:
          socialaccountlinkItemList ?? this.socialaccountlinkItemList,
    );
  }

  @override
  List<Object?> get props => [socialaccountlinkItemList];
}
