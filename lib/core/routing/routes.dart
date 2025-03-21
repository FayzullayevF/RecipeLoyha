class Routes {
  static const home = "/home";
  static const login = "/login";
  static const signUp = "/signup";
  static const onboarding = "/onboarding";
  static const categories = "/categories";
  static const profile = "/profile";
  static const recipeDetail = "/recipe-detail";
  static const categoryDetail = "/category-detail/:categoryId";
  static const community = "/community";
  static const review = "/review/:recipeId";
  static const createReview = "/create-review/:recipeId";
  static const topChef = "/topChef";
  static const chefProfile = "/chefProfile";
  static const trendingRecipes = "/trendingRecipes";

  static String getReviews(int recipeId) => '/review/$recipeId';
  static String getCategoryDetail(int categoryId) => '/category-detail/$categoryId';
  static String getCreateReview(int recipeId) => '/create-review/$recipeId';



}