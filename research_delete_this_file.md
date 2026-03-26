FileWriter mFileWriter = new FileWriter(filePath , true);

https://stackoverflow.com/questions/36087602/export-sqlitedatabase-to-csv-android-studio

private void exportDB() {}

https://github.com/android/architecture-components-samples/issues/340



read data:
SQLiteDatabase db = dbHelper.getReadableDatabase();
Cursor cursor = db.rawQuery("SELECT * FROM your_table", null);

get data:
File csvFile = new File(getExternalFilesDir(null), "data.csv");

try {
    FileWriter writer = new FileWriter(csvFile);

    // Write column headers
    writer.append("\n");

    // Loop through cursor
    while (cursor.moveToNext()) {
        writer.append(cursor.getString(0)); // id
        writer.append(",");
        writer.append(cursor.getString(1)); // name
        writer.append(",");
        writer.append(cursor.getString(2)); // age
        writer.append("\n");
    }

    writer.flush();
    writer.close();
    cursor.close();

} catch (IOException e) {
    e.printStackTrace();
}


file location:
getExternalFilesDir(null)
/Android/data/your.package.name/files/

perms <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>

