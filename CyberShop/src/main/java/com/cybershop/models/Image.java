package com.cybershop.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "Image")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Image.findAll", query = "SELECT i FROM Image i")
    , @NamedQuery(name = "Image.findByImageID", query = "SELECT i FROM Image i WHERE i.imageID = :imageID")
    , @NamedQuery(name = "Image.findByUrlImage", query = "SELECT i FROM Image i WHERE i.urlImage = :urlImage")
    , @NamedQuery(name = "Image.updateMainImage", query = "Update Image set urlImage = ? WHERE productID.id = ? AND mainImage = 1")
    , @NamedQuery(name = "Image.checkMainImage", query = "Select i from Image i WHERE i.productID.id = ? AND i.mainImage = 1")
//    , @NamedQuery(name = "Image.insertImage", query = "Insert into Image (urlImage,productID,mainImage) values(?,?,?)")
    , @NamedQuery(name = "Image.findByMainImage", query = "SELECT i FROM Image i WHERE i.mainImage = :mainImage")
    , @NamedQuery(name = "Image.findByProductID", query = "SELECT i FROM Image i WHERE i.mainImage = :mainImage AND i.productID.productID = :proID")})
public class Image implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ImageID")
    private Integer imageID;
    @Column(name = "UrlImage")
    private String urlImage;
    @Column(name = "MainImage")
    private Boolean mainImage;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "ProductID", referencedColumnName = "ProductID")
    private Product productID;

    public Image() {
    }

    public Image(Integer imageID) {
        this.imageID = imageID;
    }

    public Integer getImageID() {
        return imageID;
    }

    public void setImageID(Integer imageID) {
        this.imageID = imageID;
    }

    public String getUrlImage() {
        return urlImage;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage;
    }

    public Boolean getMainImage() {
        return mainImage;
    }

    public void setMainImage(Boolean mainImage) {
        this.mainImage = mainImage;
    }

//     @JsonBackReference
    public Product getProductID() {
        return productID;
    }

    public void setProductID(Product productID) {
        this.productID = productID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (imageID != null ? imageID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Image)) {
            return false;
        }
        Image other = (Image) object;
        if ((this.imageID == null && other.imageID != null) || (this.imageID != null && !this.imageID.equals(other.imageID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Image{" + "imageID=" + imageID + ", urlImage=" + urlImage + ", mainImage=" + mainImage + ", productID=" + productID + '}';
    }

}
