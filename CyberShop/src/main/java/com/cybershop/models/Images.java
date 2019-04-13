
package com.cybershop.models;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "Images")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Images.findAll", query = "SELECT i FROM Images i")
    , @NamedQuery(name = "Images.findByImageID", query = "SELECT i FROM Images i WHERE i.imageID = :imageID")
    , @NamedQuery(name = "Images.findByUrlImage", query = "SELECT i FROM Images i WHERE i.urlImage = :urlImage")
    , @NamedQuery(name = "Images.findByMainImage", query = "SELECT i FROM Images i WHERE i.mainImage = :mainImage")})
public class Images implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ImageID")
    private Integer imageID;
    @Size(max = 2147483647)
    @Column(name = "UrlImage")
    private String urlImage;
    @Column(name = "MainImage")
    private Boolean mainImage;
    @JoinColumn(name = "ProductID", referencedColumnName = "ProductID")
    @ManyToOne
    private Product productID;

    public Images() {
    }

    public Images(Integer imageID) {
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
        if (!(object instanceof Images)) {
            return false;
        }
        Images other = (Images) object;
        if ((this.imageID == null && other.imageID != null) || (this.imageID != null && !this.imageID.equals(other.imageID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.cybershop.models.Images[ imageID=" + imageID + " ]";
    }
    
}
