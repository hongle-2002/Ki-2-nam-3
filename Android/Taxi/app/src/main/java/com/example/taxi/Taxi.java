package com.example.taxi;

import java.io.Serializable;

public class Taxi implements  Comparable<Taxi>, Serializable {
    private int Ma;
    private String Soxe;

    private double QuangDuong;
    private int DonGia;
    private int KhuyenMai;
    public Taxi(int ma, String soxe, double quangDuong, int donGia, int khuyenMai) {
        Ma = ma;
        Soxe = soxe;
        QuangDuong = quangDuong;
        DonGia = donGia;
        KhuyenMai = khuyenMai;
    }
    public Taxi(){}
    public int getMa() {
        return Ma;
    }

    public void setMa(int ma) {
        Ma = ma;
    }

    public String getSoxe() {
        return Soxe;
    }

    public void setSoxe(String soxe) {
        Soxe = soxe;
    }

    public double getQuangDuong() {
        return QuangDuong;
    }

    public void setQuangDuong(double quangDuong) {
        QuangDuong = quangDuong;
    }

    public int getDonGia() {
        return DonGia;
    }

    public void setDonGia(int donGia) {
        DonGia = donGia;
    }

    public int getKhuyenMai() {
        return KhuyenMai;
    }

    public void setKhuyenMai(int khuyenMai) {
        KhuyenMai = khuyenMai;
    }

    public int getTongTien(){
        return (int) (DonGia * QuangDuong * (100 - KhuyenMai)/100);
    }

    @Override
    public int compareTo(Taxi other){
        // so sanh theo ma so xe
        return  this.Soxe.compareTo(other.getSoxe());
    }
}
