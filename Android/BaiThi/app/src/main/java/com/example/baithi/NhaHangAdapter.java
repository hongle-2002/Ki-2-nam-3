package com.example.baithi;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.ArrayList;

public class NhaHangAdapter extends BaseAdapter {
    Activity activity;

    private ArrayList<Sanpham> arrayList;

    LayoutInflater inflater;
    public NhaHangAdapter(Activity activity, ArrayList<Sanpham> arrayList) {
        this.activity = activity;
        this.arrayList = arrayList;
        this.inflater = (LayoutInflater) activity.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
    }
    @Override
    public int getCount() {
        return arrayList.size();
    }

    @Override
    public Object getItem(int i) {
        return arrayList.get(i);
    }

    @Override
    public long getItemId(int i) {
        return arrayList.get(i).getMa();
    }

    @Override
    public View getView(int i, View view, ViewGroup viewGroup) {
        View v = view;
        if(v == null){
            v = inflater.inflate(R.layout.item_listview, null);
            TextView tvHoten = v.findViewById(R.id.tvHoten);
            TextView tvPhong = v.findViewById(R.id.tvPhong);
            TextView tvGiatien = v.findViewById(R.id.tvGiaTien);
            tvHoten.setText("" + arrayList.get(i).getTensanpham());
            tvPhong.setText("Giảm giá còn: " +arrayList.get(i).getKhuyenmai());
            tvGiatien.setText("" + arrayList.get(i).getDonGia());
        }
        return v;
    }
}
