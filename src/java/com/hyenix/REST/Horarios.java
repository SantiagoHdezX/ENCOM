/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hyenix.REST;

import java.io.PrintWriter;
import java.io.StringWriter;
import org.json.*;
import java.sql.*;
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
@Path("/Horarios")
public class Horarios {

    @Path("/RegistrarH")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public String RegistrarHorario(String srt) {
        JSONObject horario = new JSONObject(srt);
        JSONObject rtnStmt = new JSONObject();
        try {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException cnfEx) {
                rtnStmt.put("Registro", false);
                rtnStmt.put("Mensaje", "Driver no encontrado");
                return rtnStmt.toString();
            }
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ENCOM", "root", "n0m3l0");
            Statement stmt = conn.createStatement();
            /*
             Registro de Materia
             */
            int Profesor = horario.getInt("Profesor");
            JSONArray materias = horario.getJSONArray("Materia");
            for (int i = 0; i < materias.length(); i++) {
                JSONObject snt = materias.getJSONObject(i);
                String idMat = snt.getString("idMateria");
                JSONArray grupo = snt.getJSONArray("Horario");
                for (int j = 0; j < grupo.length(); j++) {
                    JSONObject currentGroup = grupo.getJSONObject(j);
                    String notificacion = Reg_Grupo(conn, Profesor, idMat, currentGroup.toString());
                    rtnStmt.put("Mensaje N" + j, notificacion);
                }
            }

        } catch (SQLException sqlEx) {
            rtnStmt.put("Registro", false);
            rtnStmt.put("Mensaje", "SQLException");
            return rtnStmt.toString();
        }
        return rtnStmt.toString();
    }

    public String Reg_Grupo(Connection conn, int Profesor, String idMat, String datosGrupo) {
        String dtr = null;
        String nullHour = "00:00:00";
        String LEntrada, LSalida, MEntrada, MSalida, MiEntrada, MiSalida, JEntrada, JSalida, VEntrada, VSalida;
        JSONObject currentGroup = new JSONObject(datosGrupo);
        String cntGp = currentGroup.getString("Grupo");
        if ((currentGroup.getJSONObject("Lunes").getBoolean("Clase")) == true) {
            LEntrada = currentGroup.getJSONObject("Lunes").getString("Entrada");
            LSalida = currentGroup.getJSONObject("Lunes").getString("Salida");
        } else {
            LEntrada = nullHour;
            LSalida = nullHour;
        }

        if ((currentGroup.getJSONObject("Martes").getBoolean("Clase")) == true) {
            MEntrada = currentGroup.getJSONObject("Martes").getString("Entrada");
            MSalida = currentGroup.getJSONObject("Martes").getString("Salida");
        } else {
            MEntrada = nullHour;
            MSalida = nullHour;
        }

        if ((currentGroup.getJSONObject("Miercoles").getBoolean("Clase")) == true) {
            MiEntrada = currentGroup.getJSONObject("Miercoles").getString("Entrada");
            MiSalida = currentGroup.getJSONObject("Miercoles").getString("Salida");
        } else {
            MiEntrada = nullHour;
            MiSalida = nullHour;
        }

        if ((currentGroup.getJSONObject("Jueves").getBoolean("Clase")) == true) {
            JEntrada = currentGroup.getJSONObject("Jueves").getString("Entrada");
            JSalida = currentGroup.getJSONObject("Jueves").getString("Salida");
        } else {
            JEntrada = nullHour;
            JSalida = nullHour;
        }
        if ((currentGroup.getJSONObject("Viernes").getBoolean("Clase")) == true) {
            VEntrada = currentGroup.getJSONObject("Viernes").getString("Entrada");
            VSalida = currentGroup.getJSONObject("Viernes").getString("Salida");
        } else {
            VEntrada = nullHour;
            VSalida = nullHour;
        }
        try {
            PreparedStatement check = conn.prepareStatement("SELECT Tag from horario WHERE idMateria=? AND Tag=?");
            check.setString(1, idMat);
            check.setString(2, cntGp);
            ResultSet rs = check.executeQuery();
            if (rs.next()) {
                return "Ya existe esta materia para este grupo";
            } else {

            }
        } catch (SQLException sqlEx) {
            StringWriter sw = new StringWriter();
            sqlEx.printStackTrace(new PrintWriter(sw));
            return sw.toString();
        }
        try {
            PreparedStatement query = conn.prepareStatement("INSERT INTO horario(idProfesor, idMateria, Tag, LEntrada, LSalida, MEntrada, MSalida, MiEntrada, MiSalida, JEntrada,JSalida,VEntrada,VSalida) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)");
            query.setInt(1, Profesor);
            query.setString(2, idMat);
            query.setString(3, cntGp);
            query.setTime(4, java.sql.Time.valueOf(LEntrada));
            query.setTime(5, java.sql.Time.valueOf(LSalida));
            query.setTime(6, java.sql.Time.valueOf(MEntrada));
            query.setTime(7, java.sql.Time.valueOf(MSalida));
            query.setTime(8, java.sql.Time.valueOf(MiEntrada));
            query.setTime(9, java.sql.Time.valueOf(MiSalida));
            query.setTime(10, java.sql.Time.valueOf(JEntrada));
            query.setTime(11, java.sql.Time.valueOf(JSalida));
            query.setTime(12, java.sql.Time.valueOf(VEntrada));
            query.setTime(13, java.sql.Time.valueOf(VSalida));
            query.executeUpdate();
        } catch (SQLException sqlEx) {
            StringWriter sw = new StringWriter();
            sqlEx.printStackTrace(new PrintWriter(sw));
            return sw.toString();
        }
        try {
            PreparedStatement query3 = conn.prepareStatement("SELECT Tag FROM horario WHERE idProfesor=? AND idMateria=? AND Tag=?");
            query3.setInt(1, Profesor);
            query3.setString(2, idMat);
            query3.setString(3, cntGp);
            ResultSet rset2 = query3.executeQuery();
            if (rset2.next()) {
                dtr = "La materia con el ID " + idMat + " para el " + cntGp + " impartida por el profesor con el ID " + Profesor + " registrada con exito";
            } else {
                dtr = "No registrado";
            }
        } catch (SQLException sqlEx) {
            StringWriter sw = new StringWriter();
            sqlEx.printStackTrace(new PrintWriter(sw));
            return sw.toString();
        }
        return dtr;
    }

    /*
     JSON para pruebas:
     {
     "Profesor":2552,
     "Materia":
     [
     {"idMateria":"P301","Horario":
     [
     {
     "Grupo":"3IM7",
     "Lunes":
     {
     "Clase":true,
     "Entrada":"07:00:00",
     "Salida":"08:00:00",
     },
     "Martes":
     {
     "Clase":false,
     },
     "Miercoles":
     {
     "Clase":true,
     "Entrada":"07:00:00",
     "Salida":"08:00:00",
     },
     "Jueves":
     {
     "Clase":false,
     },
     "Viernes":
     {
     "Clase":false,
     }
     },
     {
     "Grupo":"3IM8",
     "Lunes":
     {
     "Clase":true,
     "Entrada":"07:00:00",
     "Salida":"08:00:00",
     },
     "Martes":
     {
     "Clase":false,
     },
     "Miercoles":
     {
     "Clase":true,
     "Entrada":"07:00:00",
     "Salida":"08:00:00",
     },
     "Jueves":
     {
     "Clase":false,
     },
     "Viernes":
     {
     "Clase":false,
     }
     },
     ]
     }
     ]
     }
    
     Cliente para REST:
    
     chrome://restclient/content/restclient.html
    
     Como usarla:
     http://somersetson.com/?p=41
     */
    @Path("/RegistrarMateria")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public String RegistrarMateria(String data) {
        JSONObject dataJS = new JSONObject(data);
        JSONObject dataReturn = new JSONObject();
        try {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException cnfEx) {
                dataReturn.put("Registrado", false);
                dataReturn.put("Mensaje", "No se ha cargado el driver");
                return dataReturn.toString();
            }
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ENCOM", "root", "n0m3l0");
            String idMat = dataJS.getString("idMat");
            String nombreMat = dataJS.getString("nombreMat");
            int semestre = dataJS.getInt("Semestre");
            Statement stmt = conn.createStatement();
            ResultSet rset = stmt.executeQuery("SELECT * FROM catalogo_materias WHERE ID_Materia='" + idMat + "'");
            if (rset.next()) {
                dataReturn.put("Registrado", false);
                dataReturn.put("Mensaje", "Ya existe una materia con ese ID");
            } else {

                PreparedStatement update = conn.prepareStatement("INSERT INTO catalogo_materias (ID_Materia, nombreMat, semestre) VALUES(?,?,?);");
                update.setString(1, idMat);
                update.setString(2, nombreMat);
                update.setInt(3, semestre);
                update.executeUpdate();
                dataReturn.put("Registrado", true);
                dataReturn.put("Mensaje", "La materia '" + nombreMat + "' con el ID '" + idMat + "' para el semestre " + semestre + " ha sido registrada con exito");
            }
        } catch (SQLException sqlEx) {
            dataReturn.put("Registrado", false);
            dataReturn.put("Mensaje", "Ha ocurrido una SQLException");
            return dataReturn.toString();
        }
        return dataReturn.toString();
    }

    @Path("/ObtenerMaterias")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String ObtenerMaterias() {
        JSONObject dataReturn = new JSONObject();
        try {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException cnfEx) {
                dataReturn.put("Exito", false);
                dataReturn.put("Mensaje", "Driver no encontrado");
            }
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ENCOM", "root", "n0m3l0");
            PreparedStatement query = conn.prepareStatement("SELECT * FROM catalogo_materias");
            ResultSet rset = query.executeQuery();
            if (rset.next()) {
                JSONArray materias = new JSONArray();
                rset.beforeFirst();
                while (rset.next()) {
                    JSONObject temporal = new JSONObject();
                    temporal.put("ID", rset.getString("ID_Materia"));
                    temporal.put("Nombre", rset.getString("nombreMat"));
                    temporal.put("Semestre", rset.getInt("semestre"));
                    materias.put(temporal);
                }
                dataReturn.put("Materias", materias);
            } else {
                dataReturn.put("Exito", false);
                dataReturn.put("Mensaje", "No se han encontrado materias");
            }
        } catch (SQLException sqlEx) {
            dataReturn.put("Exito", false);
            dataReturn.put("Mensaje", "Ha ocurrido un error de SQL");
        }
        return dataReturn.toString();
    }

    @Path("/ObtenerDatosMateria")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public String ObtenerDatosMateria(String data) {
        JSONObject dataJS = new JSONObject(data);
        JSONObject dataReturn = new JSONObject();
        String data2=null;
        try {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException cnfEx) {
                dataReturn.put("Encontrado", false);
                dataReturn.put("Mensaje", "No se encuentra el Driver");
            }
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ENCOM", "root", "n0m3l0");
            String idMat = dataJS.getString("ID");
            PreparedStatement query = conn.prepareStatement("SELECT * FROM catalogo_materias WHERE ID_Materia=?");
            query.setString(1, idMat);
            ResultSet rset = query.executeQuery();
            if (rset.next()) {
                /*Debido a un error, hubo que crear el JSON a mano*/
                data2="{\"Encontrado\":true,";
                data2+="\"ID\":\""+rset.getString("ID_Materia")+"\",";
                data2+="\"Nombre\":\""+rset.getString("nombreMat")+"\",";
                data2+="\"Semestre\":"+rset.getInt("semestre");
                data2+="}";
                dataJS.put("Encontrado", true);
                dataJS.put("ID", rset.getString("ID_Materia"));
                dataJS.put("Nombre", rset.getString("nombreMat"));
                dataJS.put("Semestre", rset.getInt("semestre"));
            } else {
                dataReturn.put("Encontrado", false);
                dataReturn.put("Mensaje", "Ha ocurrido un error SQL");
            }
        } catch (SQLException sqlEx) {
            dataReturn.put("Encontrado", false);
            dataReturn.put("Mensaje", "Ha ocurrido un error SQL");
        }
        return data2;
    }
}
