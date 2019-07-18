package cyber.shop.cybershop;

import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.RequiresApi;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.AdapterView;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

import cyber.shop.cybershop.adapter.BrandAdapter;
import cyber.shop.cybershop.adapter.CategoryAdapter;
import cyber.shop.cybershop.adapter.ProductAdapter;
import cyber.shop.cybershop.entities.Brand;
import cyber.shop.cybershop.entities.Category;
import cyber.shop.cybershop.entities.Product;
import cyber.shop.cybershop.repository.CyberShopRepository;
import cyber.shop.cybershop.repository.CyberShopRepositoryImpl;
import cyber.shop.cybershop.utils.CallBackData;
import cyber.shop.cybershop.utils.ConstantDataManager;
import cyber.shop.cybershop.utils.SQLite;

public class MainActivity extends AppCompatActivity {

    private CyberShopRepository cyberShopRepository;
    private ProductAdapter productAdapter;
    private BrandAdapter brandAdapter;
    private CategoryAdapter categoryAdapter;
    private List<Product> productList;
    private RecyclerView recyclerViewHotProduct;
    private RecyclerView recyclerViewBestSaleProduct;
    private RecyclerView recyclerViewNewProduct;
    private GridView gridViewBrand;
    private GridView gridViewCate;
    private TextView tvQuantityInCart;
    private TextView readMoreHot;
    private TextView readMoreNew;
    private SQLite sqLite;
    private ImageView imgCart;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        readMoreHot = findViewById(R.id.read_more_hot);
        readMoreNew = findViewById(R.id.read_more_new);

        loadHotProduct();
        loadBestSaleProduct();
        loadNewProduct();
        loadBrand();
        loadCate();

        tvQuantityInCart = findViewById(R.id.tvQuantityInCart);
        sqLite = new SQLite(MainActivity.this);
        long count = sqLite.getProductCount();

        if(count > 0) {
            tvQuantityInCart.setVisibility(View.VISIBLE);
            tvQuantityInCart.setText("" + count);
        } else {
            tvQuantityInCart.setVisibility(View.GONE);
        }

