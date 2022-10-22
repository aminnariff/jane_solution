class ActivityLogModel {
  String fromDate;
  String toDate;
  String category;
  Data data;

  ActivityLogModel({
    required this.fromDate,
    required this.toDate,
    required this.category,
    required this.data,
  });

  factory ActivityLogModel.fromJson(Map<String, dynamic> json) {
    return ActivityLogModel(
      fromDate: json['fromDate'],
      toDate: json['toDate'],
      category: json['category'],
      data: Data.fromJson(json["data"]),
    );
  }
}

class Data {
  Data({
    required this.currentPage,
    required this.lastPage,
    required this.activityData,
    required this.total,
  });

  int currentPage;
  int lastPage;
  List<ActivityData> activityData;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json['current_page'],
        lastPage: json['last_page'],
        activityData: List<ActivityData>.from(
            json["data"].map((x) => ActivityData.fromJson(x))),
        total: json['total'],
      );
}

class ActivityData {
  ActivityData({
    required this.id,
    required this.portInOrderId,
    required this.category,
    required this.msisdn,
    required this.createdAt,
    required this.number,
    required this.amount,
    required this.fullName,
    required this.identityNumber,
    required this.status,
    this.iccid,
    this.serviceProvider,
    this.tuneTalkStatus,
    this.isResubmittable,
    this.remark,
  });

  int id;
  int? portInOrderId;
  String category;
  List msisdn;
  String createdAt;
  String status;
  List? iccid;
  String? serviceProvider;
  String? number;
  String? amount;
  String? fullName;
  String? identityNumber;
  String? tuneTalkStatus;
  bool? isResubmittable;
  String? remark;

  factory ActivityData.fromJson(Map<String, dynamic> json) => ActivityData(
        id: json['id'],
        portInOrderId: json['port_in_order_id'],
        category: json['category'],
        msisdn: json['msisdn'],
        createdAt: json['created_at'],
        status: json['status'],
        tuneTalkStatus: json['tune_talk_status'],
        iccid: json['iccid'],
        serviceProvider: json['service_provider'],
        number: json['number'],
        amount: json['amount'],
        fullName: json['full_name'],
        identityNumber: json['identity_number'],
        isResubmittable: json['is_resubmittable'],
        remark: json['remark'],
      );
}
