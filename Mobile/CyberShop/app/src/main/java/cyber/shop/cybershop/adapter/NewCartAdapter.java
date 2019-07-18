package cyber.shop.cybershop.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.squareup.picasso.Picasso;

import java.util.List;

import cyber.shop.cybershop.R;
import cyber.shop.cybershop.utils.ConstantDataManager;
import cyber.shop.cybershop.utils.CurrencyManager;
import cyber.shop.cybershop.utils.OrderSQLite;
import cyber.shop.cybershop.utils.SQLite;

public class NewCartAdapter extends BaseAdapter {

    private List<OrderSQLite> orderSQLiteList;
    private Context mContext;
    private LayoutInflater layoutInflater;
    private OnItemClickListener mOnItemClickListener;
    private SQLite sqLite;

    public NewCartAdapter(List<OrderSQLite> orderSQLiteList, Context mContext) {
        this.orderSQLiteList = orderSQLiteList;
        this.mContext = mContext;
        layoutInflater = LayoutInflater.from(mContext);
    }

    public void setmOnItemClickListener(OnItemClickListener mOnItemClickListener) {
        this.mOnItemClickListener = mOnItemClickListener;
    }

    public interface OnItemClickListener {
        void setOnItemClickListener(int position);
    }

    @Override
    public int getCount() {
        return orderSQLiteList.size();
    }

    @Override
    public Object getItem(int position) {
        return orderSQLiteList.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(final int position, View convertView, ViewGroup parent) {
        final ViewHolder holder;
        if (convertView == null) {
            convertView = layoutInflater.inflate(R.layout.list_product_in_cart, null);
            holder = new ViewHolder();
            holder.imgProduct = convertView.findViewById(R.id.img_product);
            holder.tvProductName = convertView.findViewById(R.id.tv_product_name);
            holder.tvProductPrice = convertView.findViewById(R.id.tv_product_price);
            holder.tvPlus = convertView.findViewById(R.id.text_view_plus);
            holder.tvSubtract = convertView.findViewById(R.id.text_view_subtract);
            holder.tvQuantityInCart = convertView.findViewById(R.id.tv_quantity_in_cart);
            holder.tvRemoveProduct = convertView.findViewById(R.id.tv_remove_product);
            holder.lnInCart = convertView.findViewById(R.id.ln_in_cart);
            convertView.setTag(holder);
        } else {
            holder = (ViewHolder) convertView.getTag();
        }

        final OrderSQLite orderSQLite = orderSQLiteList.get(position);

        Picasso.get()
                .load(orderSQLite.getImageUrl())
                .into(holder.imgProduct);

        double unitPrice = orderSQLite.getPrice();
        holder.tvProductName.setText(orderSQLite.getProductName());
        holder.tvProductPrice.setText(CurrencyManager.getPrice(unitPrice, ConstantDataManager.CURRENCY));
        holder.tvQuantityInCart.setText(orderSQLite.getQuantity());

        sqLite = new SQLite(mContext);

        if (position == getCount() - 1) {
            holder.lnInCart.setVisibility(View.VISIBLE);
        } else {
            holder.lnInCart.setVisibility(View.GONE);
        }

        //plus quantity
        holder.tvPlus.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int quantity = Integer.parseInt(holder.tvQuantityInCart.getText().toString()) + 1;

                OrderSQLite order = new OrderSQLite(orderSQLite.getProductID(), quantity + "", orderSQLite.getProductName(), orderSQLite.getImageUrl(), orderSQLite.getPrice());

                sqLite.update(order);

                holder.tvQuantityInCart.setText("" + quantity);
                mOnItemClickListener.setOnItemClickListener(position);
            }
        });

        //sub quantity
        holder.tvSubtract.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (Integer.parseInt(holder.tvQuantityInCart.getText().toString()) == 1) {
                    holder.tvQuantityInCart.setText("" + 1);
                } else {
                    int quantity = Integer.parseInt(holder.tvQuantityInCart.getText().toString()) - 1;

                    OrderSQLite order = new OrderSQLite(orderSQLite.getProductID(), quantity + "", orderSQLite.getProductName(), orderSQLite.getImageUrl(), orderSQLite.getPrice());

                    sqLite.update(order);

                    holder.tvQuantityInCart.setText("" + quantity);
                    mOnItemClickListener.setOnItemClickListener(position);
                }
            }
        });
        //remove product
        holder.tvRemoveProduct.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                sqLite.deleteOrder(orderSQLite.getProductID());
                orderSQLiteList.remove(position);
                mOnItemClickListener.setOnItemClickListener(position);
                notifyDataSetChanged();
            }
        });

        return convertView;
    }

    private class ViewHolder {
        ImageView imgProduct;
        TextView tvProductName;
        TextView tvProductPrice;
        TextView tvPlus;
        TextView tvSubtract;
        TextView tvQuantityInCart;
        TextView tvRemoveProduct;
        LinearLayout lnInCart;
    }
}
