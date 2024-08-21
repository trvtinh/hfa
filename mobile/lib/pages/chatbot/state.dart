import 'package:get/get.dart';
import 'package:health_for_all/common/entities/chatbot.dart';
import 'package:image_picker/image_picker.dart';

class ChatbotState {
  RxList<ChatbotEntity> chatList = <ChatbotEntity>[].obs;
  var image = Rx<XFile?>(null);

  RxBool loading = false.obs;
  RxBool loadMore = false.obs;
}
