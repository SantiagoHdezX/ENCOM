/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hyenix.sicoin;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import org.json.JSONArray;
import org.json.JSONObject;

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

        int Profesor = horario.getInt("Profesor");
        JSONArray materias = horario.getJSONArray("Materia");
        for (int i = 0; i < materias.length(); i++) {
            JSONObject snt = materias.getJSONObject(i);
            String idMat = snt.getString("idMateria");
            JSONArray grupo = snt.getJSONArray("Horario");
            for (int j = 0; j < grupo.length(); j++) {
                JSONObject currentGroup = grupo.getJSONObject(j);
                String notificacion = Reg_Grupo(Profesor, idMat, currentGroup.toString());
                rtnStmt.put("Mensaje " + j, notificacion);
            }
        }
        return rtnStmt.toString();
    }

    public String Reg_Grupo(int Profesor, String idMat, String datosGrupo) {
        Connection conn = DataConn.connect();
        String[][] horas = new String[5][2];
        String dtr = null;
        String nullHour = "00:00:00";
        String LEntrada, LSalida, MEntrada, MSalida, MiEntrada, MiSalida, JEntrada, JSalida, VEntrada, VSalida;
        JSONObject currentGroup = new JSONObject(datosGrupo);
        String cntGp = currentGroup.getString("Grupo");
        if ((currentGroup.getJSONObject("Lunes").getBoolean("Clase")) == true) {
            LEntrada = currentGroup.getJSONObject("Lunes").getString("Entrada");
            LSalida = currentGroup.getJSONObject("Lunes").getString("Salida");
            horas[0][0] = LEntrada;
            horas[0][1] = LSalida;
        } else {
            LEntrada = nullHour;
            LSalida = nullHour;
            horas[0][0] = LEntrada;
            horas[0][1] = LSalida;
        }

        if ((currentGroup.getJSONObject("Martes").getBoolean("Clase")) == true) {
            MEntrada = currentGroup.getJSONObject("Martes").getString("Entrada");
            MSalida = currentGroup.getJSONObject("Martes").getString("Salida");
            horas[1][0] = MEntrada;
            horas[1][1] = MSalida;
        } else {
            MEntrada = nullHour;
            MSalida = nullHour;
            horas[1][0] = MEntrada;
            horas[1][1] = MSalida;
        }

        if ((currentGroup.getJSONObject("Miercoles").getBoolean("Clase")) == true) {
            MiEntrada = currentGroup.getJSONObject("Miercoles").getString("Entrada");
            MiSalida = currentGroup.getJSONObject("Miercoles").getString("Salida");
            horas[2][0] = MiEntrada;
            horas[2][1] = MiSalida;
        } else {
            MiEntrada = nullHour;
            MiSalida = nullHour;
            horas[2][0] = MiEntrada;
            horas[2][1] = MiSalida;
        }

        if ((currentGroup.getJSONObject("Jueves").getBoolean("Clase")) == true) {
            JEntrada = currentGroup.getJSONObject("Jueves").getString("Entrada");
            JSalida = currentGroup.getJSONObject("Jueves").getString("Salida");
            horas[3][0] = JEntrada;
            horas[3][1] = JSalida;
        } else {
            JEntrada = nullHour;
            JSalida = nullHour;
            horas[3][0] = JEntrada;
            horas[3][1] = JSalida;
        }
        if ((currentGroup.getJSONObject("Viernes").getBoolean("Clase")) == true) {
            VEntrada = currentGroup.getJSONObject("Viernes").getString("Entrada");
            VSalida = currentGroup.getJSONObject("Viernes").getString("Salida");
            horas[4][0] = VEntrada;
            horas[4][1] = VSalida;
        } else {
            VEntrada = nullHour;
            VSalida = nullHour;
            horas[4][0] = VEntrada;
            horas[4][1] = VSalida;
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
            for (int i = 0; i < 5; i++) {

                PreparedStatement ingreso = conn.prepareStatement("INSERT INTO horario_nxt(idProfesor,idMateria,Tag,Dia,Entrada,Salida) VALUES(?,?,?,?,?,?)");
                ingreso.setInt(1, Profesor);
                ingreso.setString(2, idMat);
                ingreso.setString(3, cntGp);
                ingreso.setInt(4,i);
                ingreso.setTime(5, java.sql.Time.valueOf(horas[i][0]));
                ingreso.setTime(6, java.sql.Time.valueOf(horas[i][1]));

            }
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

    public boolean VerificarHorario(Connection conn, String entrada, String salida, int dia) {
        try {
            CallableStatement cs = conn.prepareCall("CALL VerificarHorario(?,?,?,?)");
            cs.setTime(1, java.sql.Time.valueOf(entrada));
            cs.setTime(2, java.sql.Time.valueOf(salida));
            cs.setInt(3, dia);
            cs.registerOutParameter(4, java.sql.Types.BOOLEAN);
            cs.execute();
            return cs.getBoolean(4);
        } catch (SQLException sqlEx) {
            return false;
        }
    }

    @Path("/RegistrarMateria")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public String RegistrarMateria(String data) {
        JSONObject dataJS = new JSONObject(data);
        JSONObject dataReturn = new JSONObject();
        try {
            Connection conn = DataConn.connect();
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
        }
        return dataReturn.toString();
    }

    @Path("/ObtenerMaterias")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String ObtenerMaterias() {
        JSONObject dataReturn = new JSONObject();
        try {
            Connection conn = DataConn.connect();
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
        String data2;
        try {
            Connection conn = DataConn.connect();
            String idMat = dataJS.getString("ID");
            PreparedStatement query = conn.prepareStatement("SELECT * FROM catalogo_materias WHERE ID_Materia=?");
            query.setString(1, idMat);
            ResultSet rset = query.executeQuery();
            if (rset.next()) {
                /*Debido a un error, hubo que crear el JSON a mano*/
                /*Ya encontre el error, pero fue una buena practica hacerlo a mano xD */
                data2 = "{\"Encontrado\":true,";
                data2 += "\"ID\":\"" + rset.getString("ID_Materia") + "\",";
                data2 += "\"Nombre\":\"" + rset.getString("nombreMat") + "\",";
                data2 += "\"Semestre\":" + rset.getInt("semestre");
                data2 += "}";
                dataReturn.put("Encontrado", true);
                dataReturn.put("ID", rset.getString("ID_Materia"));
                dataReturn.put("Nombre", rset.getString("nombreMat"));
                dataReturn.put("Semestre", rset.getInt("semestre"));
            } else {
                dataReturn.put("Encontrado", false);
                dataReturn.put("Mensaje", "Ha ocurrido un error SQL");
                data2 = "{";
                data2 += "\"Encontrado\":false,";
                data2 += "\"Mensaje\":\"No se ha encontrado la materia\"";
                data2 += "}";
            }
            rset.close();
            query.close();
            conn.close();
        } catch (SQLException sqlEx) {
            data2 = "{";
            data2 += "\"Encontrado\":false,";
            data2 += "\"Mensaje\":\"Ha ocurrido un error SQL\"";
            data2 += "}";
            dataReturn.put("Encontrado", false);
            dataReturn.put("Mensaje", "Ha ocurrido un error SQL");
        }
        return data2;
    }

    @Path("/ObtenerGrupos")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String ObtenerGrupos() {
        JSONObject dataReturn = new JSONObject();
        try {
            Connection conn = DataConn.connect();
            PreparedStatement query = conn.prepareStatement("SELECT * FROM catalogo_grupo");
            ResultSet rset = query.executeQuery();
            if (rset.next()) {
                JSONArray grupos = new JSONArray();
                rset.beforeFirst();
                while (rset.next()) {
                    JSONObject temporal = new JSONObject();
                    temporal.put("NID", rset.getInt("ID_Grupo"));
                    temporal.put("Semestre", rset.getInt("Semestre"));
                    temporal.put("Numero", rset.getInt("Numero"));
                    temporal.put("Matutino", rset.getBoolean("Matutino"));
                    temporal.put("ID", rset.getString("Tag"));
                    grupos.put(temporal);
                }
                dataReturn.put("Busqueda", true);
                dataReturn.put("Grupos", grupos);
            } else {
                dataReturn.put("Busqueda", false);
                dataReturn.put("Mensaje", "No hay grupos registrados");
            }
            rset.close();
            query.close();
            conn.close();
        } catch (SQLException sqlEx) {
            dataReturn.put("Busqueda", false);
            dataReturn.put("Mensaje", "Ha ocurrido un error SQL");
        }
        return dataReturn.toString();
    }

    @Path("/ObtenerHorarioProfesor")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public String ObtenerHorarioProfesor(String dataR) {
        JSONObject data = new JSONObject(dataR);
        JSONObject returnData = new JSONObject();
        int id = data.getInt("Profesor");
        String nullHour = "00:00:00";
        try {
            Connection conn = DataConn.connect();
            if (conn == null) {
                returnData.put("Busqueda", false);
                returnData.put("Mensaje", "No se ha conseguido la conexion");
            } else {
                PreparedStatement query = conn.prepareStatement("SELECT * FROM horario WHERE idProfesor=? ORDER BY idMateria");
                query.setInt(1, id);
                ResultSet rset = query.executeQuery();
                if (rset.next()) {
                    JSONArray materias = new JSONArray();
                    returnData.put("Profesor", id);
                    rset.beforeFirst();
                    while (rset.next()) {
                        JSONObject temporal = new JSONObject();
                        temporal.put("Materia", rset.getString("idMateria"));
                        temporal.put("Grupo", rset.getString("Tag"));
                        temporal.put("LEntrada", rset.getTime("LEntrada"));
                        temporal.put("LSalida", rset.getTime("LSalida"));
                        temporal.put("MEntrada", rset.getTime("MEntrada"));
                        temporal.put("MSalida", rset.getTime("MSalida"));
                        temporal.put("MiEntrada", rset.getTime("MiEntrada"));
                        temporal.put("MiSalida", rset.getTime("MiSalida"));
                        temporal.put("JEntrada", rset.getTime("JEntrada"));
                        temporal.put("JSalida", rset.getTime("JSalida"));
                        temporal.put("VEntrada", rset.getTime("VEntrada"));
                        temporal.put("VSalida", rset.getTime("VSalida"));
                        materias.put(temporal);
                    }
                    returnData.put("Horario", materias);
                } else {
                    returnData.put("Busqueda", false);
                    returnData.put("Mensaje", "No hay materias registradas con este profesor");
                }
            }
        } catch (SQLException ex) {
            returnData.put("Busqueda", false);
            returnData.put("Mensaje", "SQLException");
        }
        return returnData.toString();
    }

}
