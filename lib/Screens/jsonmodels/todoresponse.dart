class TodoResponse{

	final String message;//message
	final Map errors;//error
	final Map todo;//Todo

	TodoResponse({this.message, this.errors, this.todo});

	factory TodoResponse.fromJson(Map<String,dynamic> json){
		return TodoResponse(
			message: json['message'],
			errors: json['errors'],
			todo: json['todo']
		);
	}
}

class ModTodoResponse{

	final String message;//message

	ModTodoResponse({this.message});

	factory ModTodoResponse.fromJson(Map<String,dynamic> json){
		return ModTodoResponse(
			message: json['message'],
		);
	}
}


class TodosResponse{

	final List data;

	TodosResponse({this.data});

	factory TodosResponse.fromJson(json){
    try {
      return TodosResponse(
        data: json
      );
    } catch (e) {
      print(json['message']);
      return TodosResponse(
        data: json
      );
    }
	}
}