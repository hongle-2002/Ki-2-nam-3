package com.example.taxi;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Filter;
import android.widget.Filterable;
import android.widget.TextView;

import java.util.ArrayList;

public class TaxiAdapter extends BaseAdapter implements Filterable {
    Activity activity;
    private ArrayList<Taxi> arrayList;

    LayoutInflater inflater;

    public TaxiAdapter(Activity activity, ArrayList<Taxi> arrayList){
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
        return i;
    }

    @Override
    public View getView(int position, View view, ViewGroup parent) {
        View v = view;
        if(v == null){
            v = inflater.inflate(R.layout.item_listview, null);
            TextView tvSoxe = v.findViewById(R.id.tvSoxe);
            tvSoxe.setText(arrayList.get(position).getSoxe());
            TextView tvQuangduong = v.findViewById(R.id.tvQuangduong);
            tvQuangduong.setText("Quang duong: "+arrayList.get(position).getQuangDuong());
            TextView tvGiatien = v.findViewById(R.id.tvTongtien);
            tvGiatien.setText("" + arrayList.get(position).getTongTien());
        }
        return v;
    }

    @Override
    public Filter getFilter() {
        return null;
    }
}
