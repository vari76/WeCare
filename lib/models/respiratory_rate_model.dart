// To parse this JSON data, do
//
//     final respiratoryRateModel = respiratoryRateModelFromJson(jsonString);

import 'dart:convert';

RespiratoryRateModel respiratoryRateModelFromJson(String str) =>
    RespiratoryRateModel.fromJson(json.decode(str));

String respiratoryRateModelToJson(RespiratoryRateModel data) =>
    json.encode(data.toJson());

class RespiratoryRateModel {
  RespiratoryRateModel({
    this.id,
    this.patientId,
    this.category,
    this.date,
    this.nurseName,
    this.readings,
    this.v,
  });

  String? id;
  String? patientId;
  String? category;
  DateTime? date;
  String? nurseName;
  Readings? readings;
  int? v;

  factory RespiratoryRateModel.fromJson(Map<String, dynamic> json) =>
      RespiratoryRateModel(
        id: json["_id"],
        patientId: json["patient_id"],
        category: json["category"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        nurseName: json["nurse_name"],
        readings: json["readings"] == null
            ? null
            : Readings.fromJson(json["readings"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "patient_id": patientId,
        "category": category,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "nurse_name": nurseName,
        "readings": readings?.toJson(),
        "__v": v,
      };
}

class Readings {
  Readings({
    this.bpm,
  });

  int? bpm;

  factory Readings.fromJson(Map<String, dynamic> json) => Readings(
        bpm: json["bpm"],
      );

  Map<String, dynamic> toJson() => {
        "bpm": bpm,
      };
}