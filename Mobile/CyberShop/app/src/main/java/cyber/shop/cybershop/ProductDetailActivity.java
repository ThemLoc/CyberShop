package cyber.shop.cybershop;

import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.RequiresApi;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TableLayout;
import android.widget.TableRow;
import android.widget.TextView;
import android.widget.Toast;

import com.squareup.picasso.Picasso;

import java.util.ArrayList;
import java.util.List;

import cyber.shop.cybershop.adapter.ProductDetailAdapter;
import cyber.shop.cybershop.entities.ImagesCollection;
import cyber.shop.cybershop.entities.Product;
import cyber.shop.cybershop.entities.Specification;
import cyber.shop.cybershop.repository.CyberShopRepository;
import cyber.shop.cybershop.repository.CyberShopRepositoryImpl;
import cyber.shop.cybershop.utils.CallBackData;
import cyber.shop.cybershop.utils.ConstantDataManager;
import cyber.shop.cybershop.utils.OrderSQLite;
import cyber.shop.cybershop.utils.SQLite;
import es.dmoral.toasty.Toasty;

public class ProductDetailActivity extends AppCompatActivity {

    private List<ImagesCollection> listData;
    private Context mContext;
    private ProductDetailAdapter productDetailAdapter;
    private RecyclerView recyclerView;
    private Product mProduct;
    private ImageView imgViewDetail;
    private ImageView imgCart;
    private String mainImageURL;
    private ImageView imgCancel;
    private TextView tvPlus;
    private TextView tvSubstract;
    private EditText edtQuantity;
    private Button addToCart;
    private int quantity = 1;
    private CyberShopRepository cyberShopRepository;
    private TableLayout tableLayout;
    private SQLite tools;
    private TextView tvQuantityInCart;
    private long quantityInCart = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_product_detail);

        Intent intent = getIntent();
        int id = intent.getIntExtra(ConstantDataManager.INTENT_BUNDLE, 1);

        tvQuantityInCart = findViewById(R.id.tvQuantityInCart);

        tools = new SQLite(ProductDetailActivity.this);
        long count = tools.getProductCount();

        if(count > 0) {
            tvQuantityInCart.setVisibility(View.VISIBLE);
            tvQuantityInCart.setText("" + count);
        } else {
            tvQuantityInCart.setVisibility(View.GONE);
        }

        cyberShopRepository = new CyberShopRepositoryImpl();
        cyberShopRepository.getProduct(id, new CallBackData<Product>() {
            @RequiresApi(api = Build.VERSION_CODES.M)
            @Override
            public void onSuccess(Product product) {
                mProduct = product;
                initDetail(product);
            }

            @Override
            public void onFail(String message) {
                Toast.makeText(mContext, message, Toast.LENGTH_SHORT).show();
            }
        });

        imgCancel = findViewById(R.id.imgCancel);
        imgCancel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                onBackPressed();
            }
        });

        imgViewDetail = findViewById(R.id.imgViewDetail);

        imgCart = findViewById(R.id.imgCart);
        imgCart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(ProductDetailActivity.this, CartActivity.class);
                startActivity(intent);
                overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left);
            }
        });

        edtQuantity = findViewById(R.id.edt_quantity);

        tvSubstract = findViewById(R.id.text_view_substract);
        tvSubstract.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (Integer.parseInt(edtQuantity.getText().toString()) > 1) {
                    quantity = Integer.parseInt(edtQuantity.getText().toString()) - 1;
                    edtQuantity.setText("" + quantity);
                }
            }
        });

        tvPlus = findViewById(R.id.text_view_plus);
        tvPlus.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                quantity = Integer.parseInt(edtQuantity.getText().toString()) + 1;
                edtQuantity.setText("" + quantity);
            }
        });

        addToCart = findViewById(R.id.addToCart);
        addToCart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                tools = new SQLite(ProductDetailActivity.this);

                int quantity = tools.getByProductID(mProduct.getProductID().toString());

                if (quantity == 0) {
                    long id = tools.getProductCount();
                    OrderSQLite order = new OrderSQLite(String.valueOf(id+1) , mProduct.getProductID().toString(),edtQuantity.getText()+"",  mProduct.getProductName(), mainImageURL, mProduct.getPrice());
                    tools.addOrder(order);
                    Toasty.success(ProductDetailActivity.this, "Đã thêm vào giỏ hàng!", Toasty.LENGTH_SHORT).show();

                } else {
                    quantity = quantity + Integer.parseInt(edtQuantity.getText()+"");

                    Toasty.success(ProductDetailActivity.this, "Cập nhật giỏ hàng thành công!", Toasty.LENGTH_SHORT).show();

                    OrderSQLite order = new OrderSQLite(mProduct.getProductID().toString(),quantity + "" ,  mProduct.getProductName(), mainImageURL, mProduct.getPrice());
                    tools.update(order);
                }

                quantityInCart = tools.getProductCount();
                tvQuantityInCart = findViewById(R.id.tvQuantityInCart);
                if (quantityInCart != 0) {
                    tvQuantityInCart.setVisibility(View.VISIBLE);
                    tvQuantityInCart.setText(quantityInCart+"");
                }
            }
        });
    }



    @Override
    protected void onResume() {
        super.onResume();
        tools = new SQLite(ProductDetailActivity.this);
        long count = tools.getProductCount();

        if(count > 0) {
            tvQuantityInCart.setVisibility(View.VISIBLE);
            tvQuantityInCart.setText("" + count);
        } else {
            tvQuantityInCart.setVisibility(View.GONE);
        }
    }

    @RequiresApi(api = Build.VERSION_CODES.M)
    private void initDetail(final Product product) {
        for (ImagesCollection imagesCollection : product.getImagesCollection()) {
            if (imagesCollection.getMainImage()) {
                mainImageURL = ConstantDataManager.PRODUCT_URL + imagesCollection.getUrlImage();
            }
        }

        Picasso.get()
                .load(mainImageURL)
                .into(imgViewDetail);

        recyclerView = findViewById(R.id.recycler_view_detail_product);
        LinearLayoutManager layoutManager = new LinearLayoutManager(getApplicationContext(), LinearLayoutManager.HORIZONTAL, false);
        recyclerView.setLayoutManager(layoutManager);
        productDetailAdapter = new ProductDetailAdapter(product.getImagesCollection(), getApplicationContext());
        recyclerView.setAdapter(productDetailAdapter);
        productDetailAdapter.setmOnItemClickListener(new ProductDetailAdapter.OnItemClickListener() {
            @Override
            public void setOnItemClickListener(int position) {
                ImagesCollection image = product.getImagesCollection().get(position);
                Picasso.get()
                        .load(ConstantDataManager.PRODUCT_URL + image.getUrlImage())
                        .into(imgViewDetail);
            }
        });

        //get detail of product
        String detail = product.getDetail();
        List<Specification> list = new ArrayList<>();
        Specification dto;
        String str[] = detail.split("#");
        for (int i = 0; i < str.length - 1; i++) {

            dto = new Specification();
            String arr[] = str[i].split("\\*");
            if (arr.length == 2) {
                dto.setTitle(arr[0]);
                dto.setValue(arr[1]);
            } else {
                dto.setTitle(arr[0]);
                dto.setValue("");
            }
            list.add(dto);
        }

        tableLayout = findViewById(R.id.table_layout);
        for (Specification specification : list) {
            TableRow tableRow = new TableRow(this);
            tableRow.setWeightSum(10);
            tableRow.setLayoutParams(new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT,
                    LinearLayout.LayoutParams.WRAP_CONTENT));

            TextView tvTitle = new TextView(this);
            tvTitle.setText("title");
            LinearLayout.LayoutParams params = new TableRow.LayoutParams(TableRow.LayoutParams.MATCH_PARENT, TableRow.LayoutParams.MATCH_PARENT, 3);
            params.setMargins(1,1,1,1);
            tvTitle.setLayoutParams(params);
            tvTitle.setTextSize(17);
            tvTitle.setTextColor(getColor(R.color.colortext));
            tvTitle.setPadding(15,0,0,0);
            tvTitle.setBackgroundColor(getColor(R.color.white));
            tvTitle.setText(specification.getTitle());

            tableRow.addView(tvTitle);

            TextView tvName = new TextView(this);
            tvName.setText("title");
            LinearLayout.LayoutParams paramsName = new TableRow.LayoutParams(TableRow.LayoutParams.MATCH_PARENT, TableRow.LayoutParams.WRAP_CONTENT, 7);
            paramsName.setMargins(1,1,1,1);
            tvName.setLayoutParams(paramsName);
            tvName.setTextSize(17);
            tvName.setTextColor(getColor(R.color.colortext));
            tvName.setPadding(15,0,0,0);
            tvName.setBackgroundColor(getColor(R.color.white));
            tvName.setText(specification.getValue());

            tableRow.addView(tvName);

            tableLayout.addView(tableRow, new TableLayout.LayoutParams(
                    TableLayout.LayoutParams.FILL_PARENT,
                    TableLayout.LayoutParams.WRAP_CONTENT));

        }
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
        overridePendingTransition(R.anim.slide_in_left, R.anim.slide_out_right);
    }
}
