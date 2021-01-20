import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import '../jsonmodels/taskresponse.dart';
import '../services/config.dart';

Future<TasksResponse> getAllTasks(String token) async {

  var res = await http.get("$API_URL/tasks",
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

  if (res.statusCode == 200 || res.statusCode == 401) {
    return TasksResponse.fromJson(jsonDecode(res.body));
  } else {
    throw Exception("Error Occured");
  }
}

Future<TasksResponse> getTask(String token, taskId) async {

  var res = await http.get("$API_URL/tasks/$taskId",
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

  if (res.statusCode == 200 || res.statusCode == 401) {
    return TasksResponse.fromJson(jsonDecode(res.body));
  } else {
    throw Exception("Error Occured");
  }
}

Future<TaskResponse> newTask(String token, data) async {
  var res = await http.post(
    "$API_URL/tasks",
    headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    body: data,
  );

  if (res.statusCode == 201 || res.statusCode == 422) {
    return TaskResponse.fromJson(jsonDecode(res.body));
  } else {
    throw Exception("Error Occured");
  }
}

Future<ModTaskResponse> editTask(String token, String taskId, data) async {
  var res = await http.put(
    "$API_URL/tasks/$taskId",
    headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    body: data,
  );

  if (res.statusCode == 200 || res.statusCode == 422) {
    return ModTaskResponse.fromJson(jsonDecode(res.body));
  } else {
    throw Exception("Error Occured");
  }
}


Future<ModTaskResponse> deleteThisTask(String token, String taskId) async {
  var res = await http.delete(
    "$API_URL/tasks/$taskId",
    headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
  );

  if (res.statusCode == 200 || res.statusCode == 404) {
    return ModTaskResponse.fromJson(jsonDecode(res.body));
  } else {
    throw Exception("Error Occured");
  }
}