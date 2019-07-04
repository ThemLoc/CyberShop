package cyber.shop.cybershop.retrofit;

public class ConfigApi {
    public static final String BASE_URL = "http://192.168.1.24:8084/CyberShop/api/";

    public interface Api {
        String GET_PRODUCT = "findProduct/{id}";
        String GET_BY_CATE = "findProductListByCate/{cateId}";
        String GET_ALL_CATE = "getAllCategory";
        String GET_BRAND = "getBrand";
        String GET_PRODUCT_BY_BRAND = "findProductListByBrand/{brandId}";
        String GET_PRODUCT_HOT = "findProductHot";
        String GET_PRODUCT_NEW = "findProductNew";
        String GET_PRODUCT_BEST_SELL = "findProductBestSell";
        String CHECK_OUT_CART = "checkout/create";
    }
}