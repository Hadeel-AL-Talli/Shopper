class ApiSetting {
  static const _baseUrl = "https://smart-store.mr-dev.tech/";
  static const _apiUrl = _baseUrl + "api/";
  static const categories = _apiUrl + 'categories';
  static const register = _apiUrl + 'auth/register';
  static const login = _apiUrl + 'auth/login';
  static const logout = _apiUrl + 'auth/logout';

  static const forgetPassword = _apiUrl + 'auth/forget-password';

  static const resetPassword = _apiUrl+ 'auth/reset-password';
  static const cities = _apiUrl+ 'cities';
  static const String home = _apiUrl + 'home';

  static const faq = _apiUrl +'faqs';

}