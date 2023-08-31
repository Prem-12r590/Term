/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

/**
 *
 * @author kuldeep kumar
 */
public class Department {

    private int id;
    private String depid;
    private String name;

    public Department() {
    }

    public Department(int id, String depid, String name) {
        this.id = id;
        this.depid = depid;
        this.name = name;
    }

    public Department(String depid, String name) {

        this.depid = depid;
        this.name = name;
    }

    public String getDepid() {
        return depid;
    }

    public void setDepid(String depid) {
        this.depid = depid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
