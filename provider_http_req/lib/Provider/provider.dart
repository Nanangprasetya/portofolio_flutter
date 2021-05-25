import 'package:flutter/material.dart';
import 'package:provider_http_req/Model/dtoPost.dart';
import 'package:provider_http_req/Model/errorData.dart';
import 'package:provider_http_req/Util/statusReq.dart';

abstract class ProviderPost<T> extends ChangeNotifier {
  List<DtoPost> _lstPost = [];
  DtoPost _postById;
  StatusReq _statusReq = StatusReq.loading;
  ErrorData _errorReq;
  int _page = 0;

  /// get Post infinity list on #PostApi()
  Future<List<DtoPost>> getPost({int start, int limit});

  /// getPOSTById on #PostApi()
  Future<DtoPost> getPostbyId(int id);

  List<DtoPost> get listPost => _lstPost;

  DtoPost get postById => _postById;

  StatusReq get statusReq => _statusReq;

  ErrorData get errorReq => _errorReq;

  Future<void> refresPage() {   
    _page = 0;
    listPost.clear();
    return _loadData();
  }

  void firstPage() {
    _page = 0;
    _loadData(load: true);
    notifyListeners();
  }

  void nextPage() {
    if (_statusReq == StatusReq.loadNextData || _statusReq == StatusReq.error) {
      return;
    }
    print("Next Page");

    _statusReq = StatusReq.loadNextData;
    _loadData();
    notifyListeners();
  }

  Future<void> getPostById(int id) => _getDataById(id);

  Future<void> _loadData({bool load = false}) async {
    int _limit = 10;

    if (load) {
      _statusReq = StatusReq.loading;
      _page = 0;
      _lstPost.clear();
    }

    try {
      List<DtoPost> response = await getPost(start: _page, limit: _limit);
      response.forEach((i) {
        _lstPost.add(i);
      });

      if (_lstPost.isEmpty) {
        _statusReq = StatusReq.emptyData;
      } else {
        _statusReq = StatusReq.hasData;
        _page += _limit;
      }
    } catch (e, s) {
      _statusReq = StatusReq.error;
      _errorReq = ErrorData(e, s);
    }
    notifyListeners();
  }

  Future<void> _getDataById(int id) async {
    _statusReq = StatusReq.loading;
    try {
      DtoPost response = await getPostbyId(id);
      if (response == null) {
        _statusReq = StatusReq.emptyData;
      } else {
        _statusReq = StatusReq.hasData;
        _postById = response;
      }
    } catch (e, s) {
      _statusReq = StatusReq.error;
      _errorReq = ErrorData(e, s);
    }
    notifyListeners();
  }
}
