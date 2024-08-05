package com.example.on1;

public class HoaDon_NgaySinh {
    private  String hoTen;
    private int soPhong;

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public int getSoPhong() {
        return soPhong;
    }

    public void setSoPhong(int soPhong) {
        this.soPhong = soPhong;
    }

    public double getTien() {
        return tien;
    }

    public void setTien(double tien) {
        this.tien = tien;
    }

    public HoaDon_NgaySinh(String hoTen, int soPhong, double tien) {
        this.hoTen = hoTen;
        this.soPhong = soPhong;
        this.tien = tien;
    }

    private  double tien;

}
