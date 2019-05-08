package com.cybershop.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author chungnguyen
 */
@Entity
@Table(name = "SpecificationTitle")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "SpecificationTitle.findAll", query = "SELECT s FROM SpecificationTitle s")
    , @NamedQuery(name = "SpecificationTitle.findBySpecID", query = "SELECT s FROM SpecificationTitle s WHERE s.specID = :specID")
    , @NamedQuery(name = "SpecificationTitle.findBySpecName", query = "SELECT s FROM SpecificationTitle s WHERE s.specName = :specName")
 , @NamedQuery(name = "SpecificationTitle.getByCateID", query = "SELECT s FROM SpecificationTitle s WHERE s.cateID.id = :cateID")})
public class SpecificationTitle implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue
    @Basic(optional = false)
    @Column(name = "SpecID")
    private Integer specID;
    @Basic(optional = false)
    @Column(name = "SpecName")
    private String specName;
    @JoinColumn(name = "CateID", referencedColumnName = "CateID")
    @JsonIgnore
    @ManyToOne(optional = false)
    private Category cateID;

    public SpecificationTitle() {
    }

    public SpecificationTitle(Integer specID) {
        this.specID = specID;
    }

    public SpecificationTitle(Integer specID, String specName) {
        this.specID = specID;
        this.specName = specName;
    }

    public Integer getSpecID() {
        return specID;
    }

    public void setSpecID(Integer specID) {
        this.specID = specID;
    }

    public String getSpecName() {
        return specName;
    }

    public void setSpecName(String specName) {
        this.specName = specName;
    }

    public Category getCateID() {
        return cateID;
    }

    public void setCateID(Category cateID) {
        this.cateID = cateID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (specID != null ? specID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof SpecificationTitle)) {
            return false;
        }
        SpecificationTitle other = (SpecificationTitle) object;
        if ((this.specID == null && other.specID != null) || (this.specID != null && !this.specID.equals(other.specID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "SpecificationTitle{" + "specID=" + specID + ", specName=" + specName ;
    }

    
    
}
