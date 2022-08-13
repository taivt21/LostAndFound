/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fu.ex.DBConnect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author ADMIN
 */
public class DBConnect {
//    public static void DBconnect(){
//         try {
//            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "23072001");
//            System.out.println("Connected With the database successfully"); //Message after successful connection
//        } catch (SQLException e) {
//            System.out.println("Error while connecting to the database"); //Message if something goes wrong while conneting to the database
//        }
//    }
    public Connection getConnection() throws Exception {
        String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userID, password);
    }

    private final String serverName = "localhost";
    private final String portNumber = "1433";
    private final String dbName = "LnF";
    private final String userID = "sa";
    private final String password = "sa";
}
