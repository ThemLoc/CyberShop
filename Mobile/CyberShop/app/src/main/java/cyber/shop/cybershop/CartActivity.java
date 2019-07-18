package cyber.shop.cybershop;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

import cyber.shop.cybershop.adapter.NewCartAdapter;
import cyber.shop.cybershop.entities.Cart;
import cyber.shop.cybershop.entities.CheckOut;
import cyber.shop.cybershop.entities.Cust;
import cyber.shop.cybershop.repository.CyberShopRepository;
import cyber.shop.cybershop.repository.CyberShopRepositoryImpl;
import cyber.shop.cybershop.utils.CallBackData;
import cyber.shop.cybershop.utils.ConstantDataManager;
import cyber.shop.cybershop.utils.CurrencyManager;
import cyber.shop.cybershop.utils.OrderSQLite;
import cyber.shop.cybershop.utils.SQLite;
import es.dmoral.toasty.Toasty;

public class CartActivity extends AppCompatActivity {

    private ImageView imgCancel;
    private Button btnCheckOut;
    private TextView tvTotalPrice;
    private NewCartAdapter newCartAdapter;
    private SQLite sqLite;
    private List<OrderSQLite> orderList;
    private TextView tvListEmpty;
    private ListView listView;
    private double totalPrice = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cart);

        sqLite = new SQLite(CartActivity.this);

        imgCancel = findViewById(R.id.imgCancel);
        imgCancel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                onBackPressed();
            }
        });

        tvListEmpty = findViewById(R.id.tv_list_empty);

        listView = findViewById(R.id.product_in_cart);

        tvTotalPrice = findViewById(R.id.tv_total_price);

        btnCheckOut = findViewById(R.id.btn_check_out);

        initRecyclerView();
        updateTotal();

        if (orderList.size() == 0) {
            btnCheckOut.setBackgroundColor(getResources().getColor(R.color.gray));
            btnCheckOut.setEnabled(false);
        } else {
            btnCheckOut.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Intent intent = new Intent(CartActivity.this, OrderInformationActivity.class);
                    startActivity(intent);
                    overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left);
                }
            });
        }

        if (orderList.size() == 0) {
            tvListEmpty.setVisibility(View.VISIBLE);
        }
    }

    private void initRecyclerView() {
        orderList = sqLite.getAllOrder();

        calculateTotal();
        if (orderList != null) {
            tvListEmpty.setVisibility(View.GONE);
            newCartAdapter = new NewCartAdapter(orderList, CartActivity.this);
            listView.setAdapter(newCartAdapter);
        }
    }

    private void updateTotal() {
        newCartAdapter.setmOnItemClickListener(new NewCartAdapter.OnItemClickListener() {
            @Override
            public void setOnItemClickListener(int position) {
                totalPrice = 0;
                calculateTotal();
                if (orderList.size() == 0) {
                    btnCheckOut.setBackgroundColor(getResources().getColor(R.color.gray));
                    btnCheckOut.setEnabled(false);
                }
            }
        });
    }

    private void calculateTotal() {
        orderList = sqLite.getAllOrder();
        if (!orderList.isEmpty()) {
            for (final OrderSQLite order : orderList) {
                totalPrice = totalPrice + Integer.parseInt(order.getQuantity()) * order.getPrice();
            }
        }
        tvTotalPrice.setText(CurrencyManager.getPrice(totalPrice, ConstantDataManager.CURRENCY));
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
        overridePendingTransition(R.anim.slide_in_left, R.anim.slide_out_right);
    }
}
