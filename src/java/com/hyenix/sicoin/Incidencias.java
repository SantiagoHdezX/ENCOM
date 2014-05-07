/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hyenix.sicoin;

import java.sql.CallableStatement;
import java.sql.Connection;
import org.json.*;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
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
            Connection conn = DataConn.connect();
            CallableStatement cs = conn.prepareCall("CALL obtenerDia(?,?)");
            cs.setInt(1, idProfesor);
            cs.registerOutParameter(2, java.sql.Types.BOOLEAN);
            cs.execute();
            boolean confirmacion=cs.getBoolean(2);               
                    
        } catch (SQLException sqlEx) {

        }
        return null;
    }
}

/*
RegistrarFaltas

*/
