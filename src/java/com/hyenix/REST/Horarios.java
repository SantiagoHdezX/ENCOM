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
   @POST
   @Consumes(MediaType.APPLICATION_JSON)
   @Produces(MediaType.APPLICATION_JSON)
   public String RegistrarHorario(String srt){
       JSONObject horario=new JSONObject(srt);
       JSONObject rtnStmt=new JSONObject();
       try
        {
            try{
               Class.forName("com.mysql-jdbc.Driver");
            }
            catch(ClassNotFoundException cnfEx){
                rtnStmt.put("Registro", false);
                rtnStmt.put("Mensaje","Driver no encontrado");
                return rtnStmt.toString();
            }
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/ENCOM","root","n0m3l0");
            Statement stmt=conn.createStatement();
            /*
                Registro de Materia
            */
            int Profesor=horario.getInt("Profesor");
            char Type_Schedule=horario.getString("Type_Schedule").charAt(0);
            JSONArray materias=horario.getJSONArray("Materia");
            for(int i=0;i<materias.length();i++){
                JSONObject snt=materias.getJSONObject(i);
                String nombre_materia=snt.getString("Nombre");
                JSONArray grupo=snt.getJSONArray("Horario");
                for(int j=0;i<snt.length();j++){
                    JSONObject currentGroup=grupo.getJSONObject(j);
                    boolean notificacion=Reg_Grupo(conn,Profesor, Type_Schedule, nombre_materia, currentGroup.toString());
                }
            }
            
            
        }
        catch(SQLException sqlEx)
        {
                rtnStmt.put("Registro", false);
                rtnStmt.put("Mensaje","SQLException");
                return rtnStmt.toString();
        }
       return "{'Nada':0}";
       
   }
   
   public boolean Reg_Grupo(Connection conn,int Profesor, char Type, String Nombre_Materia, String datosGrupo){
        JSONObject currentGroup=new JSONObject(datosGrupo);
        String cntGp=currentGroup.getString("Grupo");
        if((currentGroup.getJSONObject("Lunes").getBoolean("Clase"))==true){
            String LEntrada=currentGroup.getJSONObject("Lunes").getString("Entrada");
            String LSalida=currentGroup.getJSONObject("Lunes").getString("Salida");
        }
        else{
            String LEntrada=null;
            String LSalida=null;
        }

        if(currentGroup.getJSONObject("Martes").getBoolean("Clase")){
            String MEntrada=currentGroup.getJSONObject("Martes").getString("Entrada");
            String MSalida=currentGroup.getJSONObject("Martes").getString("Salida");
        }
        else{
            String MEntrada=null;
            String MSalida=null;
        }

        if(currentGroup.getJSONObject("Miercoles").getBoolean("Clase")){
            String MiEntrada=currentGroup.getJSONObject("Miercoles").getString("Entrada");
            String MiSalida=currentGroup.getJSONObject("Miercoles").getString("Salida");
        }
        else{
            String MiEntrada=null;
            String MiSalida=null;
        }

        if(currentGroup.getJSONObject("Jueves").getBoolean("Clase")){
            String JEntrada=currentGroup.getJSONObject("Jueves").getString("Entrada");
            String JSalida=currentGroup.getJSONObject("Jueves").getString("Salida");
        }
        else{
            String JEntrada=null;
            String JSalida=null;
        }
        if(currentGroup.getJSONObject("Viernes").getBoolean("Clase")){
            String VEntrada=currentGroup.getJSONObject("Viernes").getString("Entrada");
            String VSalida=currentGroup.getJSONObject("Viernes").getString("Salida");
        }
        else{
            String VEntrada=null;
            String VSalida=null;
        }
        try
        {
            Statement stmt=conn.createStatement();
            stmt.executeUpdate("INSERT INTO ");
            
        }
        catch(SQLException sqlEx){
            
        }
        
       return false;
   }  
}
