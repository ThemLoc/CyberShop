package cyber.shop.cybershop;

import android.content.DialogInterface;
import android.content.Intent;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

import cyber.shop.cybershop.entities.Cart;
import cyber.shop.cybershop.entities.CheckOut;
import cyber.shop.cybershop.entities.Cust;
import cyber.shop.cybershop.repository.CyberShopRepository;
import cyber.shop.cybershop.repository.CyberShopRepositoryImpl;
import cyber.shop.cybershop.utils.CallBackData;
import cyber.shop.cybershop.utils.OrderSQLite;
import cyber.shop.cybershop.utils.SQLite;
import es.dmoral.toasty.Toasty;

public class OrderInformationActivity extends AppCompatActivity {

    private EditText edtFullName;
    private EditText edtPhone;
    private EditText edtEmail;
    private EditText edtAddress;
    private ImageView imgBack;
    private Button btnCheckOut;
    private TextView tvError;
    private CyberShopRepository cyberShopRepository;
    private SQLite sqLite;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_order_information);
        initView();

        imgBack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                onBackPressed();
            }
        });

        btnCheckOut.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                checkOut();
            }
        });
    }

    private void initView() {
        edtFullName = findViewById(R.id.edt_full_name);
        edtPhone = findViewById(R.id.edt_phone);
        edtEmail = findViewById(R.id.edt_email);
        edtAddress = findViewById(R.id.edt_address);
        imgBack = findViewById(R.id.imgBack);
        btnCheckOut = findViewById(R.id.btn_check_out_cart);
        tvError = findViewById(R.id.tv_error);
    }

    private void checkOut() {
        String fullName = edtFullName.getText().toString();
        String phone = edtPhone.getText().toString();
        String email = edtEmail.getText().toString();
        String address = edtAddress.getText().toString();

        if (fullName.trim().isEmpty() || phone.trim().isEmpty() || email.trim().isEmpty() || address.trim().isEmpty()) {
            tvError.setVisibility(View.VISIBLE);
            tvError.setText("Xin vui lòng nhập đầy đủ thông tin.");
        } else if (phone.length() > 10) {
            tvError.setVisibility(View.VISIBLE);
            tvError.setText("Số điện thoại chỉ có 10 số.");
        } else if (!email.contains("@")) {
            tvError.setVisibility(View.VISIBLE);
            tvError.setText("Xin vui lòng nhập đúng định dạng email. VD: abc@xyz.com");
        } else {
            Cust cust = new Cust(fullName, address, email, phone);

            sqLite = new SQLite(OrderInformationActivity.this);
            List<OrderSQLite> testList = sqLite.getAllOrder();
            List<Cart> cartList = new ArrayList<>();

            for (OrderSQLite orderSQLite: testList) {
                cartList.add(new Cart(Integer.parseInt(orderSQLite.getProductID()), Integer.parseInt(orderSQLite.getQuantity())));
            }

            CheckOut checkOut = new CheckOut(cust, cartList);

            cyberShopRepository = new CyberShopRepositoryImpl();
            cyberShopRepository.checkOut(OrderInformationActivity.this, checkOut, new CallBackData<CheckOut>() {
                @Override
                public void onSuccess(CheckOut checkOut) {
                    sqLite.deleteAll();
                    showAlertDialog();
                }

                @Override
                public void onFail(String message) {
                    Toasty.error(OrderInformationActivity.this, "Gặp lỗi trong việc đặt hàng. Vui lòng quay lại sau!", Toasty.LENGTH_SHORT).show();
                }
            });
        }
    }

    private void showAlertDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle("Xác nhận đơn hàng");
        builder.setMessage("Đơn hàng của bạn đang được xử lý!");
        builder.setCancelable(false);
        builder.setPositiveButton("Tiếp tục mua sắm", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) {
                Intent intent = new Intent(OrderInformationActivity.this, MainActivity.class);
                intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
                startActivity(intent);
                overridePendingTransition(R.anim.slide_in_right,R.anim.slide_out_left);
                finish();
            }
        });
        AlertDialog alertDialog = builder.create();
        alertDialog.show();
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
        overridePendingTransition(R.anim.slide_in_left, R.anim.slide_out_right);
    }
}
