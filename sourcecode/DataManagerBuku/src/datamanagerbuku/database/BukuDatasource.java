/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datamanagerbuku.database;

import datamanagerbuku.models.Buku;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author yuliaananta
 */
public class BukuDatasource {
    public void save(Buku buku) throws SQLException {
        String sql = "INSERT INTO buku(judul, pengarang, penerbit, tahun_terbit) VALUES (?, ?, ?, ?)";
        Connection connection = ConnectionHelper.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
         
        preparedStatement.setString(1, buku.getJudulBuku());
        preparedStatement.setString(3, buku.getPengarang());
        preparedStatement.setString(2, buku.getPenerbit());
        preparedStatement.setInt(4, buku.getTahunTerbit());
         
        preparedStatement.executeUpdate();   
    }
     
    public void update(Buku buku) throws SQLException {
        String sql = "UPDATE buku SET judul=?, pengarang=?, penerbit=?, tahun_terbit=? WHERE id=?";
        Connection connection = ConnectionHelper.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, buku.getJudulBuku());
        preparedStatement.setString(2, buku.getPengarang());
        preparedStatement.setString(3, buku.getPenerbit());
        preparedStatement.setInt(4, buku.getTahunTerbit());
        preparedStatement.setLong(5, buku.getId());
        preparedStatement.executeUpdate();   
    }
     
    public void delete(Buku buku) throws SQLException {
        String sql = "UPDATE buku SET judul=?, pengarang=?, penerbit=?, tahun_terbit=? WHERE id=?";
        Connection connection = ConnectionHelper.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, buku.getJudulBuku());
        preparedStatement.setString(2, buku.getPengarang());
        preparedStatement.setString(3, buku.getPenerbit());
        preparedStatement.setInt(4, buku.getTahunTerbit());
        preparedStatement.setLong(5, buku.getId());
        preparedStatement.executeUpdate();   
    }
     
    public List<Buku> findAll() throws SQLException {
        String sql = "SELECT *FROM buku";
        Connection connection = ConnectionHelper.getConnection();
        ResultSet resultSet = connection.createStatement().executeQuery(sql);
        List<Buku> bukuList = new ArrayList<>();
        while (resultSet.next()) {            
            Buku buku = new Buku();
            buku.setId(resultSet.getLong("id"));
            buku.setJudulBuku(resultSet.getString("judul"));
            buku.setPengarang(resultSet.getString("pengarang"));
            buku.setPenerbit("penerbit");
            buku.setTahunTerbit(resultSet.getInt("tahun_terbit"));
            bukuList.add(buku);
        }
        return bukuList;
        //return null;
    }
}
