/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datamanagerbuku.models;

/**
 *
 * @author yuliaananta
 */
public class Buku {
    private long id;
    private String judulBuku;
    private String penerbit;
    private String pengarang;
    private int tahunTerbit;
 
    public long getId() {
        return id;
    }
 
    public void setId(long id) {
        this.id = id;
    }
 
    public String getJudulBuku() {
        return judulBuku;
    }
 
    public void setJudulBuku(String judulBuku) {
        this.judulBuku = judulBuku;
    }
 
    public String getPenerbit() {
        return penerbit;
    }
 
    public void setPenerbit(String penerbit) {
        this.penerbit = penerbit;
    }
 
    public String getPengarang() {
        return pengarang;
    }
 
    public void setPengarang(String pengarang) {
        this.pengarang = pengarang;
    }
 
    public int getTahunTerbit() {
        return tahunTerbit;
    }
 
    public void setTahunTerbit(int tahunTerbit) {
        this.tahunTerbit = tahunTerbit;
    }
}
