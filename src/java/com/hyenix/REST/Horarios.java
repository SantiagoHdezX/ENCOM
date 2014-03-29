/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hyenix.REST;

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

    @Path("/RegistarH")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public String RegistrarHorario(String srt) {
        JSONObject horario = new JSONObject(srt);
        JSONObject rtnStmt = new JSONObject();
        try {
            try {
                Class.forName("com.mysql-jdbc.Driver");
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
                for (int j = 0; i < snt.length(); j++) {
                    JSONObject currentGroup = grupo.getJSONObject(j);
                    boolean notificacion = Reg_Grupo(conn, Profesor, idMat, currentGroup.toString());
                }
            }

        } catch (SQLException sqlEx) {
            rtnStmt.put("Registro", false);
            rtnStmt.put("Mensaje", "SQLException");
            return rtnStmt.toString();
        }
        return "{'Nada':0}";
    }

    public boolean Reg_Grupo(Connection conn, int Profesor, String idMat, String datosGrupo) {
        boolean dtr=true;
        String nullHour="00:00:00";
        String LEntrada,LSalida,MEntrada,MSalida, MiEntrada,MiSalida,JEntrada,JSalida,VEntrada,VSalida;
        JSONObject currentGroup = new JSONObject(datosGrupo);
        String cntGp = currentGroup.getString("Grupo");
        if ((currentGroup.getJSONObject("Lunes").getBoolean("Clase")) == true) {
            LEntrada = currentGroup.getJSONObject("Lunes").getString("Entrada");
            LSalida = currentGroup.getJSONObject("Lunes").getString("Salida");
        } else {
            LEntrada = nullHour;
            LSalida = nullHour;
        }

        if (currentGroup.getJSONObject("Martes").getBoolean("Clase")) {
            MEntrada = currentGroup.getJSONObject("Martes").getString("Entrada");
            MSalida = currentGroup.getJSONObject("Martes").getString("Salida");
        } else {
            MEntrada = nullHour;
            MSalida = nullHour;
        }

        if (currentGroup.getJSONObject("Miercoles").getBoolean("Clase")) {
            MiEntrada = currentGroup.getJSONObject("Miercoles").getString("Entrada");
            MiSalida = currentGroup.getJSONObject("Miercoles").getString("Salida");
        } else {
            MiEntrada = nullHour;
            MiSalida = nullHour;
        }

        if (currentGroup.getJSONObject("Jueves").getBoolean("Clase")) {
            JEntrada = currentGroup.getJSONObject("Jueves").getString("Entrada");
            JSalida = currentGroup.getJSONObject("Jueves").getString("Salida");
        } else {
            JEntrada = nullHour;
            JSalida = nullHour;
        }
        if (currentGroup.getJSONObject("Viernes").getBoolean("Clase")) {
            VEntrada = currentGroup.getJSONObject("Viernes").getString("Entrada");
            VSalida = currentGroup.getJSONObject("Viernes").getString("Salida");
        } else {
            VEntrada = nullHour;
            VSalida = nullHour;
        }
        try {
            PreparedStatement query=conn.prepareStatement("INSERT INTO horario(idProfesor,ID_Materia,Tag,LEntrada,LSalida, MEntrada,MSalida,MiEntrada,MiSalida,JEntrada,JSalida,VEntrada,VSalida) VALUES(?)");
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
            query.executeQuery();
            PreparedStatement query2=conn.prepareStatement("SELECT COUNT(*) FROM horario WHERE idProfesor=? AND ID_Materia=? AND Tag=?");
            query2.setInt(1, Profesor);
            query2.setString(2, idMat);
            query2.setString(3, cntGp);
            ResultSet rset=query2.executeQuery();
            if(rset.next()){
                dtr=true;
            }
            else{
                dtr=false;
            }
        } catch (SQLException sqlEx) {
            dtr=false;
        }
        return dtr;
    }

    @Path("/RegistrarMateria")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public String RegistrarMateria(String data) {
        JSONObject dataJS = new JSONObject(data);
        JSONObject dataReturn = new JSONObject();
        try{
            try{
                Class.forName("com.mysql.jdbc.Driver");
            }
            catch(ClassNotFoundException cnfEx){
                dataReturn.put("Registrado", false);
                dataReturn.put("Mensaje", "No se ha cargado el driver");
                return dataReturn.toString();
            }
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ENCOM", "root", "n0m3l0");
            String idMat=dataJS.getString("idMat");
            String nombreMat=dataJS.getString("nombreMat");
            int semestre=dataJS.getInt("Semestre");
            Statement stmt=conn.createStatement();
            ResultSet rset=stmt.executeQuery("SELECT COUNT(*) FROM catalogo_materias WHERE ID_Materia='"+idMat+"'");
            if(rset.next()){
            PreparedStatement update= conn.prepareStatement("INSERT INTO catalogo_materias (ID_Materia, nombreMat, semestre) VALUES(?,?);");
            update.setString(1, idMat);
            update.setString(2, nombreMat);
            update.setInt(3, semestre);
            update.executeUpdate();
            dataReturn.put("Registrado", true);
            dataReturn.put("Mensaje", "La materia '"+nombreMat+"' con el ID '"+idMat+"' para el semestre "+semestre+" ha sido registrada con exito");
            }
            else{
                dataReturn.put("Registrado", false);
                dataReturn.put("Mensaje", "Ya existe una materia con ese ID");
            }
        }
        catch(SQLException sqlEx){
            dataReturn.put("Registrado", false);
            dataReturn.put("Mensaje", "Ha ocurrido una SQLException");
            return dataReturn.toString();
        }
        return dataReturn.toString();
    }
}
