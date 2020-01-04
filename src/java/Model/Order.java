/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author acapd
 */
public class Order {
    private int id;
    private String user_email;
    private String pname;
    private int quantity;
    private double price;
    private double total_price;
    private String status;

 


    public int getId() {
        return id;
    }

    public String getUser_email() {
        return user_email;
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
    
   public double getTotal_price() {
        return total_price;
    }
    
    public String getStatus() {
        return status;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
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
    
    public void setTotal_price(double total_price) {
        this.total_price = total_price;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
