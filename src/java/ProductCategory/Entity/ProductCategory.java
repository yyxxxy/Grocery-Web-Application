/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ProductCategory.Entity;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author user
 */
@Entity
@Table(name = "PRODUCT_CATEGORY", catalog = "", schema = "NBUSER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ProductCategory.findAll", query = "SELECT p FROM ProductCategory p")
    , @NamedQuery(name = "ProductCategory.findByProductCatId", query = "SELECT p FROM ProductCategory p WHERE p.productCatId = :productCatId")
    , @NamedQuery(name = "ProductCategory.findByProductCatName", query = "SELECT p FROM ProductCategory p WHERE p.productCatName = :productCatName")})
public class ProductCategory implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "PRODUCT_CAT_ID", nullable = false)
    private Integer productCatId;
    @Column(name = "PRODUCT_CAT_NAME", length = 255)
    private String productCatName;
    @Column(name = "PRODUCT_CAT_IMAGE", length = 255)
    private String productCatImage;
    @OneToMany(mappedBy = "fkProdCatId", cascade = CascadeType.ALL)
    private Collection<Product> productCollection;

    public ProductCategory() {
    }

    public ProductCategory(Integer productCatId) {
        this.productCatId = productCatId;
    }

    public ProductCategory(String productCatName) {
        this.productCatName = productCatName;
    }

    public ProductCategory(Integer productCatId, String productCatName) {
        this.productCatId = productCatId;
        this.productCatName = productCatName;
    }
    
    
    public Integer getProductCatId() {
        return productCatId;
    }

    public void setProductCatId(Integer productCatId) {
        this.productCatId = productCatId;
    }

    public String getProductCatName() {
        return productCatName;
    }

    public void setProductCatName(String productCatName) {
        this.productCatName = productCatName;
    }

    public String getProductCatImage() {
        return productCatImage;
    }

    public void setProductCatImage(String productCatImage) {
        this.productCatImage = productCatImage;
    }

    @XmlTransient
    public Collection<Product> getProductCollection() {
        return productCollection;
    }

    public void setProductCollection(Collection<Product> productCollection) {
        this.productCollection = productCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (productCatId != null ? productCatId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProductCategory)) {
            return false;
        }
        ProductCategory other = (ProductCategory) object;
        if ((this.productCatId == null && other.productCatId != null) || (this.productCatId != null && !this.productCatId.equals(other.productCatId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ProductCategory.Entity.ProductCategory[ productCatId=" + productCatId + " ]";
    }

}
