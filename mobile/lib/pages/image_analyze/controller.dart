import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';
import 'package:health_for_all/common/API/firebase_API.dart';
import 'package:health_for_all/pages/application/controller.dart';

class ImageAnalyzeController extends GetxController {
  ImageAnalyzeController();

  final state = ImageAnalyzeState();
  final appController = Get.find<ApplicationController>();

  final model = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey: dotenv.env['GOOGLE_API_KEY']!,
    systemInstruction: Content.system(
        'Bạn là một người bác sĩ. Bạn tên là HFA. Bạn là sản phẩm AI của nhóm nghiên cứu khoa học trường Amsterdam.'
        ' Bạn sẽ hỗ trợ mọi người thông qua các câu hỏi liên quan đến sức khoẻ và các chỉ số y tế, ngoài ra bạn có'
        ' thể đọc hình ảnh là các chỉ số từ máy đo y tế và phân tích và trả về số liệu, từ đó bạn đưa ra đánh giá và lời khuyên cho họ'),
  );

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      state.image.value = File(image.path);
    } else {
      // Người dùng không chọn ảnh
    }
  }

  Future<void> pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      state.image.value = File(image.path);
    } else {
      // Người dùng không chụp ảnh
    }
  }

  Future<void> analyzeImage() async {
    if (state.image.value == null) return;

    try {
      final imageBytes = await state.image.value!.readAsBytes();
      final imagePart = DataPart('image/jpeg', imageBytes);

      state.analysisResult.value = 'Đang phân tích...';

      final result = await model.generateContent([
        Content.multi([imagePart])
      ], generationConfig: GenerationConfig(maxOutputTokens: 250));

      final resultText = result.text ??
          ''; // Handle null case by defaulting to an empty string

      // Giả sử mô hình trả về kết quả dưới dạng văn bản chứa số đo huyết áp.
      // Ví dụ: "Số đo huyết áp là: 120/80 mmHg"
      final regex = RegExp(r'(\d{2,3})/(\d{2,3}) mmHg');
      final match = regex.firstMatch(resultText);

      if (match != null) {
        final systolic = match.group(1); // Số đo huyết áp tâm thu
        final diastolic = match.group(2); // Số đo huyết áp tâm trương
        state.analysisResult.value =
            'Số đo huyết áp là: $systolic/$diastolic mmHg';
      } else {
        state.analysisResult.value = 'Không thể phân tích số đo huyết áp.';
      }
    } catch (e) {
      state.analysisResult.value = 'Lỗi phân tích hình ảnh: $e';
    }
  }
}

class ImageAnalyzeState {
  Rx<File?> image = Rx<File?>(null);
  Rx<String> analysisResult = Rx<String>('Chưa có kết quả phân tích');
}
