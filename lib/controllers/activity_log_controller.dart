import 'dart:async';
import 'dart:convert';

import 'package:jane_solution/controllers/api_controller.dart';
import 'package:jane_solution/models/activity_log_model.dart';

Future<ActivityLogModel> activityLogController(
    {required String fromDate, required String toDate, required int page, required String category}) async {
  var response = await ApiController().getApiResponse(
    url: fromDate == ''
        ? 'api/partner/activity-logs/get-activity-logs?page=$page&category=$category'
        : 'api/partner/activity-logs/get-activity-logs?fromDate=$fromDate&toDate=$toDate&page=$page&category=$category',
    method: 'get',
  );
  return ActivityLogModel.fromJson(jsonDecode(response.body));
}
