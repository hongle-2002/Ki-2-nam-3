package com.example.khachsan;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import java.util.ArrayList;


public class Sqlite_MaDe extends SQLiteOpenHelper {
    public static final String DATABASE_NAME = "DB_HOADON";
    public static final String DATABASE_TABLE = "HOADON_2611";
    public static final String MA = "MA";
    public static final String HOTEN = "HOTEN";
    public static final String PHONG = "PHONG";
    public static final String DONGIA = "DONGIA";
    public static final String SONGAYLUUTRU = "SONGAYLUUTRU";
    private Context context;
    public Sqlite_MaDe(Context context)
    {
        super(context,DATABASE_NAME,null,1);
        this.context=context;
    }
    @Override
    public void onCreate(SQLiteDatabase sqLiteDatabase) {
        String sqlQuery = "CREATE TABLE " + DATABASE_TABLE + " (" +
                MA + " INTEGER PRIMARY KEY, " +
                HOTEN + " TEXT, " +
                PHONG + " INTEGER, " +
                DONGIA + " INTEGER, " +
                SONGAYLUUTRU + " INTEGER)";

        sqLiteDatabase.execSQL(sqlQuery);
    }

    @Override
    public void onUpgrade(SQLiteDatabase sqLiteDatabase, int i, int i1) {
        sqLiteDatabase.execSQL("DROP TABLE IF EXISTS " + DATABASE_TABLE);
        onCreate(sqLiteDatabase);
    }
    public void DeleteAll(){
        SQLiteDatabase db = this.getWritableDatabase();
        db.execSQL("DELETE FROM " + DATABASE_TABLE);
    }

    public void addTaxi(HoaDon_2611 hoaDon_2611){
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(MA, hoaDon_2611.getMa());
        values.put(HOTEN, hoaDon_2611.getHoten());
        values.put(PHONG, hoaDon_2611.getPhong());
        values.put(DONGIA, hoaDon_2611.getDongia());
        values.put(SONGAYLUUTRU, hoaDon_2611.getSongayluutru());

        db.insert(DATABASE_TABLE, null, values);

        db.close();
    }
    public ArrayList<HoaDon_2611> getAll(){
        ArrayList<HoaDon_2611> list = new ArrayList<HoaDon_2611>();
        String selectQuery = "SELECT * FROM " + DATABASE_TABLE + " ORDER BY PHONG DESC";

        SQLiteDatabase db = this.getWritableDatabase();
        Cursor cursor = db.rawQuery(selectQuery, null);

        if(cursor.moveToFirst()){
            do{
                HoaDon_2611 hoaDon_2611 = new HoaDon_2611();
                hoaDon_2611.setMa(cursor.getInt(0));
                hoaDon_2611.setHoten(cursor.getString(1));
                hoaDon_2611.setPhong(cursor.getInt(2));
                hoaDon_2611.setDongia(cursor.getInt(3));
                hoaDon_2611.setSongayluutru(cursor.getInt(4));

                list.add(hoaDon_2611);
            } while (cursor.moveToNext());
        }
        cursor.close();
        db.close();
        return list;
    }

    public ArrayList<HoaDon_2611> getAllBySearch(String s){
        ArrayList<HoaDon_2611> list = new ArrayList<HoaDon_2611>();
        int money = Integer.parseInt(s);
        String sql = "Select * from "+ DATABASE_TABLE +" Where DONGIA * SONGAYLUUTRU > " + money + " Order By PHONG DESC";


        SQLiteDatabase db = this.getWritableDatabase();
        Cursor cursor = db.rawQuery(sql, null);

        if(cursor.moveToFirst()){
            do{
                HoaDon_2611 hoaDon_2611 = new HoaDon_2611();
                hoaDon_2611.setMa(cursor.getInt(0));
                hoaDon_2611.setHoten(cursor.getString(1));
                hoaDon_2611.setPhong(cursor.getInt(2));
                hoaDon_2611.setDongia(cursor.getInt(3));
                hoaDon_2611.setSongayluutru(cursor.getInt(4));

                list.add(hoaDon_2611);
            } while (cursor.moveToNext());
        }
        cursor.close();
        db.close();
        return list;
    }
}
