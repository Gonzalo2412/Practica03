package com.servicios.servicio;

import java.util.List;

import com.servicios.entidad.Empleado;

public interface EmpleadoServicio {

	public abstract int insertaEmpleados(Empleado e);
	public abstract int actualizaEmpleados(Empleado e);
	public abstract int eliminaEmpleados(int idEmpleado);
	public abstract List<Empleado> listaEmpleados(String filtro);
}
