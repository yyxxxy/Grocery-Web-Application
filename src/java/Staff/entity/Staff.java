/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Staff.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author user
 */
@Entity
@Table(catalog = "", schema = "NBUSER", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"STAFF_USERNAME"})})
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Staff.findAll", query = "SELECT s FROM Staff s")
    , @NamedQuery(name = "Staff.findByStaffId", query = "SELECT s FROM Staff s WHERE s.staffId = :staffId")
    , @NamedQuery(name = "Staff.findByStaffUsername", query = "SELECT s FROM Staff s WHERE s.staffUsername = :staffUsername")
    , @NamedQuery(name = "Staff.findByStaffPassword", query = "SELECT s FROM Staff s WHERE s.staffPassword = :staffPassword")
    , @NamedQuery(name = "Staff.findByStaffEmail", query = "SELECT s FROM Staff s WHERE s.staffEmail = :staffEmail")
    , @NamedQuery(name = "Staff.findByStaffFullname", query = "SELECT s FROM Staff s WHERE s.staffFullname = :staffFullname")
    , @NamedQuery(name = "Staff.findByStaffIcNo", query = "SELECT s FROM Staff s WHERE s.staffIcNo = :staffIcNo")
    , @NamedQuery(name = "Staff.findByStaffPhNo", query = "SELECT s FROM Staff s WHERE s.staffPhNo = :staffPhNo")
    , @NamedQuery(name = "Staff.findByStaffAddress", query = "SELECT s FROM Staff s WHERE s.staffAddress = :staffAddress")
    , @NamedQuery(name = "Staff.findByStaffGender", query = "SELECT s FROM Staff s WHERE s.staffGender = :staffGender")})
public class Staff implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "STAFF_ID", nullable = false)
    private Integer staffId;
    @Basic(optional = false)
    @Column(name = "STAFF_USERNAME", nullable = false, length = 30)
    private String staffUsername;
    @Basic(optional = false)
    @Column(name = "STAFF_PASSWORD", nullable = false, length = 30)
    private String staffPassword;
    @Column(name = "STAFF_EMAIL", length = 255)
    private String staffEmail;
    @Column(name = "STAFF_FULLNAME", length = 255)
    private String staffFullname;
    @Column(name = "STAFF_IC_NO", length = 255)
    private String staffIcNo;
    @Column(name = "STAFF_PH_NO", length = 255)
    private String staffPhNo;
    @Column(name = "STAFF_ADDRESS", length = 255)
    private String staffAddress;
    @Column(name = "STAFF_GENDER", length = 10)
    private String staffGender;

    public Staff() {
    }

    public Staff(Integer staffId) {
        this.staffId = staffId;
    }

    public Staff(Integer staffId, String staffUsername, String staffPassword) {
        this.staffId = staffId;
        this.staffUsername = staffUsername;
        this.staffPassword = staffPassword;
    }

    public Integer getStaffId() {
        return staffId;
    }

    public void setStaffId(Integer staffId) {
        this.staffId = staffId;
    }

    public String getStaffUsername() {
        return staffUsername;
    }

    public void setStaffUsername(String staffUsername) {
        this.staffUsername = staffUsername;
    }

    public String getStaffPassword() {
        return staffPassword;
    }

    public void setStaffPassword(String staffPassword) {
        this.staffPassword = staffPassword;
    }

    public String getStaffEmail() {
        return staffEmail;
    }

    public void setStaffEmail(String staffEmail) {
        this.staffEmail = staffEmail;
    }

    public String getStaffFullname() {
        return staffFullname;
    }

    public void setStaffFullname(String staffFullname) {
        this.staffFullname = staffFullname;
    }

    public String getStaffIcNo() {
        return staffIcNo;
    }

    public void setStaffIcNo(String staffIcNo) {
        this.staffIcNo = staffIcNo;
    }

    public String getStaffPhNo() {
        return staffPhNo;
    }

    public void setStaffPhNo(String staffPhNo) {
        this.staffPhNo = staffPhNo;
    }

    public String getStaffAddress() {
        return staffAddress;
    }

    public void setStaffAddress(String staffAddress) {
        this.staffAddress = staffAddress;
    }

    public String getStaffGender() {
        return staffGender;
    }

    public void setStaffGender(String staffGender) {
        this.staffGender = staffGender;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (staffId != null ? staffId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Staff)) {
            return false;
        }
        Staff other = (Staff) object;
        if ((this.staffId == null && other.staffId != null) || (this.staffId != null && !this.staffId.equals(other.staffId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Staff.entity.Staff[ staffId=" + staffId + " ]";
    }
    
}
