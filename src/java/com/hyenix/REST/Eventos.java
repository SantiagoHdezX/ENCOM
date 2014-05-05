/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hyenix.REST;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import org.json.JSONArray;
import org.json.JSONObject;

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
    public String RegistrarEvento(String srcInfo) {
        JSONObject mensaje = new JSONObject();
        JSONObject src = new JSONObject(srcInfo);
        String nameEvento = src.getString("Nombre");
        String descrpt = src.getString("Descripcion");
        String fecha = src.getString("Fecha");
        String hora = src.getString("Hora");
        int duracion = src.getInt("Duracion");

        try {

            Connection conexion = DataConn.connect();
            Statement st2 = conexion.createStatement();
            ResultSet verified = st2.executeQuery("SELECT * from eventos WHERE Nombre_Evento='" + nameEvento + "'");
            if (verified.next()) {
                mensaje.put("Registrado", false);
                mensaje.put("Mensaje", "El evento ya existe, si desea añadirlo, debe cambiar el nombre");
            } else {
                PreparedStatement query = conexion.prepareStatement("INSERT INTO eventos(Nombre_Evento,Descripcion,Fecha,Hora,Duracion,Habilitado) VALUES(?,?,?,?,?,TRUE)");
                query.setString(1, nameEvento);
                query.setString(2, descrpt);
                query.setDate(3, java.sql.Date.valueOf(fecha));
                query.setTime(4, java.sql.Time.valueOf(hora));
                query.setInt(5, duracion);
                int qr = query.executeUpdate();
                Statement st = conexion.createStatement();
                ResultSet rset = st.executeQuery("SELECT * FROM eventos WHERE Nombre_Evento='" + nameEvento + "'");

                if (rset.next()) {
                    mensaje.put("Registrado", true);
                    mensaje.put("Mensaje", "El evento " + nameEvento + " ha sido creado con el ID "+rset.getInt("idEvento"));
                } else {
                    mensaje.put("Registro", false);
                    mensaje.put("Mensaje", "El evento no se ha podido crear");
                }
            }
        } catch (SQLException sqlEx) {
            mensaje.put("Registro", false);
            mensaje.put("Mensaje", "Ha ocurrido un error");
        }
        return mensaje.toString();
    }

    @Path("/ObtenerEventos")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String ObtenerEventos() {
        JSONObject mensaje = new JSONObject();

        try {
            Connection con = DataConn.connect();
            PreparedStatement query = con.prepareStatement("SELECT * FROM eventos WHERE Habilitado=TRUE");
            ResultSet rset = query.executeQuery();
            if (rset.next()) {
                JSONArray data = new JSONArray();
                rset.beforeFirst();
                while (rset.next()) {
                    JSONObject temporal = new JSONObject();
                    temporal.put("ID_Evento", rset.getString("idEvento"));
                    temporal.put("Nombre", rset.getString("Nombre_Evento"));
                    temporal.put("Descripcion", rset.getString("Descripcion"));
                    temporal.put("Fecha", rset.getDate("Fecha"));
                    temporal.put("Hora", rset.getTime("Hora"));
                    temporal.put("Duracion", rset.getInt("Duracion"));
                    data.put(temporal);
                }
                mensaje.put("Busqueda", true);
                mensaje.put("Eventos", data);
            } else {
                mensaje.put("Busqueda", false);
                mensaje.put("Mensaje", "No se ha encontrado nada");
            }
        } catch (SQLException sqlEx) {
            mensaje.put("Busqueda", false);
            mensaje.put("Mensaje", "Ha ocurrido un error");
        }
        return mensaje.toString();
    }

    @Path("/ObtenerDatosEvento")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public String ObtenerEventoIndividual(String src) {
        JSONObject mensaje = new JSONObject();
        String nombre = new JSONObject(src).getString("Nombre");
        try {
            Connection conexion = DataConn.connect();
            PreparedStatement query = conexion.prepareStatement("SELECT * FROM eventos WHERE Nombre_Evento=? AND Habilitado=TRUE");
            query.setString(1, nombre);
            ResultSet rset = query.executeQuery();
            if (rset.next()) {
                mensaje.put("Busqueda", true);
                mensaje.put("Id", rset.getInt("idEvento"));
                mensaje.put("Nombre", rset.getString("Nombre_Evento"));
                mensaje.put("Descripcion", rset.getString("Descripcion"));
                mensaje.put("Fecha", rset.getDate("Fecha"));
                mensaje.put("Hora", rset.getTime("Hora"));
                mensaje.put("Duracion", rset.getInt("Duracion"));
            } else {
                mensaje.put("Busqueda", false);
                mensaje.put("Mensaje", "El evento no ha sido encontrado");
            }
        } catch (SQLException sqlEx) {
            mensaje.put("Busqueda", false);
            mensaje.put("Mensaje", "Ha ocurrido un problema");
        }
        return mensaje.toString();
    }

    @Path("/ModificarEvento")
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public String ModificarEvento(String src) {
        JSONObject fuente = new JSONObject(src);
        JSONObject mensaje = new JSONObject();
        int id = fuente.getInt("Id");
        String nombre = fuente.getString("Nombre");
        String descripcion = fuente.getString("Descripcion");
        String fecha = fuente.getString("Fecha");
        String hora = fuente.getString("Hora");
        int duracion = fuente.getInt("Duracion");
        try {
            Connection conexion = DataConn.connect();
            Statement st = conexion.createStatement();
            ResultSet rset = st.executeQuery("SELECT * FROM eventos WHERE idEvento=" + id);
            if (rset.next()) {
                PreparedStatement query = conexion.prepareStatement("UPDATE eventos SET Nombre_Evento=?, Descripcion=?, Fecha=?, Hora=?, Duracion=? WHERE idEvento=? AND Habilitado=TRUE");
                query.setString(1, nombre);
                query.setString(2, descripcion);
                query.setDate(3, java.sql.Date.valueOf(fecha));
                query.setTime(4, java.sql.Time.valueOf(hora));
                query.setInt(5, duracion);
                query.setInt(6, id);
                query.executeUpdate();
                mensaje.put("Mensaje", "Se ha actualizado correctamente");
                mensaje.put("Actualizado", true);
            } else {
                mensaje.put("Mensaje", "El evento no existe");
                mensaje.put("Actualizado", false);
            }
        } catch (SQLException sqlEx) {
            mensaje.put("Mensaje", "Ha ocurrido un error");
            mensaje.put("Acualizado", false);
        }
        return mensaje.toString();
    }

    @Path("/CaducarEvento")
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public String CaducarEvento(String src) {
        JSONObject srt = new JSONObject(src);
        JSONObject mensaje = new JSONObject();
        String nombre = srt.getString("Nombre");

        try {
            Connection conexion = DataConn.connect();
            Statement st = conexion.createStatement();
            ResultSet rset = st.executeQuery("SELECT * FROM eventos WHERE Nombre_Evento='" + nombre + "' AND Habilitado=TRUE");
            if (rset.next()) {
                st.executeUpdate("UPDATE eventos set Habilitado=FALSE WHERE Nombre_Evento='" + nombre + "'");
                mensaje.put("Mensaje", "El evento ha sido caducado y no se desplegara mas en el tablon de anuncios");
                mensaje.put("Deshabilitar", true);
            } else {
                mensaje.put("Mensaje", "El evento no existe o ya ha sido caducado");
                mensaje.put("Deshabilitar", false);
            }
        } catch (SQLException sqlEx) {
            mensaje.put("Mensaje", "Ha ocurrido un error");
            mensaje.put("Deshabilitar", false);
        }
        return mensaje.toString();
    }

}
