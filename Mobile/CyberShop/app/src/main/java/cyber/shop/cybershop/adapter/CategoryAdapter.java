package cyber.shop.cybershop.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.List;

import cyber.shop.cybershop.R;
import cyber.shop.cybershop.entities.Category;

public class CategoryAdapter extends BaseAdapter {

    private List<Category> listData;
    private Context mContext;
    private LayoutInflater layoutInflater;

    public CategoryAdapter(List<Category> listData, Context mContext) {
        this.listData = listData;
        this.mContext = mContext;
        layoutInflater = LayoutInflater.from(mContext);
    }

    @Override
    public int getCount() {
        return listData.size();
    }

    @Override
    public Object getItem(int position) {
        return listData.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        ViewHolder holder;
        if (convertView == null) {
            convertView = layoutInflater.inflate(R.layout.brand_list, null);
            holder = new ViewHolder();
            holder.tvBrand = convertView.findViewById(R.id.tv_brand);
            convertView.setTag(holder);
        } else {
            holder = (ViewHolder) convertView.getTag();
        }

        Category category = this.listData.get(position);

        holder.tvBrand.setText(" -  " + category.getCateName());

        return convertView;
    }

    private class ViewHolder {
        TextView tvBrand;
    }
}
