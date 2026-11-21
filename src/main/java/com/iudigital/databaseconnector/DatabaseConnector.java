/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.iudigital.databaseconnector;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author cavelasco
 */
public class DatabaseConnector {

  private static String url = "";
  private static String user = "";
  private static String password = "";
  
  
  public DatabaseConnector(String url, String user, String password) {
    DatabaseConnector.url = url;
    DatabaseConnector.user = user;
    DatabaseConnector.password = password;
  }

  public void connectToDb() {
    try (Connection connection = DriverManager.getConnection(url, user, password);) {
      System.out.println("La conexión a la base de datos, fué exitosa");
      Statement statement = connection.createStatement();
      ResultSet resultSet = statement.executeQuery("SELECT * from cliente");

      while (resultSet.next()) {
        System.out.println(
            resultSet.getInt("ID_cliente") + " " + resultSet.getString("nombre_cliente") + " vive en: "
                + resultSet.getString("pais"));
      }

    } catch (Exception e) {
      System.out.println("La conexión con MySQL falló: " + e.getMessage());
      e.printStackTrace();
    }
  }

  public static String getUrl() {
    return url;
  }

  public static String getUser() {
    return user;
  }

  public static String getPassword() {
    return password;
  }

  public static void setUrl(String url) {
    DatabaseConnector.url = url;
  }

  public static void setUser(String user) {
    DatabaseConnector.user = user;
  }

  public static void setPassword(String password) {
    DatabaseConnector.password = password;
  };
}
