/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import static controllers.dbConnection.getConnection;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Primary Office
 */
public class paymentRegistration {

    private long paymentId;
    private double amount;
    private String nameOnTheCard;
    private long cardNumber;
    private int csv;
    private String dateOfExpire;
    private int paid;
    private String userID;
    private String vehicle_Id;

    public paymentRegistration() {

    }

    public paymentRegistration(long paymentId, double amount, String nameOnTheCard,long cardNumber, int csv, String dateOfExpire, int paid, String userID, String vehicle_Id) {
        this.paymentId = paymentId;
        this.amount = amount;
        this.nameOnTheCard = nameOnTheCard;
        this.cardNumber= cardNumber;
        this.csv = csv;
        this.dateOfExpire = dateOfExpire;
        this.paid = paid;
        this.userID = userID;
        this.vehicle_Id = vehicle_Id;
    }

    public long getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(long cardNumber) {
        this.cardNumber = cardNumber;
    }

    public long getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(long paymentId) {
        this.paymentId = paymentId;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getNameOnTheCard() {
        return nameOnTheCard;
    }

    public void setNameOnTheCard(String nameOnTheCard) {
        this.nameOnTheCard = nameOnTheCard;
    }

    public int getCsv() {
        return csv;
    }

    public void setCsv(int csv) {
        this.csv = csv;
    }

    public String getDateOfExpire() {
        return dateOfExpire;
    }

    public void setDateOfExpire(String dateOfExpire) {
        this.dateOfExpire = dateOfExpire;
    }

    public int getPaid() {
        return paid;
    }

    public void setPaid(int paid) {
        this.paid = paid;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getVehicle_Id() {
        return vehicle_Id;
    }

    public void setVehicle_Id(String vehicle_Id) {
        this.vehicle_Id = vehicle_Id;
    }

    public int savePayment() throws SQLException, ClassNotFoundException {

        Connection con = getConnection();
        Statement stmt = null;
        System.out.println(userID + paymentId + dateOfExpire + csv + amount);
        String queryString = "INSERT INTO `payment` (`payment_id`, `Amount`, `Name on the Card`, `CSV`, `Date of Expire`,`paid`,`UserID`,`vehicle_Id`) "
                + " VALUES ('" + this.paymentId + "', '" + this.amount + "', '" + this.nameOnTheCard + "', '" + this.csv + "',"
                + " '" + this.dateOfExpire + "','" + this.paid + "','" + this.userID + "','" + this.vehicle_Id + "');";

        //System.out.println(queryString);
        stmt = con.createStatement();  // creating the statement object to work with 									

        int i = stmt.executeUpdate(queryString);   // returns an integer - number of 										
        return i;
    }

}