        readMoreHot.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, ProductByBrandActivity.class);
                intent.putExtra("ReadMore", "moreHot");
                startActivity(intent);
                overridePendingTransition(R.anim.slide_in_right,R.anim.slide_out_left);
            }
        });

        readMoreNew.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, ProductByBrandActivity.class);
                intent.putExtra("ReadMore", "moreNew");
                startActivity(intent);
                overridePendingTransition(R.anim.slide_in_right,R.anim.slide_out_left);
            }
        });

        imgCart = findViewById(R.id.imgCart);
        imgCart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, CartActivity.class);
                startActivity(intent);
                overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left);
            }
        });
    }

    @Override
    protected void onResume() {
        super.onResume();
        sqLite = new SQLite(MainActivity.this);
        long count = sqLite.getProductCount();

        if(count > 0) {
            tvQuantityInCart.setVisibility(View.VISIBLE);
            tvQuantityInCart.setText("" + count);
        } else {
            tvQuantityInCart.setVisibility(View.GONE);
        }
    }

    private void loadHotProduct() {
        recyclerViewHotProduct = findViewById(R.id.recycler_view_hot_product);
        cyberShopRepository = new CyberShopRepositoryImpl();
        cyberShopRepository.getProductHot(new CallBackData<List<Product>>() {
            @Override
            public void onSuccess(List<Product> products) {
                productList = new ArrayList<>();
                for (int i = 0; i < 5; i++) {
                    productList.add(products.get(i));
                }
                LinearLayoutManager layoutManager = new LinearLayoutManager(getApplicationContext(), LinearLayoutManager.HORIZONTAL, false);
                recyclerViewHotProduct.setLayoutManager(layoutManager);
                productAdapter = new ProductAdapter(productList, MainActivity.this);
                recyclerViewHotProduct.setAdapter(productAdapter);
            }

            @Override
            public void onFail(String message) {
                Toast.makeText(MainActivity.this, "Fail: " + message, Toast.LENGTH_SHORT).show();
            }
        });

    }

    private void loadBestSaleProduct() {
        recyclerViewBestSaleProduct = findViewById(R.id.recycler_view_best_sale_product);
        cyberShopRepository = new CyberShopRepositoryImpl();
        cyberShopRepository.getBestSaleProduct(new CallBackData<List<Product>>() {
            @Override
            public void onSuccess(List<Product> products) {
                productList = products;
                LinearLayoutManager layoutManager = new LinearLayoutManager(getApplicationContext(), LinearLayoutManager.HORIZONTAL, false);
                recyclerViewBestSaleProduct.setLayoutManager(layoutManager);
                productAdapter = new ProductAdapter(productList, MainActivity.this);
                recyclerViewBestSaleProduct.setAdapter(productAdapter);
            }

            @Override
            public void onFail(String message) {
                Toast.makeText(MainActivity.this, "Fail: " + message, Toast.LENGTH_SHORT).show();
            }
        });

    }

    private void loadNewProduct() {
        recyclerViewNewProduct = findViewById(R.id.recycler_view_new_product);
        cyberShopRepository = new CyberShopRepositoryImpl();
        cyberShopRepository.getProductNew(new CallBackData<List<Product>>() {
            @Override
            public void onSuccess(List<Product> products) {
                productList = new ArrayList<>();
                for (int i = 0; i < 6; i++) {
                    productList.add(products.get(i));
                }
//                productList = products;
                LinearLayoutManager layoutManager = new LinearLayoutManager(getApplicationContext(), LinearLayoutManager.HORIZONTAL, false);
                recyclerViewNewProduct.setLayoutManager(layoutManager);
                productAdapter = new ProductAdapter(productList, MainActivity.this);
                recyclerViewNewProduct.setAdapter(productAdapter);
            }

            @Override
            public void onFail(String message) {
                Toast.makeText(MainActivity.this, "Fail: " + message, Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void loadBrand() {
        gridViewBrand = findViewById(R.id.grid_view_brand);
        cyberShopRepository = new CyberShopRepositoryImpl();
        cyberShopRepository.getBrand(new CallBackData<List<Brand>>() {
            @Override
            public void onSuccess(final List<Brand> brands) {
                brandAdapter = new BrandAdapter(brands, getApplicationContext());
                gridViewBrand.setAdapter(brandAdapter);
                gridViewBrand.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                    @Override
                    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                        Brand brand = (Brand) parent.getItemAtPosition(position);
                        Intent intent = new Intent(MainActivity.this, ProductByBrandActivity.class);
                        intent.putExtra("BrandID", brand.getBrandID());
                        startActivity(intent);
                        overridePendingTransition(R.anim.slide_in_right,R.anim.slide_out_left);
                    }
                });
            }

            @Override
            public void onFail(String message) {
                Toast.makeText(MainActivity.this, "Fail: " + message, Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void loadCate() {
        gridViewCate = findViewById(R.id.grid_view_category);
        cyberShopRepository = new CyberShopRepositoryImpl();
        cyberShopRepository.getAllCate(new CallBackData<List<Category>>() {
            @Override
            public void onSuccess(List<Category> categories) {
                categoryAdapter = new CategoryAdapter(categories, getApplicationContext());
                gridViewCate.setAdapter(categoryAdapter);
                gridViewCate.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                    @Override
                    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                        Category category = (Category) parent.getItemAtPosition(position);
                        Intent intent = new Intent(MainActivity.this, ProductByBrandActivity.class);
                        intent.putExtra("CategoryID", category.getCateID());
                        startActivity(intent);
                        overridePendingTransition(R.anim.slide_in_right,R.anim.slide_out_left);
                    }
                });
            }

            @Override
            public void onFail(String message) {
                Toast.makeText(MainActivity.this, "Fail: " + message, Toast.LENGTH_SHORT).show();
            }
        });
    }

}
