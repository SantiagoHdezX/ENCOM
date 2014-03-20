/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.hyenix.REST;

import org.json.*;
import java.sql.*;
import javax.ejb.Stateless;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.DELETE;
import javax.ws.rs.Path;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
/**
 *
 * @author santiago
 */
@Path("/Incidencias")
public class Incidencias {
    @Path("/RegistrarAsistencia")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public String RegistrarAsistencia(String srcInfo){
        JSONObject mensaje=new JSONObject();
        JSONObject src=new JSONObject(srcInfo);
        String nameEvento=src.getString("Nombre");
        String descrpt=src.getString("Descripcion");
        String fecha=src.getString("Fecha");
        String hora=src.getString("Hora");
        int duracion=src.getInt("Duracion");
        try{
            try{
                Class.forName("com.mysql.jdbc.Driver");
            }
            catch(ClassNotFoundException cnfEx){
                mensaje.put("Mensaje", "No se ha podido cargar el driver");
                mensaje.put("Registrado",false);
            }
            Connection conexion=DriverManager.getConnection("jdbc:mysql://localhost/ENCOM","root","n0m3l0");
            PreparedStatement query=conexion.prepareStatement("call registrarEventos(?,?,?,?,?,@)");
            query.setString(1,nameEvento);
        }
        catch(SQLException sqlEx){
            
        }
        
        
        return null;
    }
}

/*
RegistrarFaltas

*/