
import 'package:http/http.dart' as http;



Future<dynamic>login(userName,password)async{
  Uri url = Uri.parse('https://fakestoreapi.com/auth/login');

  final response = await http.post(url,body: {
    'username' : userName,
    'password' : password
    
  });

  print('::::::RESPONSE CODE :::::::${response.body}');
  return response;
}
