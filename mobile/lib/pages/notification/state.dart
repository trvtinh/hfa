import 'package:get/get.dart';
import 'package:health_for_all/common/entities/notification_entity.dart';

class NotificationState {
  RxInt unread = 0.obs;
  RxInt read = 0.obs;
  RxInt warning = 0.obs;
  RxInt reminder = 0.obs;
  RxList<NotificationEntity> notiList = <NotificationEntity>[].obs;
}
