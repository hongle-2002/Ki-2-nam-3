package com.example.baithi;

import java.io.Serializable;

public class Sanpham implements Comparable<Sanpham>, Serializable {
    private int Ma;
    private String Tensanpham;

    private int DonGia;

    public Sanpham(int ma, String tensanpham, int donGia) {
        Ma = ma;
        Tensanpham = tensanpham;
        DonGia = donGia;
    }
    public Sanpham()
    {

    }

    public int getMa() {
        return Ma;
    }

    public void setMa(int ma) {
        Ma = ma;
    }

    public String getTensanpham() {
        return Tensanpham;
    }

    public void setTensanpham(String tensanpham) {
        Tensanpham = tensanpham;
    }

    public int getDonGia() {
        return DonGia;
    }

    public void setDonGia(int donGia) {
        DonGia = donGia;
    }

    public double getKhuyenmai()
    {
        return (-DonGia + DonGia*10)/100;
    }
    @Override
    public int compareTo(Sanpham sanpham) {
        return 0;
    }
}
