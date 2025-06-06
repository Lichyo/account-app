import 'package:flutter_gemini/flutter_gemini.dart';

class GeminiService {
  final String _apiKey = 'AIzaSyCTNK7dn5WfM09eQ6S730khhF0zG5B2LDM';

  GeminiService() {
    Gemini.init(apiKey: _apiKey);
  }

  Future<String> generateResponse({required String prompt}) async {
    try {
      final response = await Gemini.instance.prompt(
        parts: [
          Part.text(
            '根據以下的資訊，幫我分析出這筆記帳的內容：${prompt}，一定要用 json format 填寫以下資訊，不要有多餘的字：{amount: 金額, isIncome: 支出或收入, date: 日期, title: 記帳內容}。同時，若是記帳資訊中有不明確的地方，請用 0 取代 int 型別資料，或是用 "" 取代 String 型別資料，若是日期沒有在文本中提到，就用${DateTime.now()}取代，若是記帳內容皆為空，回傳{amount: 0, isIncome: false, date: "${DateTime.now()}", title: ""}。',
          ),
        ],
      );
      final cleanResult = response!.output!
          .replaceAll('```json', '')
          .replaceAll('```', '');
      return cleanResult;
    } catch (e) {
      return 'Error generating response: $e';
    }
  }
}
