/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

/**
 *
 * @author VIVEKJHA
 */
public class Desigantion {

    private int id;
    private String designationId;
    private String designation;
    private String department;

    public Desigantion() {
    }

    public Desigantion(int id, String designationId, String designation, String department) {
        this.id = id;
        this.designationId = designationId;
        this.designation = designation;
        this.department = department;
    }

    public Desigantion(String designationId, String designation, String department) {
        this.designationId = designationId;
        this.designation = designation;
        this.department = department;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDesignationId() {
        return designationId;
    }

    public void setDesignationId(String designationId) {
        this.designationId = designationId;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

}
