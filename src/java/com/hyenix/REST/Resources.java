/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.hyenix.REST;

import javax.ws.rs.GET;
import javax.ws.rs.Path;

/**
 *
 * @author santiago
 */
@Path("/Resources")
public class Resources {
    /**
     *
     * @return
     */
    @Path("/HelloWorld")
    @GET
    public String HelloWorld(){
        return "Hola";
    }
}
