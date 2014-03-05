/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.hyenix.REST;

import java.sql.*;
import org.json.*;
import javax.ws.rs.*;

/**
 *
 * @author santiago
 */
@Path("/Horarios")
public class Horarios {
    @Path("/RegistrarHorario")
    @POST
    public String RegistrarUsuarios(String sourceInfo){
        JSONObject mensaje=new JSONObject();
        try{
             try
            {
                Class.forName("com.mysql.jdbc.Driver");
            }
            catch(ClassNotFoundException cnfEx)
            {
                mensaje.put("Registrado", false);
                mensaje.put("Mensaje", "No se ha encontrado el driver");
            }
            Connection conexion=DriverManager.getConnection("jdbc:mysql://localhost/ENCOM","root","n0m3l0");
            Statement st=conexion.createStatement();
            PreparedStatement query=conexion.prepareStatement("SELECT nombre FROM usuarios WHERE correo=?");
            query.setString(1,correo);
            ResultSet rset = query.executeQuery();
            if(rset.next())
            {
                mensaje.put("Registrado", false);
                mensaje.put("Mensaje", "Ya existe un usuario registrado con el correo "+correo);
            }
            else
            {
                st.executeUpdate("INSERT INTO usuarios(correo,password,id,nombre,direccion,administrador) VALUES('"+correo+"','"+password+"',"+id+",'"+nombre+"','"+direccion+"',"+administrador+");");
                mensaje.put("Mensaje", "Se ha registrado el usuario con el correo "+correo);
                mensaje.put("Registrado", true);
            }
        }catch(SQLException sqlEx){
            
        }
        return null;
    }
}
