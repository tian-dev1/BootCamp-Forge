package com.cristian.familiarizarnos_enrutamiento.Controllers;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DojoController {
    @RequestMapping("{location}")
	public String dojo(@PathVariable("location") String location) {
		if(location.equals("dojo")) {
			return "Dojo es increible!";
		}
		if(location.equals("burbank-dojo")) {
			return "El Dojo Burbank está localizado al sur de California";
		}
		if(location.equals("san-jose")) {
			return "El Dojo SJ es el cuartel general";
		}
		return "";
	}
}
