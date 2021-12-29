import 'package:getx_infinite_scroll/core/data/dio_client.dart';
import 'package:getx_infinite_scroll/core/model/pagination_filter.dart';
import 'package:getx_infinite_scroll/core/model/user_model.dart';

class UserRepository {
  DioClient _dio;
  UserRepository(this._dio);

  final repo = 'users';

  Future<List<UserModel>> getUsers(PaginationFilter filter) async {
    final lst = await _dio.get('$repo/', queryParameters: {'page': filter.page, 'limit': filter.limit});
    return lst.map<UserModel>((value) => UserModel.fromJson(value)).toList();
  }

  Future<UserModel> getByIdUser(int id) async {
    final data = await _dio.get('$repo/$id');
    return UserModel.fromJson(data);
  }

  Future<UserModel> createUser(UserModel user) async {
    final data = await _dio.post('$repo/', data: user.toJson());
    return UserModel.fromJson(data);
  }

  Future<UserModel> updateUser(int id, UserModel user) async {
    final data = await _dio.put('$repo/$id', data:  user.toJson());
    return UserModel.fromJson(data);
  }

  Future<UserModel>  deleteUser(int id) async {
    final data = await _dio.delete('$repo/$id');
    return UserModel.fromJson(data);
  }
}
