/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hyenix.sicoin;

import java.io.File;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import org.json.*;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Types;
import javax.ejb.Stateless;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Consumes;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 *
 * @author santiago
 */
@Stateless
@Path("/Incidencias")
public class Incidencias {

    @Path("/RegistrarAsistencia")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public String RegistrarAsistencia(String srcInfo) {
        JSONObject mensaje = new JSONObject();
        JSONObject src = new JSONObject(srcInfo);
        String nullHour = "00:00:00";
        int idProfesor = src.getInt("Profesor");
        try {
            Connection conn = DataConn.connect();
            CallableStatement cs = conn.prepareCall("CALL obtenerHorarioAsistencia(?,?,?)");
            cs.setInt(1, idProfesor);
            cs.registerOutParameter(2, Types.BOOLEAN);
            cs.registerOutParameter(3, Types.NVARCHAR);
            cs.execute();
            if (cs.getBoolean(2)) {
                ResultSet rs = cs.getResultSet();
                while (rs.next()) {
                    String horaObtenida = rs.getTime("Entrada").toString();
                    if ((java.sql.Time.valueOf(horaObtenida)).equals(java.sql.Time.valueOf(nullHour))) {
                        continue;
                    } else {
                        CallableStatement cs2 = conn.prepareCall("CALL RegistrarAsistencia(?,?,?)");
                        cs2.setInt(1, idProfesor);
                        cs.setTime(2, Time.valueOf(horaObtenida));
                        cs.registerOutParameter(3, Types.NVARCHAR);
                        cs.execute();
                        String temporal = cs.getString(3);
                        mensaje.put("Mensaje", temporal);
                        break;
                    }

                }
            } else {
                mensaje.put("Mensaje", cs.getString(3));
            }

        } catch (SQLException sqlEx) {
            mensaje.put("Mensaje", "Ha ocurrido un problema con la base de datos");
        }
        return mensaje.toString();
    }

    /*Consumir este es sencillo, no tienes qe enviar data, solo tienes que hacer esto en el URI
     url: http://localhost:8080/ENCOM/API/Incidencias/"+jquery.(#datoformulario).val();
    
     ;)
     */
    @Path("/search/asistencia/{idProfesor}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String ObtenerAsistencia(@PathParam("idProfesor") int idProfesor) {
        JSONObject mensaje = new JSONObject();
        try {
            Connection conn = DataConn.connect();
            CallableStatement cs = conn.prepareCall("Call ObtenerIncidencias(?,?)");
            cs.setInt(1, idProfesor);
            cs.registerOutParameter(2, Types.BOOLEAN);
            cs.execute();
            if (cs.getBoolean(2)) {
                ResultSet rset = cs.getResultSet();
                JSONArray temporal = new JSONArray();
                while (rset.next()) {
                    JSONObject objTemporal = new JSONObject();
                    objTemporal.put("Dia", rset.getDate("Dia"));
                    objTemporal.put("Hora", rset.getTime("Hora"));
                    if (rset.getBoolean("Asistencia")) {
                        objTemporal.put("Type", "Asistencia");
                    } else if (rset.getBoolean("Retardo")) {
                        objTemporal.put("Type", "Retardo");
                    } else if (rset.getBoolean("Falta")) {
                        objTemporal.put("Type", "Falta");
                    }
                    temporal.put(objTemporal);
                }
                mensaje.put("Exito", true);
                mensaje.put("Incidencias", temporal);
            } else {
                mensaje.put("Exito", false);
                mensaje.put("Mensaje", "No se ha encontrado el usuario");
            }
        } catch (SQLException sqlEx) {
            mensaje.put("Exito", false);
            mensaje.put("Mensaje", "Ha ocurrido un problema con la base de datos");
        }
        return mensaje.toString();
    }

    @Path("/SolicitarDiaE")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public String Solicitud(String sourceInf) {
        JSONObject src = new JSONObject(sourceInf);
        JSONObject mensaje = new JSONObject();
        int idProfesor = src.getInt("idProfesor");
        String dia = src.getString("Dia");
        try {
            Connection conn = DataConn.connect();
            CallableStatement cs = conn.prepareCall("Call SolicitarDiaE(?,?,?,?)");
            cs.setInt(1, idProfesor);
            cs.setDate(2, Date.valueOf(dia));
            cs.registerOutParameter(3, Types.BOOLEAN);
            cs.registerOutParameter(4, Types.NVARCHAR);
            cs.execute();
            mensaje.put("Exito", cs.getBoolean(3));
            mensaje.put("Mensaje", cs.getString(4));
        } catch (SQLException sqlEx) {
            mensaje.put("Exito", false);
            mensaje.put("Mensaje", "Ha ocurrido un problema con la base de datos");
        }
        return mensaje.toString();
    }

