package cyber.shop.cybershop.repository;

import android.content.Context;

import java.util.List;

import cyber.shop.cybershop.entities.Brand;
import cyber.shop.cybershop.entities.Category;
import cyber.shop.cybershop.entities.CheckOut;
import cyber.shop.cybershop.entities.Product;
import cyber.shop.cybershop.utils.CallBackData;

public interface CyberShopRepository {

    void getProduct(int id, CallBackData<Product> callBackData);

    void getProductListByCateID(int id, CallBackData<List<Product>> callBackData);

    void getAllCate(CallBackData<List<Category>> callBackData);

    void getBrand(CallBackData<List<Brand>> callBackData);

    void getProductListByBrandID(int id, CallBackData<List<Product>> callBackData);

    void getProductHot(CallBackData<List<Product>> callBackData);

    void getProductNew(CallBackData<List<Product>> callBackData);

    void getBestSaleProduct(CallBackData<List<Product>> callBackData);

    void checkOut(Context context, CheckOut checkOut, CallBackData<CheckOut> callBackData);
}
