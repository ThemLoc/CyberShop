package com.cybershop.models;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "StoreInformation")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "StoreInformation.findAll", query = "SELECT s FROM StoreInformation s")
    , @NamedQuery(name = "StoreInformation.findByStoreID", query = "SELECT s FROM StoreInformation s WHERE s.storeID = :storeID")
    , @NamedQuery(name = "StoreInformation.findByStoreName", query = "SELECT s FROM StoreInformation s WHERE s.storeName = :storeName")
    , @NamedQuery(name = "StoreInformation.findByAddress", query = "SELECT s FROM StoreInformation s WHERE s.address = :address")
    , @NamedQuery(name = "StoreInformation.findByPhone1", query = "SELECT s FROM StoreInformation s WHERE s.phone1 = :phone1")
    , @NamedQuery(name = "StoreInformation.findByPhone2", query = "SELECT s FROM StoreInformation s WHERE s.phone2 = :phone2")
    , @NamedQuery(name = "StoreInformation.findByLocationX", query = "SELECT s FROM StoreInformation s WHERE s.locationX = :locationX")
    , @NamedQuery(name = "StoreInformation.findByLocationY", query = "SELECT s FROM StoreInformation s WHERE s.locationY = :locationY")})
public class StoreInformation implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "StoreID")
    private Integer storeID;
    @Column(name = "StoreName")
    private String storeName;
    @Column(name = "Address")
    private String address;
    @Column(name = "Phone1")
    private String phone1;
    @Column(name = "Phone2")
    private String phone2;
    @Column(name = "Location_X")
    private String locationX;
    @Column(name = "Location_Y")
    private String locationY;

    public StoreInformation() {
    }

    public StoreInformation(Integer storeID) {
        this.storeID = storeID;
    }

    public Integer getStoreID() {
        return storeID;
    }

    public void setStoreID(Integer storeID) {
        this.storeID = storeID;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone1() {
        return phone1;
    }

    public void setPhone1(String phone1) {
        this.phone1 = phone1;
    }

    public String getPhone2() {
        return phone2;
    }

    public void setPhone2(String phone2) {
        this.phone2 = phone2;
    }

    public String getLocationX() {
        return locationX;
    }

    public void setLocationX(String locationX) {
        this.locationX = locationX;
    }

    public String getLocationY() {
        return locationY;
    }

    public void setLocationY(String locationY) {
        this.locationY = locationY;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (storeID != null ? storeID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof StoreInformation)) {
            return false;
        }
        StoreInformation other = (StoreInformation) object;
        if ((this.storeID == null && other.storeID != null) || (this.storeID != null && !this.storeID.equals(other.storeID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "StoreInformation{" + "storeID=" + storeID + ", storeName=" + storeName + ", address=" + address + ", phone1=" + phone1 + ", phone2=" + phone2 + ", locationX=" + locationX + ", locationY=" + locationY + '}';
    }

    

}