    @Path("/DecidirDiaE")
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public String Decidir(String srcI) {
        JSONObject mensaje = new JSONObject();
        int idProfesor = new JSONObject(srcI).getInt("idProfesor");
        String fecha = new JSONObject(srcI).getString("Dia");
        boolean decision = new JSONObject(srcI).getBoolean("Decision");
        try {
            Connection conn = DataConn.connect();
            CallableStatement cs = conn.prepareCall("Call Decision(?,?,?,?)");
            cs.setInt(1, idProfesor);
            cs.setDate(2, Date.valueOf(fecha));
            cs.setBoolean(3, decision);
            cs.registerOutParameter(4, Types.NVARCHAR);
            cs.execute();
            mensaje.put("Mensaje", cs.getString(4));
        } catch (SQLException sqlEx) {
            StringWriter sw = new StringWriter();
            sqlEx.printStackTrace(new PrintWriter(sw));
            mensaje.put("Mensaje", sw.toString());
        }
        return mensaje.toString();
    }

    @Path("/search/economicos/{idProfesor}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String searchReport(@PathParam("idProfesor") int idProfesor) {
        JSONObject mensaje = new JSONObject();
        try {
            Connection conn = DataConn.connect();
            CallableStatement cs = conn.prepareCall("Call obtenerEconomicos(?,?,?)");
            cs.setInt(1, idProfesor);
            cs.registerOutParameter(2, Types.BOOLEAN);
            cs.registerOutParameter(3, Types.INTEGER);
            boolean data = cs.execute();
            if (!data || !cs.getBoolean(2)) {
                mensaje.put("Exito", false);
                mensaje.put("Error", false);
                mensaje.put("Mensaje", "No se encontraron resultados");
            } else {
                JSONArray tmp = new JSONArray();
                ResultSet rset = cs.getResultSet();
                while (rset.next()) {
                    JSONObject temporal = new JSONObject();
                    temporal.put("Dia", rset.getDate("Dia"));
                    temporal.put("Status", rset.getString("Status_X"));
                    tmp.put(temporal);
                }
                mensaje.put("Exito", true);
                mensaje.put("Economicos", tmp);
                mensaje.put("Solicitados", cs.getInt(3));
            }
        } catch (SQLException sqlEx) {
            StringWriter sw = new StringWriter();
            sqlEx.printStackTrace(new PrintWriter(sw));
            mensaje.put("Exito", false);
            mensaje.put("Error", true);
            mensaje.put("Mensaje", sw.toString());
        }
        return mensaje.toString();
    }

    @Path("/get/reporte/{idProfesor}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String reporte(@PathParam("idProfesor") int idProfesor) {
        JSONObject mensaje = new JSONObject();
        try {
            Connection conn = DataConn.connect();
            CallableStatement cs = conn.prepareCall("Call ObtenerReporte(?,?)");
            cs.setInt(1, idProfesor);
            cs.registerOutParameter(2, Types.BOOLEAN);
            boolean data = cs.execute();
            if (!data || !cs.getBoolean(2)) {
                ResultSet rset = cs.getResultSet();
                mensaje.put("Profesor", idProfesor);
                JSONArray tmp = new JSONArray();
                while (rset.next()) {
                    JSONObject temporal = new JSONObject();
                    temporal.put("Materia", rset.getString("idMateria"));
                    temporal.put("Grupo", rset.getString("Tag"));
                    temporal.put("Dia", rset.getInt("Dia"));
                    temporal.put("Entrada", rset.getTime("Entrada"));
                    temporal.put("Salida", rset.getTime("Salida"));
                    tmp.put(temporal);
                }
                
            }

        } catch (SQLException sqlEx) {
            mensaje.put("Exito", false);
            mensaje.put("Error", true);
            StringWriter sw = new StringWriter();
            sqlEx.printStackTrace(new PrintWriter(sw));
            mensaje.put("Mensaje", sw.toString());
        }
        return mensaje.toString();
    }
}
