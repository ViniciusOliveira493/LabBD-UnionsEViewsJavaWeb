package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.Onibus;
import model.Viagem;

public class ViagemDao {
	public Onibus buscarOnibus(String codViagem) {
		String query = "SELECT * from v_descricao_onibus WHERE codViagem = ?";
		Conexao conn = new Conexao();
		Connection cn = null;
		try {
			cn = conn.getConexao();
			PreparedStatement pstm = cn.prepareStatement(query);
			pstm.setString(1, codViagem);
			ResultSet rs= pstm.executeQuery();
			while(rs.next()) {
				Onibus b = new Onibus();
				b.setPlaca(rs.getString("placaOnibus"));
				b.setMarca(rs.getString("marcaOnibus"));
				b.setDescricao(rs.getString("descOnibus"));
				b.setAno(rs.getInt("anoOnibus"));
				b.setCodViagem(rs.getInt("codViagem"));
				b.setNomeMotorista(rs.getString("nomeMotorista"));
				
				return b;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			conn.close(cn);
		}
		return null;
	}
	
	public Viagem buscarViagem(String codViagem) {
		String query = "SELECT * from v_descricao_viagem WHERE codViagem = ?";
		Conexao conn = new Conexao();
		Connection cn = null;
		try {
			cn = conn.getConexao();
			PreparedStatement pstm = cn.prepareStatement(query);
			pstm.setString(1, codViagem);
			ResultSet rs= pstm.executeQuery();
			while(rs.next()) {				
				Viagem v = new Viagem();
				v.setCodigo(rs.getInt("codViagem"));
				v.setPartida(rs.getString("partida"));
				v.setDestino(rs.getString("destino"));
				v.setHoraSaida(rs.getString("saida"));
				v.setHoraChegada(rs.getString("chegada"));
				v.setPlacaOnibus(rs.getString("placaOnibus"));
				return v;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			conn.close(cn);
		}
		return null;
	}
}
