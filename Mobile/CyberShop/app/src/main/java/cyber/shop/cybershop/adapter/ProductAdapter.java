package cyber.shop.cybershop.adapter;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.Toast;

import com.squareup.picasso.Picasso;

import java.util.List;

import cyber.shop.cybershop.ProductDetailActivity;
import cyber.shop.cybershop.R;
import cyber.shop.cybershop.entities.ImagesCollection;
import cyber.shop.cybershop.entities.Product;
import cyber.shop.cybershop.utils.ConstantDataManager;

public class ProductAdapter extends RecyclerView.Adapter<ProductAdapter.ViewHolder> {


    private List<Product> listData;
    private Context mContext;
    private LayoutInflater layoutInflater;
    private String urlImage;

    public ProductAdapter(List<Product> listData, Context mContext) {
        this.listData = listData;
        this.mContext = mContext;
        layoutInflater = LayoutInflater.from(mContext);
    }

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int position) {
        View view = layoutInflater.inflate(R.layout.hot_product_list, viewGroup, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(ViewHolder viewHolder, int position) {
        final Product product = this.listData.get(position);
        List<ImagesCollection> imagesCollectionList = product.getImagesCollection();

        for (ImagesCollection imagesCollection : imagesCollectionList) {
            if (imagesCollection.getMainImage()) {
                urlImage = ConstantDataManager.PRODUCT_URL + imagesCollection.getUrlImage();
            }
        }

        Picasso.get()
                .load(urlImage)
                .into(viewHolder.imgProduct);

        viewHolder.imgProduct.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
//                Bundle bundle = new Bundle();
//                bundle.putSerializable(ConstantDataManager.BUNDLE_PRODUCT, product);
                Intent intent = new Intent(mContext, ProductDetailActivity.class);
                intent.putExtra(ConstantDataManager.INTENT_BUNDLE, product.getProductID());
                mContext.startActivity(intent);
                ((Activity) mContext).overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left);
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
