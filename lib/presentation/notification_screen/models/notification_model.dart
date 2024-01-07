// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'today_item_model.dart';

/// This class defines the variables used in the [notification_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class NotificationModel extends Equatable {
  NotificationModel({this.todayItemList = const []}) {}

  List<TodayItemModel> todayItemList;

  NotificationModel copyWith({List<TodayItemModel>? todayItemList}) {
    return NotificationModel(
      todayItemList: todayItemList ?? this.todayItemList,
    );
  }

  @override
  List<Object?> get props => [todayItemList];
}
