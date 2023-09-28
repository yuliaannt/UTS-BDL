/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datamanagerbuku;

import datamanagerbuku.database.ConnectionHelper;
import java.sql.SQLException;
/**
 *
 * @author yuliaananta
 */
public class DataManagerBuku {
    public static void main(String[] args) {
      // TODO code application logic here
        testConnection();
    }
 
    private static void testConnection() {
        try {
            ConnectionHelper.getConnection();
            System.out.println("Database connected");
        } catch (SQLException ex) {
            System.out.println("Failed to connect database");
        }  
    }
 
}
