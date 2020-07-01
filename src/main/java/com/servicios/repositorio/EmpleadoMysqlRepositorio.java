package com.servicios.repositorio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.servicios.entidad.Empleado;


@Repository
public class EmpleadoMysqlRepositorio implements EmpleadoRepositorio {
	
	@Autowired
	private JdbcTemplate jdbc;
	
	@Override
	public int insertaEmpleados(Empleado e) {
		String sql = "Insert Into empleado values(?,?,?,?,?,?,?,?,?)";
		Object[] datos={null, e.getNombre_empleado(), e.getApellidos_empleado(), e.getDni(), e.getCodigo(), e.getTelefono(), e.getEdad(), e.getCorreo(), e.getIdTipoEmpleado()};
		return jdbc.update(sql,datos);
	}
	
	@Override
	public int actualizaEmpleados(Empleado e) {
		String sql = "Update empleado Set nombre_empleado=?,apellidos_empleado=?,dni=?,codigo=?,telefono=?,edad=?,correo=?,idTipoEmpleado=? Where idEmpleado=?";
		Object[] datos={e.getNombre_empleado(), e.getApellidos_empleado(), e.getDni(), e.getCodigo(), e.getTelefono(), e.getEdad(), e.getCorreo(), e.getIdTipoEmpleado(), e.getIdEmpleado()};		
		return jdbc.update(sql,datos);
	}
	
	@Override
	public int eliminaEmpleados(int idEmpleado) {
		String sql = "Delete From empleado Where idEmpleado=?";
		Object[] datos = {idEmpleado};
		return jdbc.update(sql,datos);
	}
	
	@Override
	public List<Empleado> listaEmpleados(String filtro) {
		String sql = "Select * From empleado Where Nombre_empleado like ?";
		Object[] datos = {filtro + "%"};

		RowMapper<Empleado> row = new RowMapper<Empleado>() {
			@Override
			public Empleado mapRow(ResultSet rs, int rowNum) throws SQLException {
				Empleado e = new Empleado();
				e.setIdEmpleado(rs.getInt(1));
				e.setNombre_empleado(rs.getString(2));
				e.setApellidos_empleado(rs.getString(3));
				e.setDni(rs.getString(4));
				e.setCodigo(rs.getString(5));
				e.setTelefono(rs.getString(6));
				e.setEdad(rs.getInt(7));
				e.setCorreo(rs.getString(8));
				e.setIdTipoEmpleado(rs.getInt(9));
				return e;
			}
		};
		
		List<Empleado> lista = jdbc.query(sql, datos, row);
		return lista;
	}
}
