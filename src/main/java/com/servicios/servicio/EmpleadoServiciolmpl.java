package com.servicios.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.servicios.entidad.Empleado;
import com.servicios.repositorio.EmpleadoRepositorio;

@Service
public class EmpleadoServiciolmpl implements EmpleadoServicio {

	@Autowired
	private EmpleadoRepositorio repositorio;
	
	@Override
	public int insertaEmpleados(Empleado e) {
		return repositorio.insertaEmpleados(e);
	}

	@Override
	public int actualizaEmpleados(Empleado e) {
		return repositorio.actualizaEmpleados(e);
	}

	@Override
	public int eliminaEmpleados(int idEmpleado) {
		return repositorio.eliminaEmpleados(idEmpleado);
	}

	@Override
	public List<Empleado> listaEmpleados(String filtro) {
		return repositorio.listaEmpleados(filtro);
	}

}
