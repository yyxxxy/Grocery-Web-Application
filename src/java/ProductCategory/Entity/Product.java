/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ProductCategory.Entity;

import BuyEntity.Feedback;
import BuyEntity.OrderTable;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
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
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author user
 */
@Entity
@Table(name = "PRODUCT", catalog = "", schema = "NBUSER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p")
    , @NamedQuery(name = "Product.findByProductId", query = "SELECT p FROM Product p WHERE p.productId = :productId")
    , @NamedQuery(name = "Product.findByProductName", query = "SELECT p FROM Product p WHERE p.productName = :productName")
    , @NamedQuery(name = "Product.findByProductPrice", query = "SELECT p FROM Product p WHERE p.productPrice = :productPrice")
    , @NamedQuery(name = "Product.findByProductQty", query = "SELECT p FROM Product p WHERE p.productQty = :productQty")
    , @NamedQuery(name = "Product.findByProductDesc", query = "SELECT p FROM Product p WHERE p.productDesc = :productDesc")
    , @NamedQuery(name = "Product.findByProductImage", query = "SELECT p FROM Product p WHERE p.productImage = :productImage")})
public class Product implements Serializable {

    @OneToMany(mappedBy = "fkProductId")
    private List<Feedback> feedbackList;

    @OneToMany(mappedBy = "ckProductId")
    private List<OrderTable> orderTableList;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "PRODUCT_ID", nullable = false)
    private Integer productId;
    @Column(name = "PRODUCT_NAME", length = 255)
    private String productName;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "PRODUCT_PRICE", precision = 52)
    private Double productPrice;
    @Column(name = "PRODUCT_QTY")
    private Integer productQty;
    @Column(name = "PRODUCT_DESC", length = 255)
    private String productDesc;
    @Column(name = "PRODUCT_IMAGE", length = 199)
    private String productImage;
    @JoinColumn(name = "FK_PROD_CAT_ID", referencedColumnName = "PRODUCT_CAT_ID")
    @ManyToOne(cascade = CascadeType.ALL)
    private ProductCategory fkProdCatId;

    public Product() {
    }

    public Product(Integer productId, String productName, Double productPrice, Integer productQty, String productDesc, String productImage, ProductCategory fkProdCatId) {
        this.productId = productId;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productQty = productQty;
        this.productDesc = productDesc;
        this.productImage = productImage;
        this.fkProdCatId = fkProdCatId;
    }

    public Product(Integer productId) {
        this.productId = productId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(Double productPrice) {
        this.productPrice = productPrice;
    }

    public Integer getProductQty() {
        return productQty;
    }

    public void setProductQty(Integer productQty) {
        this.productQty = productQty;
    }

    public String getProductDesc() {
        return productDesc;
    }

    public void setProductDesc(String productDesc) {
        this.productDesc = productDesc;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public ProductCategory getFkProdCatId() {
        return fkProdCatId;
    }

    public void setFkProdCatId(ProductCategory fkProdCatId) {
        this.fkProdCatId = fkProdCatId;
    }

//    calculate total
    public double calculateTotalAmount(double price, int quantity) {
        return price * (double) quantity;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (productId != null ? productId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Product)) {
            return false;
        }
        Product other = (Product) object;
        if ((this.productId == null && other.productId != null) || (this.productId != null && !this.productId.equals(other.productId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ProductCategory.Entity.Product[ productId=" + productId + " ]";
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
