package cyber.shop.cybershop.retrofit;

import cyber.shop.cybershop.entities.CheckOut;
import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.GET;
import retrofit2.http.POST;
import retrofit2.http.Path;

public interface CyberShopServices {

    @GET(ConfigApi.Api.GET_PRODUCT)
    Call<ResponseBody> getProduct(@Path("id") int id);

    @GET(ConfigApi.Api.GET_BY_CATE)
    Call<ResponseBody> getProductListByCateID(@Path("cateId") int cateId);

    @GET(ConfigApi.Api.GET_ALL_CATE)
    Call<ResponseBody> getAllCate();

    @GET(ConfigApi.Api.GET_BRAND)
    Call<ResponseBody> getBrand();

    @GET(ConfigApi.Api.GET_PRODUCT_BY_BRAND)
    Call<ResponseBody> getProductListByBrandID(@Path("brandId") int brandId);

    @GET(ConfigApi.Api.GET_PRODUCT_HOT)
    Call<ResponseBody> getProductHot();

    @GET(ConfigApi.Api.GET_PRODUCT_NEW)
    Call<ResponseBody> getProductNew();

    @GET(ConfigApi.Api.GET_PRODUCT_BEST_SELL)
    Call<ResponseBody> getBestSaleProduct();

    @POST(ConfigApi.Api.CHECK_OUT_CART)
    Call<ResponseBody> checkOut(@Body CheckOut checkOut);
}
