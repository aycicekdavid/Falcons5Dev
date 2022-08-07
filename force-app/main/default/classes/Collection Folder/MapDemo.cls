public class MapDemo {


public static String retrieveMonth(Integer m) {

    String month = '';

    Map<Integer, String> monthmap = new Map<Integer, String>();
    monthmap.put(1, 'January');
    monthmap.put(2, 'February');
    monthmap.put(3, 'March');
    monthmap.put(4, 'April');
    monthmap.put(5, 'May');
    monthmap.put(6, 'June');
    monthmap.put(7, 'July');
    monthmap.put(8, 'August');
    monthmap.put(9, 'September');
    monthmap.put(10, 'October');
    monthmap.put(11, 'November');
    monthmap.put(12, 'December');

    month = monthmap.get(m);

    return month;
    
}


    
}