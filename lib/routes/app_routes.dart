abstract class Routes {
  static const home = Paths.homePage;


  Routes._();
// static String LOGIN_THEN(String afterSuccessfulLogin) =>
//     '$LOGIN?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
// static String PRODUCT_DETAILS(String productId) => '$PRODUCTS/$productId';


}
abstract class Paths{
  static const homePage = '/';
  static const login = '/login';
}