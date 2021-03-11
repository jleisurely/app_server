import '../heroes.dart';

class ValidateController extends Controller {

  @override
  FutureOr<RequestOrResponse> handle(Request request) async {
    final headers = request.raw.headers;
    final a = headers.value('a');
    if (a == 'a') {
      return request;
    }
    return Response.unauthorized();
  }
}