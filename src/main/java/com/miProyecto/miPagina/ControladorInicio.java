package com.miProyecto.miPagina;

import java.awt.List;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ControladorInicio {

	@GetMapping("/saludo")
	public String mostrarPagina() {
	    return "<h1>holiii xd.</h1>";
	}
}