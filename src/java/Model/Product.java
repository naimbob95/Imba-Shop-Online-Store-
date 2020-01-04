/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Blob;

/**
 *
 * @author User
 */
public class Product {

    private int id;
    private String pname;
    private int quantity;
    private double price;
    private Blob photo;

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", pname=" + pname + ", quantity=" + quantity + ", price=" + price + ", photo=" + photo + '}';
    }

    public void setPhoto(Blob photo) {
        this.photo = photo;
    }

    public Blob getPhoto() {
        return photo;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public String getPname() {
        return pname;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getPrice() {
        return price;
    }

}
