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
@Path("/Eventos")
public class Eventos {
    @Path("/RegistrarEvento")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public String RegistrarEvento(String srcInfo){
        JSONObject mensaje=new JSONObject();
        JSONObject src=new JSONObject(srcInfo);
        String nameEvento=src.getString("Nombre");
        String descrpt=src.getString("Descripcion");
        String fecha=src.getString("Fecha");
        String hora=src.getString("Hora");
        int duracion=src.getInt("Duracion");
        
        try
        {
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
            }
            catch(ClassNotFoundException cnfEx)
            {
                mensaje.put("Mensaje", "No se ha podido cargar el driver");
                mensaje.put("Registrado",false);
            }
            Connection conexion=DriverManager.getConnection("jdbc:mysql://localhost/ENCOM","root","n0m3l0");
            Statement st2=conexion.createStatement();
            ResultSet verified=st2.executeQuery("SELECT * from eventos WHERE Nombre_Evento='"+nameEvento+"'");
            if(verified.next())
            {
                mensaje.put("Registrado",false);
                mensaje.put("Mensaje","El evento ya existe, si desea añadirlo, debe cambiar el nombre");
            }
            else
            {
                PreparedStatement query=conexion.prepareStatement("INSERT INTO eventos(Nombre_Evento,Descripcion,Fecha,Hora,Duracion,Habilitado) VALUES(?,?,?,?,?,TRUE)");
                query.setString(1,nameEvento);
                query.setString(2,descrpt);
                query.setDate(3,java.sql.Date.valueOf(fecha));
                query.setTime(4, java.sql.Time.valueOf(hora));
                query.setInt(5,duracion);
                int qr=query.executeUpdate();
                Statement st=conexion.createStatement();
                ResultSet rset=st.executeQuery("SELECT * FROM eventos WHERE Nombre_Evento='"+nameEvento+"'");
                
                if(rset.next())
                {
                    mensaje.put("Registrado", true);
                    mensaje.put("Mensaje", "El evento "+nameEvento+" ha sido creado");
                }
                else
                {
                    mensaje.put("Registro",false);
                    mensaje.put("Mensaje","El evento no se ha podido crear");
                }
            }
        }   
        catch(SQLException sqlEx){
            mensaje.put("Registro", false);
            mensaje.put("Mensaje","Ha ocurrido un error");
        }
        return mensaje.toString();
    }
    
    @Path("/ObtenerEventos")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String ObtenerEventos(){
        JSONObject mensaje=new JSONObject();
        
        try{
            try{
                Class.forName("com.mysql.jdbc.Driver");
            }
            catch(ClassNotFoundException cnfEx)
            {
                mensaje.put("Busqueda", false);
                mensaje.put("Mensaje", "No se ha encontrado el driver");
            }
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/ENCOM","root","n0m3l0");
            PreparedStatement query=con.prepareStatement("SELECT * FROM eventos WHERE Habilitado=TRUE");
            ResultSet rset=query.executeQuery();
            if(rset.next())
            {
                JSONArray nombres=new JSONArray();
                JSONArray descripciones=new JSONArray();
                JSONArray fechas=new JSONArray();
                JSONArray horas=new JSONArray();
                JSONArray duraciones=new JSONArray();
                rset.beforeFirst();
                while(rset.next()){
                    nombres.put(rset.getString("Nombre_Evento"));
                    descripciones.put(rset.getString("Descripcion"));
                    fechas.put(rset.getDate("Fecha"));
                    horas.put(rset.getTime("Hora"));
                    duraciones.put(rset.getInt("Duracion"));
                }
                mensaje.put("Busqueda", true);
                mensaje.put("Nombres", nombres);
                mensaje.put("Descripciones", descripciones);
                mensaje.put("Fechas",fechas);
                mensaje.put("Horas", horas);
                mensaje.put("Duraciones",duraciones);
            }
            else
            {
                mensaje.put("Busqueda", false);
                mensaje.put("Mensaje", "No se ha encontrado nada");
            }
        }catch(SQLException sqlEx){
            mensaje.put("Busqueda", false);
            mensaje.put("Mensaje", "Ha ocurrido un error");
        }
        return mensaje.toString();
    }
    
    @Path("/ModificarEvento")
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public String ModificarEvento(String src){
        JSONObject fuente=new JSONObject(src);
        JSONObject mensaje=new JSONObject();
        String nombre=fuente.getString("Nombre");
        String descripcion=fuente.getString("Descripcion");
        String fecha=fuente.getString("Fecha");
        String hora=fuente.getString("Hora");
        int duracion=fuente.getInt("Duracion");
        try{
            try{
                Class.forName("com.mysql.jdbc.Driver");
            }
            catch(ClassNotFoundException cnfEx){
                mensaje.put("Mensaje","No se ha encontrado el driver");
                mensaje.put("Actualizado", false);
                return mensaje.toString();
            }
            Connection conexion=DriverManager.getConnection("jdbc:mysql://localhost/ENCOM","root","n0m3l0");
            Statement st=conexion.createStatement();
            ResultSet rset=st.executeQuery("SELECT * FROM eventos WHERE Nombre_Evento='"+nombre+"'");
            if(rset.next()){
            PreparedStatement query=conexion.prepareStatement("UPDATE eventos SET Descripcion=?, Fecha=?, Hora=?, Duracion=? WHERE Nombre_Evento=? AND Habilitado=TRUE");
            query.setString(1,descripcion);
            query.setDate(2,java.sql.Date.valueOf(fecha));
            query.setTime(3, java.sql.Time.valueOf(hora));
            query.setInt(4, duracion);
            query.setString(5, nombre);
            query.executeUpdate();
            mensaje.put("Mensaje", "Se ha actualizado correctamente");
            mensaje.put("Actualizado", true);
            }
            else{
                mensaje.put("Mensaje", "El evento no existe");
                mensaje.put("Actualizado", false);
            }
        }
        catch(SQLException sqlEx)
        {
            mensaje.put("Mensaje", "Ha ocurrido un error");
            mensaje.put("Acualizado", false);
        }
        return mensaje.toString();
    }
    @Path("/CaducarEvento")
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public String CaducarEvento(String src){
        JSONObject srt=new JSONObject(src);
        JSONObject mensaje=new JSONObject();
        String nombre=srt.getString("Nombre");
        
        try{
            try{
                Class.forName("com.mysql.jdbc.Driver");
            }
            catch(ClassNotFoundException cnfEx)
            {
                mensaje.put("Mensaje","No se ha podido cargar el driver");
                mensaje.put("Deshabilitar", false);
            }
            Connection conexion=DriverManager.getConnection("jdbc:mysql://localhost/ENCOM","root","n0m3l0");
            Statement st=conexion.createStatement();
            ResultSet rset=st.executeQuery("SELECT * FROM eventos WHERE Nombre_Evento='"+nombre+"' AND Habilitado=TRUE");
            if(rset.next()){
                st.executeUpdate("UPDATE eventos set Habilitado=FALSE WHERE Nombre_Evento='"+nombre+"'");
                mensaje.put("Mensaje", "El evento ha sido caducado y no se desplegara mas en el tablon de anuncios");
                mensaje.put("Deshabilitar", true);
            }
            else{
                mensaje.put("Mensaje", "El evento no existe o ya ha sido caducado");
                mensaje.put("Deshabilitar", false);
            }
        }
        catch(SQLException sqlEx)
        {
            mensaje.put("Mensaje", "Ha ocurrido un error");
            mensaje.put("Deshabilitar", false);
        }
        return mensaje.toString();
    }
    
}
