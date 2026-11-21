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

  public record ConnectionResult(
      boolean connected,
      Statement statement,
      String message) {
  }

  public ConnectionResult connectToDb() {
    try {
      Connection connection = DriverManager.getConnection(url, user, password);
      Statement statement = connection.createStatement();
      return new ConnectionResult(true, statement, "Conexión a base de datos exitosa");
    } catch (Exception e) {
      e.printStackTrace();
      return new ConnectionResult(false, null, "ERROR: no se pudo conectar a la base de datos - " + e.getMessage());
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
