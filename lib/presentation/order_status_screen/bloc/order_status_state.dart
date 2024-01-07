// ignore_for_file: must_be_immutable

part of 'order_status_bloc.dart';

/// Represents the state of OrderStatus in the application.
class OrderStatusState extends Equatable {
  OrderStatusState({
    this.sliderIndex = 0,
    this.orderStatusModelObj,
  });

  OrderStatusModel? orderStatusModelObj;

  int sliderIndex;

  @override
  List<Object?> get props => [
        sliderIndex,
        orderStatusModelObj,
      ];
  OrderStatusState copyWith({
    int? sliderIndex,
    OrderStatusModel? orderStatusModelObj,
  }) {
    return OrderStatusState(
      sliderIndex: sliderIndex ?? this.sliderIndex,
      orderStatusModelObj: orderStatusModelObj ?? this.orderStatusModelObj,
    );
  }
}
