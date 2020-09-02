/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import static controllers.dbConnection.getConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Primary Office
 */
public class vehicleRegistration {

    
    private String userID;
    private String brand;
    private String chassisnumber;
    private String engineNumber;
    private String typeOfVehicle;
    private String manufactureYear;
    private String floodCover;
    private String passengerCover;
    private double total;
    private String vehicleId;
    private String vehicleNumber;
    
    private int vehicleStatus=0;//default it get 0
    
    public vehicleRegistration(){
        
    }
    
    public vehicleRegistration(String userID, String brand, String chassisnumber, String engineNumber, String typeOfVehicle, String manufactureYear, String floodCover, String passengerCover, double total, String vehicleId, String vehicleNumber, int vehicleStatus) {
        this.userID = userID;
        this.brand = brand;
        this.chassisnumber = chassisnumber;
        this.engineNumber = engineNumber;
        this.typeOfVehicle = typeOfVehicle;
        this.manufactureYear = manufactureYear;
        this.floodCover = floodCover;
        this.passengerCover = passengerCover;
        this.total = total;
        this.vehicleId = vehicleId;
        this.vehicleNumber = vehicleNumber;
        this.vehicleStatus = vehicleStatus;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getChassisnumber() {
        return chassisnumber;
    }

    public void setChassisnumber(String chassisnumber) {
        this.chassisnumber = chassisnumber;
    }

    public String getEngineNumber() {
        return engineNumber;
    }

    public void setEngineNumber(String engineNumber) {
        this.engineNumber = engineNumber;
    }

    public String getTypeOfVehicle() {
        return typeOfVehicle;
    }

    public void setTypeOfVehicle(String typeOfVehicle) {
        this.typeOfVehicle = typeOfVehicle;
    }

    public String getManufactureYear() {
        return manufactureYear;
    }

    public void setManufactureYear(String manufactureYear) {
        this.manufactureYear = manufactureYear;
    }

    public String getFloodCover() {
        return floodCover;
    }

    public void setFloodCover(String floodCover) {
        this.floodCover = floodCover;
    }

    public String getPassengerCover() {
        return passengerCover;
    }

    public void setPassengerCover(String passengerCover) {
        this.passengerCover = passengerCover;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(String vehicleId) {
        this.vehicleId = vehicleId;
    }

    public String getVehicleNumber() {
        return vehicleNumber;
    }

    public void setVehicleNumber(String vehicleNumber) {
        this.vehicleNumber = vehicleNumber;
    }

    public int getVehicleStatus() {
        return vehicleStatus;
    }

    public void setVehicleStatus(int vehicleStatus) {
        this.vehicleStatus = vehicleStatus;
    }


    
    
    public int saveRegistration() throws SQLException, ClassNotFoundException {

        Connection con = getConnection();
        Statement stmt = null;

//        String queryString = "INSERT INTO `vehicle registration` (`Brand`, `Chassis number`, `Engine number`, `Type of vehicle`, `Manufacture Year`, `Flood Cover`, `Passenger`) "
//                + " VALUES ('"+this.brand+"', '"+this.chassisnumber+"', '"+this.engineNumber+"', '"+this.typeOfVehicle+"',"
//                + " '"+this.manufactureYear+"', '"+this.floodCover+"', '"+this.passengerCover+"');";
       
//                                                                                                                                                                                 `vehicleNumber`        
        String queryString = "INSERT INTO `vehicle_reg` (`UserID`,`Brand`, `Chassis number`, `Engine number`, `Type of vehicle`, `Manufacture Year`, `Flood Cover`, `Passenger`,`total`,`Vehicle_Number`,`vehicle_status`) "
                + " VALUES ('" + this.userID + "','" + this.brand + "', '" + this.chassisnumber + "', '" + this.engineNumber + "', '" + this.typeOfVehicle + "',"
                + " '" + this.manufactureYear + "', '" + this.floodCover + "', '" + this.passengerCover + "', '" + this.total + "', '" + this.vehicleNumber + "',"+this.vehicleStatus+");";//, '" + this.vehicleNumber + "'

        //System.out.println(queryString);
        stmt = con.createStatement();  // creating the statement object to work with 									

        int i = stmt.executeUpdate(queryString);   // returns an integer - number of 										
        return i;
    }
    
     public int makePaidVehicle(String vehicle_id) throws SQLException, ClassNotFoundException {

        Connection con = getConnection();
        Statement stmt = null;
                                                                                                                                                                                  
        String queryString ="UPDATE `vehicle_reg` SET vehicle_status='0' WHERE VehicleId='"+vehicle_id+"'";

        //System.out.println(queryString);
        stmt = con.createStatement();  // creating the statement object to work with 									

        int i = stmt.executeUpdate(queryString);   // returns an integer - number of 										
        return i;
    }
     
     public int addNewBalance(String vehicle_id, String balance) throws SQLException, ClassNotFoundException {

        Connection con = getConnection();
        Statement stmt = null;
                                                                                                                                                                                  
        String queryString ="UPDATE `vehicle_reg` SET total='"+balance+"' WHERE VehicleId='"+vehicle_id+"'";

        //System.out.println(queryString);
        stmt = con.createStatement();  // creating the statement object to work with 									

        int i = stmt.executeUpdate(queryString);   // returns an integer - number of 										
        return i;
    }
    
    
    public static ArrayList<vehicleRegistration> getAllRegistrationById(String userId) throws SQLException {
        ArrayList<vehicleRegistration> results = new ArrayList<vehicleRegistration>();//Dynamic Array
        Connection con = getConnection();
        Statement statement = con.createStatement();
        String sql = "SELECT * FROM vehicle_reg WHERE UserID="+userId+";";
        ResultSet resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
            vehicleRegistration curtReg = new vehicleRegistration();
            curtReg.setUserID(resultSet.getString("userId"));
            curtReg.setBrand(resultSet.getString("Brand"));
            curtReg.setChassisnumber(resultSet.getString("Chassis number"));
            curtReg.setEngineNumber(resultSet.getString("Engine number"));
            curtReg.setVehicleId(resultSet.getString("VehicleId"));
            curtReg.setTypeOfVehicle(resultSet.getString("Type of vehicle"));
            curtReg.setFloodCover(resultSet.getString("Flood Cover"));
            curtReg.setManufactureYear(resultSet.getString("Manufacture Year"));
            curtReg.setPassengerCover(resultSet.getString("Passenger"));
            curtReg.setTotal(resultSet.getDouble("total"));
            curtReg.setVehicleNumber(resultSet.getString("Vehicle_Number"));
            curtReg.setVehicleStatus(resultSet.getInt("vehicle_status"));
            results.add(curtReg);
        }
        
        return results;
    }
    
}
