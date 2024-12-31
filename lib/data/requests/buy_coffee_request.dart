import 'package:json_annotation/json_annotation.dart';

part 'buy_coffee_request.g.dart';

@JsonSerializable()
class BuyCoffeeRequest {
  final String id;
  final int size;

  BuyCoffeeRequest({
    required this.id,
    required this.size,
  });

  factory BuyCoffeeRequest.fromJson(Map<String, dynamic> json) => _$BuyCoffeeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BuyCoffeeRequestToJson(this);
}