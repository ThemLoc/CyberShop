package cyber.shop.cybershop.entities;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import java.io.Serializable;

public class Category implements Serializable {

    @SerializedName("cateID")
    @Expose
    private Integer cateID;
    @SerializedName("cateName")
    @Expose
    private String cateName;
    @SerializedName("type")
    @Expose
    private Boolean type;
    @SerializedName("specificationTitleCollection")
    @Expose
    private Object specificationTitleCollection;

    public Integer getCateID() {
        return cateID;
    }

    public void setCateID(Integer cateID) {
        this.cateID = cateID;
    }

    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }

    public Boolean getType() {
        return type;
    }

    public void setType(Boolean type) {
        this.type = type;
    }

    public Object getSpecificationTitleCollection() {
        return specificationTitleCollection;
    }

    public void setSpecificationTitleCollection(Object specificationTitleCollection) {
        this.specificationTitleCollection = specificationTitleCollection;
    }

}
