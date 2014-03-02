/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.hyenix.REST;

import org.json.*;
import java.sql.*;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 *
 * @author santiago
 */
@Path("/Resources")
public class Resources {
    /**
     *
     * @return
     */
    @Path("/HelloWorld")
    @GET
    public String HelloWorld(){
        return "Hola";
    }
    
    /**
     *
     * @param sourceInfo
     * @return
     */
    @Path("/RegistrarUsuario")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public String RegistrarUsuario(String sourceInfo)
    {
        JSONObject mensaje=new JSONObject();
        String correo=new JSONObject(sourceInfo).getString("correo");
        String password=new JSONObject(sourceInfo).getString("password");
        int id=new JSONObject(sourceInfo).getInt("id");
        String nombre=new JSONObject(sourceInfo).getString("nombre");
        String direccion=new JSONObject(sourceInfo).getString("direccion");
        try{
             try
            {
                Class.forName("com.mysql.jdbc.Driver");
            }
            catch(ClassNotFoundException cnfEx)
            {
                mensaje.put("Mensaje", "No se ha encontrado el driver");
            }
            Connection conexion=DriverManager.getConnection("jdbc:mysql://localhost/ENCOM","root","n0m3l0");
            Statement st=conexion.createStatement();
            st.executeUpdate("INSERT INTO usuarios(correo,password,id,nombre,direccion) VALUES('"+correo+"','"+password+"',"+id+",'"+nombre+"','"+direccion+"');");
            mensaje.put("Mensaje", "Se ha registrado el usuario con el correo "+correo);
        }
        catch(SQLException sqlEx)
        {
            mensaje.put("Mensaje", "Ha ocurrido un problema");
        }
        return mensaje.toString();
    }
    /**
     *
     * @param sourceInfo
     * @return
     */
    @Path("/IniciarSesion")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public String IniciarSesion(String sourceInfo){
        JSONObject mensaje=new JSONObject();
        String correo=new JSONObject(sourceInfo).getString("correo");
        String password=new JSONObject(sourceInfo).getString("password");
        try{
             try
            {
                Class.forName("com.mysql.jdbc.Driver");
            }
            catch(ClassNotFoundException cnfEx)
            {
                mensaje.put("Sesion", false);
                mensaje.put("Mensaje", "No se ha encontrado el driver");
            }
            Connection conexion=DriverManager.getConnection("jdbc:mysql://localhost/ENCOM","root","n0m3l0");
            PreparedStatement query = conexion.prepareStatement("SELECT * FROM usuarios WHERE correo=? AND password=?"); 
            query.setString(1, correo); 
            query.setString(2, password); 
            ResultSet rset = query.executeQuery();
            if(rset.next())
            {
                mensaje.put("Sesion", true);
                mensaje.put("Mensaje","Has iniciado sesion");
            }
            else{
                mensaje.put("Sesion", false);
                mensaje.put("Mensaje", "No se ha encontrado el usuario");
            }
        }
        catch(SQLException sqlEx)
        {
            mensaje.put("Sesion", false);
            mensaje.put("Mensaje", "Ha ocurrido un problema");
        }
        return mensaje.toString();
        
    }
}
