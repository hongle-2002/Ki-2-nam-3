package com.example.baithi;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import java.util.ArrayList;

public class Database extends SQLiteOpenHelper {
    public static final String DATABASE_NAME = "NHAHANG";
    public static final String DATABASE_TABLE = "SANPHAM";
    public static final String MA = "MA";
    public static final String TENSANPHAM = "TENSANPHAM";
    public static final String DONGIA = "DONGIA";

    private Context context;
    public Database(Context context){
        super(context, DATABASE_NAME, null, 1);
        this.context = context;
    }
    @Override
    public void onCreate(SQLiteDatabase sqLiteDatabase) {
        String sqlQuery = "CREATE TABLE " + DATABASE_TABLE + " (" +
                MA + " INTEGER PRIMARY KEY, " +
                TENSANPHAM + " TEXT, " +

                DONGIA + " INTEGER)";

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

    public void addSanpham(Sanpham sanpham){
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(MA, sanpham.getMa());
        values.put(TENSANPHAM, sanpham.getTensanpham());

        values.put(DONGIA, sanpham.getDonGia());

        db.insert(DATABASE_TABLE, null, values);
        db.close();
    }
    public void deleteByID(int id){
        SQLiteDatabase db = this.getWritableDatabase();
        db.execSQL("DELETE FROM " + DATABASE_TABLE + " WHERE MA = " + id);
    }
    public ArrayList<Sanpham> getAll(){
        ArrayList<Sanpham> list = new ArrayList<Sanpham>();
        String selectQuery = "SELECT * FROM " + DATABASE_TABLE;
        //String selectQuery = "SELECT MA, TENSANPHAM, DONGIA,  ((-DonGia + DonGia*10)/100) AS GIAMGIA FROM " + DATABASE_TABLE + " ORDER BY GIAMGIA DESC";

        SQLiteDatabase db = this.getWritableDatabase();
        Cursor cursor = db.rawQuery(selectQuery, null);

        if(cursor.moveToFirst()) {
            do {
                Sanpham sanpham = new Sanpham();
                sanpham.setMa(cursor.getInt(0));
                sanpham.setTensanpham(cursor.getString(1));
                sanpham.setDonGia(cursor.getInt(2));

                list.add(sanpham);
            } while ((cursor.moveToNext()));
        }
        cursor.close();
        db.close();
        return list;
}
}
