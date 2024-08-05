package com.example.baithi;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class AddSanPham extends AppCompatActivity {
    TextView editName, editSoPhong, editDonGia, editSoNgay;
    Button btnThem, btnThoat;

    Database database = new Database(this);

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_san_pham);
        InitWidget();

        Intent it = getIntent();
        int ma = it.getIntExtra("SL", 0) + 1;
        System.out.println("So luong la" + ma);
        btnThoat.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(AddSanPham.this, MainActivity.class);
                startActivity(intent);
            }
        });

        btnThem.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Sanpham sanpham = new Sanpham(ma, editName.getText().toString(), Integer.parseInt(editSoPhong.getText().toString()));
                database.addSanpham(sanpham);
                Intent intent = new Intent(AddSanPham.this, MainActivity.class);
                startActivity(intent);
            }
        });

    }
    void  InitWidget(){
        editName = findViewById(R.id.editName);
        editSoPhong = findViewById(R.id.editSoPhong);
        editDonGia = findViewById(R.id.editDonGia);
        editSoNgay = findViewById(R.id.editSoNgay);

        btnThem = findViewById(R.id.btnThem);
        btnThoat = findViewById(R.id.btnThoat);
    }
}