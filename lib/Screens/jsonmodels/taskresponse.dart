class TaskResponse{

	final String message;//message
	final Map errors;//error
	final Map task;//task

	TaskResponse({this.message, this.errors, this.task});

	factory TaskResponse.fromJson(Map<String,dynamic> json){
		return TaskResponse(
			message: json['message'],
			errors: json['errors'],
			task: json['task']
		);
	}
}

class ModTaskResponse{

	final String message;//message

	ModTaskResponse({this.message});

	factory ModTaskResponse.fromJson(Map<String,dynamic> json){
		return ModTaskResponse(
			message: json['message'],
		);
	}
}


class TasksResponse{

	final List data;

	TasksResponse({this.data});

	factory TasksResponse.fromJson(json){
    try {
      return TasksResponse(
        data: json["data"]
      );
    } catch (e) {
      print(json['message']);
      return TasksResponse(
        data: []
      );
    }
	}
}