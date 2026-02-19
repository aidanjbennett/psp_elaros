new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(),
        "database_link")
                .setMethodCallHandler((call, result) -> {

        if (call.method.equals("initDatabase")) {
String path = call.argument("dbPath");
dbHelper = new DataBaseHelper(this, path);
        dbHelper.openDataBase();
        result.success(null);
    }

            else if (call.method.equals("insertSleep")) {
String start = call.argument("startTime");
String end = call.argument("endTime");
        dbHelper.insertSleep(start, end);
        result.success(null);
    }

            else if (call.method.equals("getSleepData")) {
        result.success(dbHelper.getSleepData());
        }


            });

