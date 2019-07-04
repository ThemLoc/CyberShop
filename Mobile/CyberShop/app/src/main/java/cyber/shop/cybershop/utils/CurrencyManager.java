package cyber.shop.cybershop.utils;

import java.text.DecimalFormat;

public class CurrencyManager {
    public static String getPrice(double price, String currency) {

        String format = "###,###,###";

        if (price % 1 != 0) {
            format = "###,###,###";
        }

        DecimalFormat dfSing = new DecimalFormat(format);

        String result = dfSing.format(price);

        result = result.replaceAll(",", ".");

        return result + " " + currency;
    }

    public static double convertToDouble(String price) {
        String result = price.substring(0, price.length()-3);
        result = result.replaceAll("[.]","");
        return Double.parseDouble(result);
    }
}
