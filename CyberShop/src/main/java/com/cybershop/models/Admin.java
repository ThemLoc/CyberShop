package com.cybershop.models;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Admin")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Admin.findAll", query = "SELECT a FROM Admin a")
    , @NamedQuery(name = "Admin.findByAdminID", query = "SELECT a FROM Admin a WHERE a.adminID = :adminID")
    , @NamedQuery(name = "Admin.findByRole", query = "SELECT a FROM Admin a WHERE a.role = :role")
    , @NamedQuery(name = "Admin.findByUsername", query = "SELECT a FROM Admin a WHERE a.username = :username")
    , @NamedQuery(name = "Admin.findByPassword", query = "SELECT a FROM Admin a WHERE a.password = :password")
    , @NamedQuery(name = "Admin.findByFullname", query = "SELECT a FROM Admin a WHERE a.fullname = :fullname")
    , @NamedQuery(name = "Admin.findByPhone", query = "SELECT a FROM Admin a WHERE a.phone = :phone")
    , @NamedQuery(name = "Admin.findByEmail", query = "SELECT a FROM Admin a WHERE a.email = :email")
    , @NamedQuery(name = "Admin.findByAddress", query = "SELECT a FROM Admin a WHERE a.address = :address")
    , @NamedQuery(name = "Admin.findBySex", query = "SELECT a FROM Admin a WHERE a.sex = :sex")
    , @NamedQuery(name = "Admin.findByStatus", query = "SELECT a FROM Admin a WHERE a.status = :status")
    , @NamedQuery(name = "Admin.findByDob", query = "SELECT a FROM Admin a WHERE a.dob = :dob")
    , @NamedQuery(name = "UpdateStatus", query = "update Admin set status = :sta where adminID = :id ")
    ,@NamedQuery(name = "LoginUser", query = "SELECT a FROM Admin a WHERE a.username = :user and a.password = :pass")})
public class Admin implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue
    @Column(name = "AdminID")
    private Integer adminID;

    @Column(name = "Role")
    private String role;

    @Column(name = "Username")
    private String username;

    @Column(name = "Password")
    private String password;

    @Column(name = "Fullname")
    private String fullname;
    @Column(name = "Phone")
    private String phone;

    @Column(name = "Email")
    private String email;

    @Column(name = "Address")
    private String address;
    @Column(name = "Sex")
    private Boolean sex;
    @Column(name = "Status")
    private Boolean status;
//    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column(name = "DOB")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dob;

    public Admin() {
    }

    public Admin(Integer adminID) {
        this.adminID = adminID;
    }

    public Integer getAdminID() {
        return adminID;
    }

    public void setAdminID(Integer adminID) {
        this.adminID = adminID;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Boolean getSex() {
        return sex;
    }

    public void setSex(Boolean sex) {
        this.sex = sex;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (adminID != null ? adminID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Admin)) {
            return false;
        }
        Admin other = (Admin) object;
        if ((this.adminID == null && other.adminID != null) || (this.adminID != null && !this.adminID.equals(other.adminID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Admin{" + "adminID=" + adminID + ", role=" + role + ", username=" + username + ", password=" + password + ", fullname=" + fullname + ", phone=" + phone + ", email=" + email + ", address=" + address + ", sex=" + sex + ", status=" + status + ", dob=" + dob + '}';
    }

    

}
