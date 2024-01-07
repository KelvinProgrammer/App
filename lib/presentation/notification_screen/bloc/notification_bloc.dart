import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/today_item_model.dart';
import 'package:kelvin_s_application1/presentation/notification_screen/models/notification_model.dart';
part 'notification_event.dart';
part 'notification_state.dart';

/// A bloc that manages the state of a Notification according to the event that is dispatched to it.
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc(NotificationState initialState) : super(initialState) {
    on<NotificationInitialEvent>(_onInitialize);
  }

  _onInitialize(
    NotificationInitialEvent event,
    Emitter<NotificationState> emit,
  ) async {
    emit(state.copyWith(
        notificationModelObj: state.notificationModelObj
            ?.copyWith(todayItemList: fillTodayItemList())));
  }

  List<TodayItemModel> fillTodayItemList() {
    return [
      TodayItemModel(groupBy: "Today"),
      TodayItemModel(groupBy: "Today"),
      TodayItemModel(groupBy: "Today"),
      TodayItemModel(groupBy: "Yesterday"),
      TodayItemModel(groupBy: "Yesterday"),
      TodayItemModel(groupBy: "Yesterday")
    ];
  }
}
