import 'package:flutter_dotenv/flutter_dotenv.dart';

class ProductConstants {
  ProductConstants._();

  static String get apiKey => dotenv.get('API_KEY');
}
