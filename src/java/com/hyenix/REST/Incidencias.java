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
    public String RegistrarAsistencia(String srcInfo) {
        JSONObject mensaje = new JSONObject();
        JSONObject src = new JSONObject(srcInfo);
        int idProfesor=src.getInt("ID");
        try {
            Connection conexion = DataConn.connect();
            CallableStatement query = conexion.prepareCall("call registrarAsistencia(?,?)");
            query.setInt(1, idProfesor);
            query.registerOutParameter(2, java.sql.Types.BOOLEAN);
            
        } catch (SQLException sqlEx) {

        }
        return null;
    }
}

/*
RegistrarFaltas

*/
