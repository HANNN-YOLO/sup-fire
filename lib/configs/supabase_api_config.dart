import 'package:flutter_dotenv/flutter_dotenv.dart';

class SupabaseApiConfig {
  static get masterurl => dotenv.env['MASTER_URL'] ?? "";
  static get apikey => dotenv.env['API_KEY'] ?? "";
}
