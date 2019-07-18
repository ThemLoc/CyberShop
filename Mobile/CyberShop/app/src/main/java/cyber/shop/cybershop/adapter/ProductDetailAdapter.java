package cyber.shop.cybershop.adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import com.squareup.picasso.Picasso;

import java.util.List;

import cyber.shop.cybershop.R;
import cyber.shop.cybershop.entities.ImagesCollection;
import cyber.shop.cybershop.utils.ConstantDataManager;

public class ProductDetailAdapter extends RecyclerView.Adapter<ProductDetailAdapter.ViewHolder> {


    private List<ImagesCollection> listData;
    private Context mContext;
    private LayoutInflater layoutInflater;
    private String urlImage;
    private OnItemClickListener mOnItemClickListener;

    public void setmOnItemClickListener(OnItemClickListener mOnItemClickListener) {
        this.mOnItemClickListener = mOnItemClickListener;
    }

    public ProductDetailAdapter(List<ImagesCollection> listData, Context mContext) {
        this.listData = listData;
        this.mContext = mContext;
        layoutInflater = LayoutInflater.from(mContext);
    }

    public interface OnItemClickListener {
        void setOnItemClickListener(int position);
    }

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int position) {
        View view = layoutInflater.inflate(R.layout.hot_product_list, viewGroup, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(ViewHolder viewHolder, final int position) {
        final ImagesCollection imagesCollection = this.listData.get(position);
        urlImage = ConstantDataManager.PRODUCT_URL + imagesCollection.getUrlImage();

        Picasso.get()
                .load(urlImage)
                .into(viewHolder.imgProduct);

        viewHolder.imgProduct.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                mOnItemClickListener.setOnItemClickListener(position);
            }
        });
    }

    @Override
    public int getItemCount() {
        return listData.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder {
        ImageView imgProduct;

        public ViewHolder(View itemView) {
            super(itemView);
            imgProduct = itemView.findViewById(R.id.img_product);
        }
    }
}
