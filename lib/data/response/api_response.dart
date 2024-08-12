

// Api Status
enum Status{LOADING,COMPLETED,ERROR}

// Api Response class
class ApiResponse{

  Status? status;
  String? message;

  ApiResponse(this.status,this.message);

  ApiResponse.loading():status=Status.LOADING;

  ApiResponse.completed():status=Status.COMPLETED;

  ApiResponse.error(this.message):status=Status.ERROR;

  @override
  String toString(){
    return 'Status:$status \n Message:$message';
  }
}