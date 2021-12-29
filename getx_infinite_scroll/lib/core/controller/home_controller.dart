import 'package:get/get.dart';
import 'package:getx_infinite_scroll/core/data/dio_exceptions.dart';
import 'package:getx_infinite_scroll/core/model/pagination_filter.dart';
import 'package:getx_infinite_scroll/core/repository/user_repository.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeController extends GetxController {
  HomeController(this._userRepository);

  static HomeController get to => Get.find();
  int _limitPage = 20;

  final UserRepository _userRepository;
  final _pagingController =
      PagingController(firstPageKey: 1, invisibleItemsThreshold: 5).obs;
  final _paginationFilter = PaginationFilter().obs;

  int get limit => _paginationFilter.value.limit;
  int get page => _paginationFilter.value.page;
  Rx<PagingController> get pagingController => _pagingController;

  @override
  void onClose() {
    _pagingController.value.dispose();
    super.onClose();
  }

  @override
  onInit() {
    _pagingController.value.addPageRequestListener(
        (pageKey) => _changePaginationFilter(pageKey, _limitPage));
    ever(_paginationFilter, (_) => _getAllUsers());
    super.onInit();
  }

  Future<void> _getAllUsers() async {
    try {
      final usersData = await _userRepository.getUsers(_paginationFilter.value);
      if (usersData.isEmpty) {
        _pagingController.value.appendLastPage(usersData);
      } else {
        _pagingController.value
            .appendPage(usersData, _paginationFilter.value.page + 1);
        _pagingController.value
            .addStatusListener((status) => status.printInfo());
      }
    } catch (e) {
      _pagingController.value.error = e;
    }
  }

  void changeTotalPerPage() {
    _pagingController.value.refresh();
    _changePaginationFilter(1, _limitPage);
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val.page = page;
      val.limit = limit;
    });
  }
}
