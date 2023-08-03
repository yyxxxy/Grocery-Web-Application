/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Customer.Entity;

import BuyEntity.Feedback;
import BuyEntity.OrderTable;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author user
 */
@Entity
@Table(catalog = "", schema = "NBUSER", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"CUSTOMER_USERNAME"})})
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Customer.findAll", query = "SELECT c FROM Customer c")
    , @NamedQuery(name = "Customer.findByCustomerId", query = "SELECT c FROM Customer c WHERE c.customerId = :customerId")
    , @NamedQuery(name = "Customer.findByCustomerUsername", query = "SELECT c FROM Customer c WHERE c.customerUsername = :customerUsername")
    , @NamedQuery(name = "Customer.findByCustomerPassword", query = "SELECT c FROM Customer c WHERE c.customerPassword = :customerPassword")
    , @NamedQuery(name = "Customer.findByCustomerEmail", query = "SELECT c FROM Customer c WHERE c.customerEmail = :customerEmail")
    , @NamedQuery(name = "Customer.findByCustomerFullname", query = "SELECT c FROM Customer c WHERE c.customerFullname = :customerFullname")
    , @NamedQuery(name = "Customer.findByCustomerIcNo", query = "SELECT c FROM Customer c WHERE c.customerIcNo = :customerIcNo")
    , @NamedQuery(name = "Customer.findByCustomerPhNo", query = "SELECT c FROM Customer c WHERE c.customerPhNo = :customerPhNo")
    , @NamedQuery(name = "Customer.findByCustomerAddress", query = "SELECT c FROM Customer c WHERE c.customerAddress = :customerAddress")
    , @NamedQuery(name = "Customer.findByCustomerGender", query = "SELECT c FROM Customer c WHERE c.customerGender = :customerGender")})
public class Customer implements Serializable {

    @OneToMany(mappedBy = "fkCustomerId")
    private List<Feedback> feedbackList;

    @OneToMany(mappedBy = "ckCustomerId")
    private List<OrderTable> orderTableList;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "CUSTOMER_ID", nullable = false)
    private Integer customerId;
    @Basic(optional = false)
    @Column(name = "CUSTOMER_USERNAME", nullable = false, length = 30)
    private String customerUsername;
    @Basic(optional = false)
    @Column(name = "CUSTOMER_PASSWORD", nullable = false, length = 30)
    private String customerPassword;
    @Column(name = "CUSTOMER_EMAIL", length = 255)
    private String customerEmail;
    @Column(name = "CUSTOMER_FULLNAME", length = 255)
    private String customerFullname;
    @Column(name = "CUSTOMER_IC_NO", length = 255)
    private String customerIcNo;
    @Column(name = "CUSTOMER_PH_NO", length = 255)
    private String customerPhNo;
    @Column(name = "CUSTOMER_ADDRESS", length = 255)
    private String customerAddress;
    @Column(name = "CUSTOMER_GENDER", length = 10)
    private String customerGender;

    public Customer() {
    }

    public Customer(Integer customerId) {
        this.customerId = customerId;
    }

    public Customer(Integer customerId, String customerUsername, String customerPassword) {
        this.customerId = customerId;
        this.customerUsername = customerUsername;
        this.customerPassword = customerPassword;
    }

    public Customer(String customerUsername, String customerPassword, String customerEmail, String customerFullname, String customerIcNo, String customerPhNo, String customerAddress, String customerGender) {
        this.customerUsername = customerUsername;
        this.customerPassword = customerPassword;
        this.customerEmail = customerEmail;
        this.customerFullname = customerFullname;
        this.customerIcNo = customerIcNo;
        this.customerPhNo = customerPhNo;
        this.customerAddress = customerAddress;
        this.customerGender = customerGender;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public String getCustomerUsername() {
        return customerUsername;
    }

    public void setCustomerUsername(String customerUsername) {
        this.customerUsername = customerUsername;
    }

    public String getCustomerPassword() {
        return customerPassword;
    }

    public void setCustomerPassword(String customerPassword) {
        this.customerPassword = customerPassword;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getCustomerFullname() {
        return customerFullname;
    }

    public void setCustomerFullname(String customerFullname) {
        this.customerFullname = customerFullname;
    }

    public String getCustomerIcNo() {
        return customerIcNo;
    }

    public void setCustomerIcNo(String customerIcNo) {
        this.customerIcNo = customerIcNo;
    }

    public String getCustomerPhNo() {
        return customerPhNo;
    }

    public void setCustomerPhNo(String customerPhNo) {
        this.customerPhNo = customerPhNo;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public String getCustomerGender() {
        return customerGender;
    }

    public void setCustomerGender(String customerGender) {
        this.customerGender = customerGender;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (customerId != null ? customerId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Customer)) {
            return false;
        }
        Customer other = (Customer) object;
        if ((this.customerId == null && other.customerId != null) || (this.customerId != null && !this.customerId.equals(other.customerId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Customer.Entity.Customer[ customerId=" + customerId + " ]";
    }

    @XmlTransient
    public List<OrderTable> getOrderTableList() {
        return orderTableList;
    }

    public void setOrderTableList(List<OrderTable> orderTableList) {
        this.orderTableList = orderTableList;
    }

    @XmlTransient
    public List<Feedback> getFeedbackList() {
        return feedbackList;
    }

    public void setFeedbackList(List<Feedback> feedbackList) {
        this.feedbackList = feedbackList;
    }
    
}
