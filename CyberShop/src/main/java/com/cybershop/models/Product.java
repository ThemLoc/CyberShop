package com.cybershop.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@Table(name = "Product")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p")
    , @NamedQuery(name = "Product.findByProductID", query = "SELECT p FROM Product p WHERE p.productID = :productID")
    , @NamedQuery(name = "Product.findByProductName", query = "SELECT p FROM Product p WHERE p.productName = :productName")
    , @NamedQuery(name = "Product.findByDetail", query = "SELECT p FROM Product p WHERE p.detail = :detail")
    , @NamedQuery(name = "Product.findByPrice", query = "SELECT p FROM Product p WHERE p.price = :price")
    , @NamedQuery(name = "Product.findByQuantity", query = "SELECT p FROM Product p WHERE p.quantity = :quantity")
    , @NamedQuery(name = "Product.findBySell", query = "SELECT p FROM Product p WHERE p.sell = :sell")
    , @NamedQuery(name = "Product.findByDownPrice", query = "SELECT p FROM Product p WHERE p.downPrice = :downPrice")
    , @NamedQuery(name = "Product.updateStatus", query = "Update Product p set p.status = :status WHERE p.productID = :productID")
    , @NamedQuery(name = "Product.updateOther", query = "Update Product p set "
            + "p.productName = :productName,"
            + "p.brandID.id = :brandID,"
            + "p.price = :price,"
            + "p.downPrice = :downPrice,"
            + "p.quantity = :quantity"
            + "  WHERE p.productID = :productID")
    , @NamedQuery(name = "Product.updateSpec", query = "Update Product p set "
            + "p.detail= :detail,"
            + "p.categoryID.id = :cateID"
            + "  WHERE p.productID = :productID")
    , @NamedQuery(name = "Product.findByStatus", query = "SELECT p FROM Product p WHERE p.status = :status")})
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ProductID")
    private Integer productID;
    @Column(name = "ProductName")
    private String productName;
    @Column(name = "Detail")
    private String detail;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "Price")
    private Double price;
    @Column(name = "Quantity")
    private Integer quantity;
    @Column(name = "Sell")
    private Integer sell;
    @Column(name = "DownPrice")
    private Double downPrice;
    @Column(name = "Status")
    private Boolean status;
    @OneToMany(mappedBy = "productID")
    @JsonIgnore
    private Collection<OrderDetail> orderDetailCollection;
    @OneToMany(mappedBy = "productID")
    @JsonIgnore
    private Collection<Banner> bannerCollection;

    @OneToMany(mappedBy = "productID", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Collection<Image> imagesCollection;

    @JoinColumn(name = "BrandID", referencedColumnName = "BrandID")
    @ManyToOne
    private Brand brandID;

    @JoinColumn(name = "CategoryID", referencedColumnName = "CateID")
    @ManyToOne
    private Category categoryID;

    @OneToMany(mappedBy = "productID")
    @JsonIgnore
    private Collection<Cart> cartCollection;

    public Product() {
    }

    public Product(Integer productID) {
        this.productID = productID;
    }

    public Integer getProductID() {
        return productID;
    }

    public void setProductID(Integer productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getSell() {
        return sell;
    }

    public void setSell(Integer sell) {
        this.sell = sell;
    }

    public Double getDownPrice() {
        return downPrice;
    }

    public void setDownPrice(Double downPrice) {
        this.downPrice = downPrice;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    @XmlTransient
    public Collection<OrderDetail> getOrderDetailCollection() {
        return orderDetailCollection;
    }

    public void setOrderDetailCollection(Collection<OrderDetail> orderDetailCollection) {
        this.orderDetailCollection = orderDetailCollection;
    }

    @XmlTransient
    public Collection<Banner> getBannerCollection() {
        return bannerCollection;
    }

    public void setBannerCollection(Collection<Banner> bannerCollection) {
        this.bannerCollection = bannerCollection;
    }

    @XmlTransient
//    @JsonManagedReference
    public Collection<Image> getImagesCollection() {
        return imagesCollection;
    }

    public void setImagesCollection(Collection<Image> imagesCollection) {
        this.imagesCollection = imagesCollection;
    }

    public Brand getBrandID() {
        return brandID;
    }

    public void setBrandID(Brand brandID) {
        this.brandID = brandID;
    }

    public Category getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(Category categoryID) {
        this.categoryID = categoryID;
    }

    @XmlTransient
    public Collection<Cart> getCartCollection() {
        return cartCollection;
    }

    public void setCartCollection(Collection<Cart> cartCollection) {
        this.cartCollection = cartCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (productID != null ? productID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Product)) {
            return false;
        }
        Product other = (Product) object;
        if ((this.productID == null && other.productID != null) || (this.productID != null && !this.productID.equals(other.productID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Product{" + "productID=" + productID + ", productName=" + productName + ", detail=" + detail + ", price=" + price + ", quantity=" + quantity + ", sell=" + sell + ", downPrice=" + downPrice + ", status=" + status + ", orderDetailCollection=" + orderDetailCollection + ", bannerCollection=" + bannerCollection + ", imagesCollection=" + imagesCollection + ", brandID=" + brandID + ", categoryID=" + categoryID + ", cartCollection=" + cartCollection + '}';
    }
}
