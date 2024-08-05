package com.example.baithi;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ListView;
import android.widget.SearchView;

import com.google.android.material.floatingactionbutton.FloatingActionButton;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    SearchView editSearch;
    ListView ltvMain;

    FloatingActionButton btnAdd;
    NhaHangAdapter nhaHangAdapter;
    ArrayList<Sanpham> arrayList;
    Database database = new Database(this);
    int vitri = -1;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        getSupportActionBar().hide();
        InitWidget();
        //database.DeleteAll();
        database.addSanpham(new Sanpham(1,"Tu lanh LG 200l",14500000));
        database.addSanpham(new Sanpham(2,"Dien thoai samsung s7",8300000));
        database.addSanpham(new Sanpham(3,"Tivi samsung 14",8900000));
        database.addSanpham(new Sanpham(4,"Dien thoai Iphone6",6700000));
        database.addSanpham(new Sanpham(5,"lo vi song SunHouse ",1200000));

        arrayList = database.getAll();
        nhaHangAdapter = new NhaHangAdapter(this, arrayList);
        ltvMain.setAdapter(nhaHangAdapter);

        ltvMain.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
            @Override
            public boolean onItemLongClick(AdapterView<?> adapterView, View view, int i, long l) {
                vitri = i;
                registerForContextMenu(ltvMain);
                return false;
            }
        });

        btnAdd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, AddSanPham.class);
                System.out.println("So luong co trong arraylist" + arrayList.size());
                intent.putExtra("SL", arrayList.size());
                startActivity(intent);
            }
        });
    }

    void InitWidget(){
        editSearch = (SearchView) findViewById(R.id.editSearch);
        ltvMain = (ListView) findViewById(R.id.ltvMain);
        btnAdd = (FloatingActionButton) findViewById(R.id.btnAdd);
    }
}