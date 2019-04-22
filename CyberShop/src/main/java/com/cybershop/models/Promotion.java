package com.cybershop.models;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@Table(name = "Promotion")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Promotion.findAll", query = "SELECT p FROM Promotion p")
    , @NamedQuery(name = "Promotion.findByPromoID", query = "SELECT p FROM Promotion p WHERE p.promoID = :promoID")
    , @NamedQuery(name = "Promotion.findByPromoCode", query = "SELECT p FROM Promotion p WHERE p.promoCode = :promoCode")
    , @NamedQuery(name = "Promotion.findByDiscount", query = "SELECT p FROM Promotion p WHERE p.discount = :discount")
    , @NamedQuery(name = "Promotion.findByStartTime", query = "SELECT p FROM Promotion p WHERE p.startTime = :startTime")
    , @NamedQuery(name = "Promotion.findByEndTime", query = "SELECT p FROM Promotion p WHERE p.endTime = :endTime")
    , @NamedQuery(name = "Promotion.findByUsedTurn", query = "SELECT p FROM Promotion p WHERE p.usedTurn = :usedTurn")})
public class Promotion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "PromoID")
    private Integer promoID;
    @Column(name = "PromoCode")
    private String promoCode;
    @Column(name = "Discount")
    private String discount;
    @Column(name = "StartTime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date startTime;
    @Column(name = "EndTime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date endTime;
    @Column(name = "UsedTurn")
    private Integer usedTurn;
    @OneToMany(mappedBy = "promotionID", cascade = CascadeType.ALL)
    private Collection<Order> order1Collection;

    public Promotion() {
    }

    public Promotion(Integer promoID) {
        this.promoID = promoID;
    }

    public Integer getPromoID() {
        return promoID;
    }

    public void setPromoID(Integer promoID) {
        this.promoID = promoID;
    }

    public String getPromoCode() {
        return promoCode;
    }

    public void setPromoCode(String promoCode) {
        this.promoCode = promoCode;
    }

    public String getDiscount() {
        return discount;
    }

    public void setDiscount(String discount) {
        this.discount = discount;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Integer getUsedTurn() {
        return usedTurn;
    }

    public void setUsedTurn(Integer usedTurn) {
        this.usedTurn = usedTurn;
    }

    @XmlTransient
    public Collection<Order> getOrder1Collection() {
        return order1Collection;
    }

    public void setOrder1Collection(Collection<Order> order1Collection) {
        this.order1Collection = order1Collection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (promoID != null ? promoID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Promotion)) {
            return false;
        }
        Promotion other = (Promotion) object;
        if ((this.promoID == null && other.promoID != null) || (this.promoID != null && !this.promoID.equals(other.promoID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Promotion{" + "promoID=" + promoID + ", promoCode=" + promoCode + ", discount=" + discount + ", startTime=" + startTime + ", endTime=" + endTime + ", usedTurn=" + usedTurn + ", order1Collection=" + order1Collection + '}';
    }

    

}
