package cyber.shop.cybershop.adapter;

import android.content.Context;
import android.support.v7.widget.CardView;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.squareup.picasso.Picasso;

import java.util.List;

import cyber.shop.cybershop.R;
import cyber.shop.cybershop.entities.ImagesCollection;
import cyber.shop.cybershop.entities.Product;
import cyber.shop.cybershop.utils.ConstantDataManager;
import cyber.shop.cybershop.utils.CurrencyManager;

public class MainProductAdapter extends RecyclerView.Adapter<MainProductAdapter.ViewHolder> {

    private List<Product> mProductList;
    private Context mContext;
    private OnItemClickListener mOnItemClickListener;

    public MainProductAdapter(List<Product> mProductList, Context mContext) {
        this.mProductList = mProductList;
        this.mContext = mContext;
    }

    public void setmOnItemClickListener(OnItemClickListener mOnItemClickListener) {
        this.mOnItemClickListener = mOnItemClickListener;
    }

    public interface OnItemClickListener {
        void setOnItemClickListener(int position);
    }

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        LayoutInflater layoutInflater = LayoutInflater.from(mContext);
        View view = layoutInflater.inflate(R.layout.row_item_product, viewGroup, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(ViewHolder viewHolder, final int i) {
        final Product product = mProductList.get(i);

        for (ImagesCollection imagesCollection : product.getImagesCollection()) {
            if (imagesCollection.getMainImage()) {
                String urlImage = ConstantDataManager.PRODUCT_URL + imagesCollection.getUrlImage();
                Picasso.get()
                        .load(urlImage)
                        .into(viewHolder.mImgProduct);
            }
        }

        double unitPrice = product.getPrice();
        viewHolder.mTxtProductName.setText(product.getProductName());
        viewHolder.mTxtUnitPrice.setText(CurrencyManager.getPrice(unitPrice, ConstantDataManager.CURRENCY));
        viewHolder.mCardViewItem.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                mOnItemClickListener.setOnItemClickListener(i);
            }
        });
    }

    @Override
    public int getItemCount() {
        return mProductList.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder {
        public ImageView mImgProduct;
        public TextView mTxtProductName;
        public TextView mTxtUnitPrice;
        public CardView mCardViewItem;

        public ViewHolder(View itemView) {
            super(itemView);
            mImgProduct = itemView.findViewById(R.id.imgProduct);
            mTxtProductName = itemView.findViewById(R.id.tvProductName);
            mTxtUnitPrice = itemView.findViewById(R.id.tvPrice);
            mCardViewItem = itemView.findViewById(R.id.card_view_item);
        }
    }
}
