/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BuyEntity;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author user
 */
@Entity
@Table(catalog = "", schema = "NBUSER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Payment.findAll", query = "SELECT p FROM Payment p")
    , @NamedQuery(name = "Payment.findByPaymentId", query = "SELECT p FROM Payment p WHERE p.paymentId = :paymentId")
    , @NamedQuery(name = "Payment.findByPaymentName", query = "SELECT p FROM Payment p WHERE p.paymentName = :paymentName")
    , @NamedQuery(name = "Payment.findByCerditCardNumber", query = "SELECT p FROM Payment p WHERE p.cerditCardNumber = :cerditCardNumber")
    , @NamedQuery(name = "Payment.findByExpMonth", query = "SELECT p FROM Payment p WHERE p.expMonth = :expMonth")
    , @NamedQuery(name = "Payment.findByCcv", query = "SELECT p FROM Payment p WHERE p.ccv = :ccv")
    , @NamedQuery(name = "Payment.findByExpYear", query = "SELECT p FROM Payment p WHERE p.expYear = :expYear")
    , @NamedQuery(name = "Payment.findByPaymentDate", query = "SELECT p FROM Payment p WHERE p.paymentDate = :paymentDate")})
public class Payment implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "PAYMENT_ID", nullable = false)
    private Integer paymentId;
    @Column(name = "PAYMENT_NAME", length = 255)
    private String paymentName;
    @Column(name = "CERDIT_CARD_NUMBER", length = 255)
    private String cerditCardNumber;
    @Column(name = "EXP_MONTH", length = 255)
    private String expMonth;
    @Column(length = 10)
    private String ccv;
    @Column(name = "EXP_YEAR", length = 10)
    private String expYear;
    @Column(name = "PAYMENT_DATE")
    @Temporal(TemporalType.DATE)
    private Date paymentDate;
    @JoinColumn(name = "FK_ORDER_ID", referencedColumnName = "ORDER_ID")
    @ManyToOne
    private OrderTable fkOrderId;

    public Payment() {
    }

    public Payment(Integer paymentId) {
        this.paymentId = paymentId;
    }

    public Integer getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(Integer paymentId) {
        this.paymentId = paymentId;
    }

    public String getPaymentName() {
        return paymentName;
    }

    public void setPaymentName(String paymentName) {
        this.paymentName = paymentName;
    }

    public String getCerditCardNumber() {
        return cerditCardNumber;
    }

    public void setCerditCardNumber(String cerditCardNumber) {
        this.cerditCardNumber = cerditCardNumber;
    }

    public String getExpMonth() {
        return expMonth;
    }

    public void setExpMonth(String expMonth) {
        this.expMonth = expMonth;
    }

    public String getCcv() {
        return ccv;
    }

    public void setCcv(String ccv) {
        this.ccv = ccv;
    }

    public String getExpYear() {
        return expYear;
    }

    public void setExpYear(String expYear) {
        this.expYear = expYear;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public OrderTable getFkOrderId() {
        return fkOrderId;
    }

    public void setFkOrderId(OrderTable fkOrderId) {
        this.fkOrderId = fkOrderId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (paymentId != null ? paymentId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Payment)) {
            return false;
        }
        Payment other = (Payment) object;
        if ((this.paymentId == null && other.paymentId != null) || (this.paymentId != null && !this.paymentId.equals(other.paymentId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "BuyEntity.Payment[ paymentId=" + paymentId + " ]";
    }

}
