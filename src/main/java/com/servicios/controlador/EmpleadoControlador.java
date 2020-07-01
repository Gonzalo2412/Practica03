package com.servicios.controlador;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.servicios.entidad.Empleado;
import com.servicios.servicio.EmpleadoServicio;

@Controller
public class EmpleadoControlador {

	@Autowired
	EmpleadoServicio servicio;

	@RequestMapping("/verEmpleados")
	public String mostrar(Model m) {
		m.addAttribute("EMPLEADOS", servicio.listaEmpleados(""));
		return "empleados";
	}

	@RequestMapping("/listaEmpleados")
	public String listar(@RequestParam Map<String, String> p, Model m) {
		m.addAttribute("EMPLEADOS", servicio.listaEmpleados(p.get("filtro")));
		return "empleados";
	}

	@RequestMapping("/registraEmpleados")
	public String registrar(Empleado e, Model m) {
		servicio.insertaEmpleados(e);
		m.addAttribute("EMPLEADOS", servicio.listaEmpleados(""));
		return "empleados";
	}

	@RequestMapping("/actualizaEmpleados")
	public String actualiza(Empleado e, Model m) {
		servicio.actualizaEmpleados(e);
		m.addAttribute("EMPLEADOS", servicio.listaEmpleados(""));
		return "empleados";
	}

	@RequestMapping("/eliminaEmpleados")
	public String elimina(@RequestParam Map<String,String> params, Model m) {
		String id = params.get("id");
		servicio.eliminaEmpleados(Integer.parseInt(id));
		m.addAttribute("EMPLEADOS", servicio.listaEmpleados(""));
		return "empleados";
	}
}
