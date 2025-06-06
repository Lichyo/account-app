import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechService {
  Future<void> startListening() async {
    final SpeechToText _speechToText = SpeechToText();
    bool speechEnabled = false;
    String lastWords = '';

    void onSpeechResult(SpeechRecognitionResult result) {
      lastWords = result.recognizedWords;
    }

    void initSpeech() async {
      speechEnabled = await _speechToText.initialize();
    }

    void startListening() async {
      await _speechToText.listen(onResult: onSpeechResult);
    }

    Future<String> stopListening() async {
      await _speechToText.stop();
      return lastWords;
    }
  }
}
