package cyber.shop.cybershop;

import android.content.Context;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.DisplayMetrics;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

import cyber.shop.cybershop.adapter.MainProductAdapter;
import cyber.shop.cybershop.entities.Product;
import cyber.shop.cybershop.repository.CyberShopRepository;
import cyber.shop.cybershop.repository.CyberShopRepositoryImpl;
import cyber.shop.cybershop.utils.CallBackData;
import cyber.shop.cybershop.utils.ConstantDataManager;
import cyber.shop.cybershop.utils.GridSpacingItemDecoration;
import cyber.shop.cybershop.utils.SQLite;

public class ProductByBrandActivity extends AppCompatActivity {

    private CyberShopRepository cyberShopRepository;
    private ImageView imgCancel;
    private RecyclerView mRecyclerViewProduct;
    private MainProductAdapter mainProductAdapter;
    private List<Product> mProductList;
    private EditText mEdtSearch;
    private ImageView imgCart;
    private TextView tvQuantityInCart;
    private SQLite sqLite;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_product_by_brand);

        mEdtSearch = findViewById(R.id.edit_text_search);

        imgCancel = findViewById(R.id.imgCancel);
        imgCancel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                onBackPressed();
            }
        });

        imgCart = findViewById(R.id.imgCart);
        imgCart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(ProductByBrandActivity.this, CartActivity.class);
                startActivity(intent);
                overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left);
            }
        });

        tvQuantityInCart = findViewById(R.id.tvQuantityInCart);
        sqLite = new SQLite(ProductByBrandActivity.this);
        long count = sqLite.getProductCount();

        if(count > 0) {
            tvQuantityInCart.setVisibility(View.VISIBLE);
            tvQuantityInCart.setText("" + count);
        } else {
            tvQuantityInCart.setVisibility(View.GONE);
        }

        initialView();

        showProduct();
        addTextWatcher();
    }

    @Override
    protected void onResume() {
        super.onResume();
        tvQuantityInCart = findViewById(R.id.tvQuantityInCart);
        sqLite = new SQLite(ProductByBrandActivity.this);
        long count = sqLite.getProductCount();

        if(count > 0) {
            tvQuantityInCart.setVisibility(View.VISIBLE);
            tvQuantityInCart.setText("" + count);
        } else {
            tvQuantityInCart.setVisibility(View.GONE);
        }
    }

    private void showProduct() {
        int brandID = getIntent().getIntExtra("BrandID", 0);
        if (brandID != 0) {
            showProductByBrand(brandID);
        }

        int cateID = getIntent().getIntExtra("CategoryID", 0);
        if (cateID != 0) {
            showProductByCate(cateID);
        }

        String readMore = getIntent().getStringExtra("ReadMore");

        if (readMore != null) {
            if (readMore.equals("moreHot")) {
                showHotProduct();
            } else if (readMore.equals("moreNew")) {
                showNewProduct();
            }
        }
    }

    private void initialView() {
        mRecyclerViewProduct = findViewById(R.id.recycler_view_product);
        mRecyclerViewProduct.setHasFixedSize(true);
        int numberOfColumn = calculateNumberOfColumns(getApplicationContext());
        GridLayoutManager layoutManager = new GridLayoutManager(getApplicationContext(), numberOfColumn);
        mRecyclerViewProduct.setLayoutManager(layoutManager);
        int spacing = getResources().getDimensionPixelSize(R.dimen.dp7);
        mRecyclerViewProduct.addItemDecoration(new GridSpacingItemDecoration(numberOfColumn, spacing, true));
    }

    private int calculateNumberOfColumns(Context context) {
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        float dpWidth = displayMetrics.widthPixels / displayMetrics.density;
        int noOfColumns = (int) (dpWidth / 180);
        return noOfColumns;
    }

    private void showProductByBrand(int id) {
        cyberShopRepository = new CyberShopRepositoryImpl();
        cyberShopRepository.getProductListByBrandID(id, new CallBackData<List<Product>>() {
            @Override
            public void onSuccess(List<Product> products) {
                mProductList = products;
                mainProductAdapter = new MainProductAdapter(mProductList, getApplicationContext());
                mRecyclerViewProduct.setAdapter(mainProductAdapter);
                mainProductAdapter.setmOnItemClickListener(new MainProductAdapter.OnItemClickListener() {
                    @Override
                    public void setOnItemClickListener(int position) {
                        Product product = mProductList.get(position);
                        Intent intent = new Intent(ProductByBrandActivity.this, ProductDetailActivity.class);
                        intent.putExtra(ConstantDataManager.INTENT_BUNDLE, product.getProductID());
                        startActivity(intent);
                        overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left);
                    }
                });
            }

            @Override
            public void onFail(String message) {

            }
        });
    }

    private void showProductByCate(int id) {
        cyberShopRepository = new CyberShopRepositoryImpl();
        cyberShopRepository.getProductListByCateID(id, new CallBackData<List<Product>>() {
            @Override
            public void onSuccess(List<Product> products) {
                mProductList = products;
                mainProductAdapter = new MainProductAdapter(mProductList, getApplicationContext());
                mRecyclerViewProduct.setAdapter(mainProductAdapter);
                mainProductAdapter.setmOnItemClickListener(new MainProductAdapter.OnItemClickListener() {
                    @Override
                    public void setOnItemClickListener(int position) {
                        Product product = mProductList.get(position);
                        Intent intent = new Intent(ProductByBrandActivity.this, ProductDetailActivity.class);
                        intent.putExtra(ConstantDataManager.INTENT_BUNDLE, product.getProductID());
                        startActivity(intent);
                        overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left);
                    }
                });
            }

            @Override
            public void onFail(String message) {

            }
        });
    }

    private void showHotProduct() {
        cyberShopRepository = new CyberShopRepositoryImpl();
        cyberShopRepository.getProductHot(new CallBackData<List<Product>>() {
            @Override
            public void onSuccess(List<Product> products) {
                mProductList = products;
                mainProductAdapter = new MainProductAdapter(mProductList, getApplicationContext());
                mRecyclerViewProduct.setAdapter(mainProductAdapter);
                mainProductAdapter.setmOnItemClickListener(new MainProductAdapter.OnItemClickListener() {
                    @Override
                    public void setOnItemClickListener(int position) {
                        Product product = mProductList.get(position);
                        Intent intent = new Intent(ProductByBrandActivity.this, ProductDetailActivity.class);
                        intent.putExtra(ConstantDataManager.INTENT_BUNDLE, product.getProductID());
                        startActivity(intent);
                        overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left);
                    }
                });
            }

            @Override
            public void onFail(String message) {

            }
        });
    }

    private void showNewProduct() {
        cyberShopRepository = new CyberShopRepositoryImpl();
        cyberShopRepository.getProductNew(new CallBackData<List<Product>>() {
            @Override
            public void onSuccess(List<Product> products) {
                mProductList = products;
                mainProductAdapter = new MainProductAdapter(mProductList, getApplicationContext());
                mRecyclerViewProduct.setAdapter(mainProductAdapter);
                mainProductAdapter.setmOnItemClickListener(new MainProductAdapter.OnItemClickListener() {
                    @Override
                    public void setOnItemClickListener(int position) {
                        Product product = mProductList.get(position);
                        Intent intent = new Intent(ProductByBrandActivity.this, ProductDetailActivity.class);
                        intent.putExtra(ConstantDataManager.INTENT_BUNDLE, product.getProductID());
                        startActivity(intent);
                        overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left);
                    }
                });
            }

            @Override
            public void onFail(String message) {

            }
        });
    }

    private void addTextWatcher() {
        mEdtSearch.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {

            }

            @Override
            public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {
            }

            @Override
            public void afterTextChanged(Editable editable) {
                String searchText = mEdtSearch.getText().toString().trim().toLowerCase();

                if (!searchText.isEmpty()) {
                    List<Product> productList = new ArrayList<>();
                    for (Product product : mProductList) {
                        if (product.getProductName().toLowerCase().contains(searchText)) {
                            productList.add(product);
                        }
                    }
                    searchProduct(productList);
                } else {
                    showProduct();
                }
            }
        });
    }

    private void searchProduct(final List<Product> productList) {
        mainProductAdapter = new MainProductAdapter(productList, getApplicationContext());
        mRecyclerViewProduct.setAdapter(mainProductAdapter);
        mainProductAdapter.setmOnItemClickListener(new MainProductAdapter.OnItemClickListener() {
            @Override
            public void setOnItemClickListener(int position) {
                Product product = productList.get(position);
                Intent intent = new Intent(ProductByBrandActivity.this, ProductDetailActivity.class);
                intent.putExtra(ConstantDataManager.INTENT_BUNDLE, product.getProductID());
                startActivity(intent);
                overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left);
            }
        });
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
        overridePendingTransition(R.anim.slide_in_left, R.anim.slide_out_right);
    }
}
