package com.cybershop.models;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@Table(name = "[Order]")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Order.findAll", query = "SELECT o FROM Order o")
    , @NamedQuery(name = "Order.findByOrderID", query = "SELECT o FROM Order o WHERE o.orderID = :orderID")
    , @NamedQuery(name = "Order.findByShipAddress", query = "SELECT o FROM Order o WHERE o.shipAddress = :shipAddress")
    , @NamedQuery(name = "Order.findByTotal", query = "SELECT o FROM Order o WHERE o.total = :total")
    , @NamedQuery(name = "Order.findByStatus", query = "SELECT o FROM Order o WHERE o.status = :status")
    , @NamedQuery(name = "Order.updateStatus", query = "Update Order SET status = ? WHERE orderID = ?")
    , @NamedQuery(name = "Order.findByCustomerID", query = "SELECT o FROM Order o WHERE o.customerID.customerID = :customerID")})
public class Order implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "OrderID")
    @GeneratedValue
    private Integer orderID;
    @Column(name = "ShipAddress")
    private String shipAddress;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "Total")
    private Double total;
    @Column(name = "Status")
    private String status;
    @Column(name = "OrderDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date orderDate;
    @Column(name = "DeliveryFee")
    private Double deliveryFee;
    @JoinColumn(name = "CustomerID", referencedColumnName = "CustomerID")
    @ManyToOne(cascade = CascadeType.ALL)
    private Customer customerID;

    @Transient
    @JoinColumn(name = "CustomerID", referencedColumnName = "CustomerID")
    @ManyToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH})
    private Customer customerID_NotGuest;

    @JoinColumn(name = "PromotionID", referencedColumnName = "PromoID")
    @ManyToOne(cascade = {CascadeType.MERGE})
    private Promotion promotionID;
    @OneToMany(mappedBy = "orderID", cascade = CascadeType.ALL)
    private Collection<OrderDetail> orderDetailCollection;

    public Order() {
    }

    public Customer getCustomerID_NotGuest() {
        return customerID_NotGuest;
    }

    public void setCustomerID_NotGuest(Customer customerID_NotGuest) {
        this.customerID_NotGuest = customerID_NotGuest;
    }

    public Order(Integer orderID) {
        this.orderID = orderID;
    }

    public Integer getOrderID() {
        return orderID;
    }

    public void setOrderID(Integer orderID) {
        this.orderID = orderID;
    }

    public String getShipAddress() {
        return shipAddress;
    }

    public void setShipAddress(String shipAddress) {
        this.shipAddress = shipAddress;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Double getDeliveryFee() {
        return deliveryFee;
    }

    public void setDeliveryFee(Double deliveryFee) {
        this.deliveryFee = deliveryFee;
    }

    public Customer getCustomerID() {
        return customerID;
    }

    public void setCustomerID(Customer customerID) {
        this.customerID = customerID;
    }

    public Promotion getPromotionID() {
        return promotionID;
    }

    public void setPromotionID(Promotion promotionID) {
        this.promotionID = promotionID;
    }

    @XmlTransient
    public Collection<OrderDetail> getOrderDetailCollection() {
        return orderDetailCollection;
    }

    public void setOrderDetailCollection(Collection<OrderDetail> orderDetailCollection) {
        this.orderDetailCollection = orderDetailCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderID != null ? orderID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Order)) {
            return false;
        }
        Order other = (Order) object;
        if ((this.orderID == null && other.orderID != null) || (this.orderID != null && !this.orderID.equals(other.orderID))) {
            return false;
        }
        return true;
    }

}
