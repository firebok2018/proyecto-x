package ConexionDatabase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.DefaultComboBoxModel;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;

import model.Mesa;
import model.Previlegio;
import model.TipoMesa;
import utils.Conexion;

public class ConexionMesa extends Conexion{
	
	public int AddMesa(Mesa num){
		int valor= -1;
		Connection con = null;
		PreparedStatement pstm= null;
		try {
			con= new Conexion().getConexion();
			String sql="insert into Ventas.NumMesa values (null,?,?)";
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, num.getNumeromesa());
			pstm.setInt(2, num.getNumerosillas());
			valor = pstm.executeUpdate();
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
			JOptionPane.showMessageDialog(null, "No REGISTRADO");
			
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return valor;
		
	} 
	public void numeroMesa(JComboBox m){
		DefaultComboBoxModel<Mesa> model;
		Statement st= null;
		Connection cn = null;
		ResultSet rs = null;
		try {
			cn = new Conexion().getConexion();
			st= cn.createStatement();
			rs= st.executeQuery("select*from Ventas.NumMesa");
			model = new DefaultComboBoxModel<>();
			m.setModel(model);
			
			while (rs.next()) {
				model.addElement(new Mesa(rs.getInt(1),rs.getInt(2),rs.getInt(3)));
				
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.setNextException(e);
			System.out.println("eeor de listado");
		}
		finally {
			try {
				cn.close();
				st.close();
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	public void TipoMesa(JComboBox t){
		DefaultComboBoxModel<TipoMesa> model;
		Statement st= null;
		Connection cn = null;
		ResultSet rs = null;
		try {
			cn = new Conexion().getConexion();
			st= cn.createStatement();
			rs= st.executeQuery("select*from Ventas.TipoMesa;");
			model = new DefaultComboBoxModel<>();
			t.setModel(model);
			
			while (rs.next()) {
				model.addElement(new TipoMesa(rs.getInt(1), rs.getString(2)));
				
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.setNextException(e);
			System.out.println("eeor de listado");
		}
		finally {
			try {
				cn.close();
				st.close();
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	} 

}
