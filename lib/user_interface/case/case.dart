import 'package:guven_future/enum/paging_limit.dart';

int pagingLimitCase(PagingLimitEnum limit) {
  switch (limit) {

    case PagingLimitEnum.ten:
      return 10;

    case PagingLimitEnum.fifteen:
      return 15;

    case PagingLimitEnum.twenty:
      return 20;

    default:
      return 10;
  }
}