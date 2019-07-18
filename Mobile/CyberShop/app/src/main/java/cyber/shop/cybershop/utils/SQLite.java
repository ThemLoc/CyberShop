package cyber.shop.cybershop.utils;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import java.util.ArrayList;
import java.util.List;

public class SQLite extends SQLiteOpenHelper {

    public static final String DATABASE_NAME = "cybershop.db";
    private static final String TABLE_NAME = "orders";
    private static final String ID = "id";
    private static final String PRODUCT_ID = "productId";
    private static final String PRODUCT_NAME = "productName";
    private static final String PRICE = "price";
    private static final String QUANTITY = "quantity";
    private static final String IMAGE_URL = "imageUrl";
    public static final int DATABASE_VERSION = 3;

    public static final String CREATE_DATABASE_ORDER = "CREATE TABLE " + TABLE_NAME + "(" +
            ID + " TEXT primary key, " +
            PRODUCT_ID + " TEXT, " +
            PRODUCT_NAME + " TEXT, " +
            PRICE + " REAL, " +
            QUANTITY + " TEXT, " +
            IMAGE_URL + " TEXT)";

    private Context context;

    public SQLite(Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
        this.context = context;
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        db.execSQL(CREATE_DATABASE_ORDER);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.execSQL("DROP TABLE IF EXISTS " + TABLE_NAME);
        onCreate(db);
    }

    public void addOrder(OrderSQLite order) {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(ID, order.getId());
        values.put(PRODUCT_ID, order.getProductID());
        values.put(PRODUCT_NAME, order.getProductName());
        values.put(PRICE, order.getPrice());
        values.put(QUANTITY, order.getQuantity());
        values.put(IMAGE_URL, order.getImageUrl());
        db.insert(TABLE_NAME, null, values);
        db.close();
    }

    public List<OrderSQLite> getAllOrder() {
        SQLiteDatabase db = this.getReadableDatabase();
        List<OrderSQLite> listOrders = new ArrayList<OrderSQLite>();
        String selectQuery = "SELECT  * FROM " + TABLE_NAME;
        Cursor cursor = db.rawQuery(selectQuery, null);

        if (cursor.moveToFirst()) {
            do {
                OrderSQLite order = new OrderSQLite();
                order.setId(cursor.getString(0));
                order.setProductID(cursor.getString(1));
                order.setProductName(cursor.getString(2));
                order.setPrice(cursor.getDouble(3));
                order.setQuantity(cursor.getString(4));
                order.setImageUrl(cursor.getString(5));
                listOrders.add(order);
            } while (cursor.moveToNext());
        }
        cursor.close();
        db.close();
        return listOrders;
    }

    public int getByProductID(String id) {
        SQLiteDatabase db = this.getReadableDatabase();
        String selectQuery = "SELECT " + QUANTITY +" FROM " + TABLE_NAME + " WHERE " + PRODUCT_ID + "= '" + id + "'";
        Cursor cursor = db.rawQuery(selectQuery, null);
        if (cursor.moveToFirst()) {
            return Integer.parseInt(cursor.getString(0));
        } else if (!(cursor.moveToFirst()) || cursor.getCount() == 0) {
            return 0;
        }
        cursor.close();
        db.close();
        return 0;
    }

    public void update(OrderSQLite order) {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(PRODUCT_ID, order.getProductID());
        values.put(PRODUCT_NAME, order.getProductName());
        values.put(PRICE, order.getPrice());
        values.put(QUANTITY, order.getQuantity());
        values.put(IMAGE_URL, order.getImageUrl());
        db.update(TABLE_NAME, values, PRODUCT_ID + " = ?", new String[]{String.valueOf(order.getProductID())});
        db.close();
    }

    public void deleteOrder(String id) {
        SQLiteDatabase db = this.getWritableDatabase();
        String whereClause = PRODUCT_ID + " LIKE ?";
        String[] whereArgs = {id};
        db.delete(TABLE_NAME, whereClause, whereArgs);
        db.close();
    }

    public void deleteAll() {
        SQLiteDatabase db = this.getWritableDatabase();
        db.execSQL("delete from " + TABLE_NAME);
        db.close();
    }

    public long getProductCount() {
        SQLiteDatabase db = this.getReadableDatabase();
        long count = DatabaseUtils.queryNumEntries(db, TABLE_NAME);
        return count;
    }
}
