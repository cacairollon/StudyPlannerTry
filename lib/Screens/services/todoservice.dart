import 'dart:io';

import 'package:StudyPlanner/Screens/jsonmodels/todoresponse.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import '../jsonmodels/todoresponse.dart';
import '../services/config.dart';

Future<TodosResponse> taskTodos(String token, taskId) async {
  var res = await http.get("$API_URL/tasks/$taskId/todos",
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

  if (res.statusCode == 200 || res.statusCode == 401) {
    return TodosResponse.fromJson(jsonDecode(res.body));
  } else {
    throw Exception("Error Occured");
  }
}

Future<TodosResponse> getTodos(String token) async {

  var res = await http.get("$API_URL/todos",
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

  if (res.statusCode == 200 || res.statusCode == 401) {
    return TodosResponse.fromJson(jsonDecode(res.body));
  } else {
    throw Exception("Error Occured");
  }
}

Future<TodosResponse> getThisTodo(String token, todoId) async {

  var res = await http.get("$API_URL/todos/$todoId",
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

  if (res.statusCode == 200 || res.statusCode == 401) {
    return TodosResponse.fromJson(jsonDecode(res.body));
  } else {
    throw Exception("Error Occured");
  }
}

Future<TodoResponse> newTodo(String token, data) async {
  print("asdasd");
  var res = await http.post(
    "$API_URL/todos",
    headers: {HttpHeaders.authorizationHeader: 'Bearer '+ token.toString()},
    body: data,
  );

  if (res.statusCode == 201 || res.statusCode == 422) {
    return TodoResponse.fromJson(jsonDecode(res.body));
  } else {
    throw Exception("Error Occured");
  }
}

Future<ModTodoResponse> editTodo(String token, String todoId, data) async {
  var res = await http.put(
    "$API_URL/todos/$todoId",
    headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    body: data,
  );

  if (res.statusCode == 200 || res.statusCode == 422) {
    return ModTodoResponse.fromJson(jsonDecode(res.body));
  } else {
    throw Exception("Error Occured");
  }
}


Future<ModTodoResponse> deleteTodo(String token, String todoId) async {
  var res = await http.delete(
    "$API_URL/todos/$todoId",
    headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
  );

  if (res.statusCode == 200 || res.statusCode == 404) {
    return ModTodoResponse.fromJson(jsonDecode(res.body));
  } else {
    throw Exception("Error Occured");
  }
}