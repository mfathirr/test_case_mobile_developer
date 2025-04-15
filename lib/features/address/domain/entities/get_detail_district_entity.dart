import 'package:equatable/equatable.dart';

class GetDetailDistrictEntity extends Equatable {
  final int districtId;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final String districtName;
  final int province;

  const GetDetailDistrictEntity({
    required this.districtId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.districtName,
    required this.province,
  });

  @override
  List<Object?> get props => [
        districtId,
        createdAt,
        updatedAt,
        deletedAt,
        districtName,
        province,
      ];
}
