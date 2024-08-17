class AppEnv {
  // static String base_url = "http://192.168.255.24:8000"; //local
  //static String base_url = "http://192.168.100.28:8000";//local home
  // static String base_url = "https://aws-staging.mallplusmm.com";//staging
  static String prefix = "/api/v2/";
  static String base_url = 'https://uat.mallplusmm.com'; // UAT
  // static String prefix = "/api/v2/";                       // UAT

  // static String base_url = 'https://mallplusmm.com';   // Live
  // static String prefix = "/api/v2/";                   // Live

  // static String merch_code = "200093"; // LIVE
  // static String app_id = "kpaea9cba0df424fd5bs4d39fad40626b"; // LIVE
  // static String sign_key = "1efed0466c41c5cf76040baf5b827e8f"; // LIVE

  //kpay
  static String merch_code = "200094"; // UAT
  static String app_id = "kp8e8bccec784544b4b1f608283045fa"; // UAT
  static String sign_key = "570cf01cfe89cdf1d81e66ca5b10dc90"; // UAT

  static String kbz_url_scheme =
      "foodmallmmscheme://foodmallmm.page.link?kpay_status=1";

  //cb pay
  static String cbUatLaunchUrl = "cbuat://pay?keyreference";
  static String cbLaunchUrl = "cb://pay?keyreference";

  //stable
  static String server_url = base_url + "/api/v2/customer-app/"; // Local
  static String domain_url = base_url; // Local
  static String facebookurl =
      'https://www.facebook.com/MallPlusMM?mibextid=ZbWKwL';
  static String phonenumber = '09765000300';
  static String phonelink = 'tel://+959765000300';
  static String facebookapplink = 'fb://page/100512276413414';

  //App Version
  static String version =
      'v1.1.6'; //*Need to Update When Uploading New App Version
  static int version_no =
      11; //*Need to Update When Uploading New App Version(for developer used)

  //Google Maps
  // static String google_map_api_key = "AIzaSyDRG7fDqe9Ap1BeUVydgkiYO7ZzrpYWxqE";
  static String google_map_api_key = "AIzaSyAS4B9Xkht7nJoEjkA9v8CeAlZ2xbon6eQ";
  static double zoom_level = 17.0;
  static double default_latitude = 16.827289584866897;
  static double default_longitude = 96.17375649511814;

  static double btn_font_size = 16.0;
  //static double btn_padding = 8.0;
  static double btn_h_padding = 10.0;
  static double btn_v_padding = 15.0;

  static double caption_font_size = 14.0;
}
