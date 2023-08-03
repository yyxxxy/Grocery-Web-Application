/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BuyEntity;

import Customer.Entity.Customer;
import ProductCategory.Entity.Product;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author user
 */
@Entity
@Table(name = "ORDER_TABLE", catalog = "", schema = "NBUSER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "OrderTable.findAll", query = "SELECT o FROM OrderTable o")
    , @NamedQuery(name = "OrderTable.findByOrderId", query = "SELECT o FROM OrderTable o WHERE o.orderId = :orderId")
    , @NamedQuery(name = "OrderTable.findByOrderUuid", query = "SELECT o FROM OrderTable o WHERE o.orderUuid = :orderUuid")
    , @NamedQuery(name = "OrderTable.findByOrderReceiveName", query = "SELECT o FROM OrderTable o WHERE o.orderReceiveName = :orderReceiveName")
    , @NamedQuery(name = "OrderTable.findByOrderAddress", query = "SELECT o FROM OrderTable o WHERE o.orderAddress = :orderAddress")
    , @NamedQuery(name = "OrderTable.findByOrderPaymentAmount", query = "SELECT o FROM OrderTable o WHERE o.orderPaymentAmount = :orderPaymentAmount")
    , @NamedQuery(name = "OrderTable.findByOrderStatus", query = "SELECT o FROM OrderTable o WHERE o.orderStatus = :orderStatus")
    , @NamedQuery(name = "OrderTable.findByOrderQty", query = "SELECT o FROM OrderTable o WHERE o.orderQty = :orderQty")})
public class OrderTable implements Serializable {

    @Column(name = "ORDER_DATE")
    @Temporal(TemporalType.DATE)
    private Date orderDate;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ORDER_ID", nullable = false)
    private Integer orderId;
    @Column(name = "ORDER_UUID", length = 255)
    private String orderUuid;
    @Column(name = "ORDER_RECEIVE_NAME", length = 255)
    private String orderReceiveName;
    @Column(name = "ORDER_ADDRESS", length = 255)
    private String orderAddress;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "ORDER_PAYMENT_AMOUNT", precision = 52)
    private Double orderPaymentAmount;
    @Column(name = "ORDER_STATUS", length = 25)
    private String orderStatus;
    @Column(name = "ORDER_QTY")
    private Integer orderQty;
    @OneToMany(mappedBy = "fkOrderId")
    private List<Payment> paymentList;
    @JoinColumn(name = "CK_CUSTOMER_ID", referencedColumnName = "CUSTOMER_ID")
    @ManyToOne
    private Customer ckCustomerId;
    @JoinColumn(name = "CK_PRODUCT_ID", referencedColumnName = "PRODUCT_ID")
    @ManyToOne
    private Product ckProductId;

    public OrderTable() {
    }

    public OrderTable(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getOrderUuid() {
        return orderUuid;
    }

    public void setOrderUuid(String orderUuid) {
        this.orderUuid = orderUuid;
    }

    public String getOrderReceiveName() {
        return orderReceiveName;
    }

    public void setOrderReceiveName(String orderReceiveName) {
        this.orderReceiveName = orderReceiveName;
    }

    public String getOrderAddress() {
        return orderAddress;
    }

    public void setOrderAddress(String orderAddress) {
        this.orderAddress = orderAddress;
    }

    public Double getOrderPaymentAmount() {
        return orderPaymentAmount;
    }

    public void setOrderPaymentAmount(Double orderPaymentAmount) {
        this.orderPaymentAmount = orderPaymentAmount;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Integer getOrderQty() {
        return orderQty;
    }

    public void setOrderQty(Integer orderQty) {
        this.orderQty = orderQty;
    }

    @XmlTransient
    public List<Payment> getPaymentList() {
        return paymentList;
    }

    public void setPaymentList(List<Payment> paymentList) {
        this.paymentList = paymentList;
    }

    public Customer getCkCustomerId() {
        return ckCustomerId;
    }

    public void setCkCustomerId(Customer ckCustomerId) {
        this.ckCustomerId = ckCustomerId;
    }

    public Product getCkProductId() {
        return ckProductId;
    }

    public void setCkProductId(Product ckProductId) {
        this.ckProductId = ckProductId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderId != null ? orderId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderTable)) {
            return false;
        }
        OrderTable other = (OrderTable) object;
        if ((this.orderId == null && other.orderId != null) || (this.orderId != null && !this.orderId.equals(other.orderId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "BuyEntity.OrderTable[ orderId=" + orderId + " ]";
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
    
}
