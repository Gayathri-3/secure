package com.bv.wifisync;

import com.bv.sync.*;
import android.content.*;
import android.media.*;
import android.location.*;
import java.io.*;
import java.util.*;

class JpegParser implements ImageScanner.Parser
{
    private String address;
    private final Context context;
    private ExifInterface exif;
    private Double latitude;
    private Double longitude;
    private Date time;
    
    public JpegParser(final Context context) {
        super();
        this.context = context;
    }
    
    private String getAddress(final double n, final double n2) throws IOException {
        final List fromLocation = new Geocoder(this.context).getFromLocation(n, n2, 1);
        Object o = null;
        if (fromLocation != null) {
            for (final Address address : fromLocation) {
                for (int i = 0; i < address.getMaxAddressLineIndex(); ++i) {
                    if (o == null) {
                        o = address.getAddressLine(i);
                    }
                    else {
                        o = String.valueOf(o) + " " + address.getAddressLine(i);
                    }
                }
            }
        }
        return (String)o;
    }
    
    private String getSeparator(final String s) {
        int i = 0;
        for (String[] array = { ":", "/", "\\", ".", "-" }; i < array.length; ++i) {
            final CharSequence charSequence = array[i];
            if (s.contains(charSequence)) {
                return (String)charSequence;
            }
        }
        final CharSequence charSequence = null;
        return (String)charSequence;
    }
    
    private double parseCoordinate(final String s) {
        final String[] split = s.split(",");
        final String[] split2 = split[0].split("/");
        try {
            final double n = Integer.parseInt(split2[0]) / Integer.parseInt(split2[1]);
            final String[] split3 = split[1].split("/");
            final double n2 = n + Integer.parseInt(split3[0]) / (60 * Integer.parseInt(split3[1]));
            final String[] split4 = split[2].split("/");
            return n2 + Integer.parseInt(split4[0]) / (Integer.parseInt(split4[1]) * 3600);
        }
        catch (NumberFormatException ex) {
            return 0.0;
        }
    }
    
    private double parseCoordinate(final String s, final String s2, final String s3) throws IOException {
        final String attribute = this.exif.getAttribute(s);
        double coordinate;
        if (attribute != null && attribute.length() != 0) {
            coordinate = this.parseCoordinate(attribute);
            if (!s3.equals(this.exif.getAttribute(s2))) {
                coordinate = -coordinate;
            }
        }
        else {
            coordinate = 0.0;
        }
        return coordinate;
    }
    
    private Date parseDate(final String s) throws IOException {
        final String s2 = s.split(" ")[0];
        final Calendar instance = Calendar.getInstance();
        Date time;
        if (s2 != null && s2.length() != 0) {
            final String separator = this.getSeparator(s2);
            if (separator != null) {
                this.parseDate(s2, instance, separator);
            }
            time = instance.getTime();
        }
        else {
            time = null;
        }
        return time;
    }
    
    private void parseDate(final String s, final Calendar calendar, final String s2) throws IOException {
        final int[] array = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 };
        calendar.setLenient(false);
        final String[] split = s.split(s2);
        try {
            calendar.set(Integer.parseInt(split[0]), array[-1 + Integer.parseInt(split[1])], Integer.parseInt(split[2]));
        }
        catch (Exception ex) {
            throw new IOException("Invalid exif date format " + s);
        }
    }
    
    private String parseLocation() throws IOException {
        final double latitude = this.getLatitude();
        final double longitude = this.getLongitude();
        final double n = dcmpl(longitude, 0.0);
        String address = null;
        if (n != 0) {
            final double n2 = dcmpl(latitude, 0.0);
            address = null;
            if (n2 != 0) {
                address = this.getAddress(latitude, longitude);
            }
        }
        String trim;
        if (address == null) {
            trim = null;
        }
        else {
            trim = address.trim();
        }
        return trim;
    }
    
    private Date parseTime() {
        final String attribute = this.exif.getAttribute("DateTime");
        if (attribute == null) {
            return null;
        }
        try {
            if (attribute.length() != 0) {
                return this.parseDate(attribute);
            }
        }
        catch (Exception ex) {
            Errors.getErrorMessage(this.context, ex);
        }
        return null;
    }
    
    public String getAddress() throws IOException {
        if (this.address == null) {
            this.address = this.parseLocation();
        }
        return this.address;
    }
    
    public double getLatitude() throws IOException {
        double n;
        if (this.latitude != null) {
            n = this.latitude;
        }
        else {
            n = this.parseCoordinate("GPSLatitude", "GPSLatitudeRef", "N");
        }
        return n;
    }
    
    public double getLongitude() throws IOException {
        double n;
        if (this.longitude != null) {
            n = this.longitude;
        }
        else {
            n = this.parseCoordinate("GPSLongitude", "GPSLongitudeRef", "E");
        }
        return n;
    }
    
    public Date getTime() {
        if (this.time == null) {
            this.time = this.parseTime();
        }
        return this.time;
    }
    
    public void parse(final String s) throws IOException {
        this.time = null;
        this.address = null;
        this.latitude = null;
        this.longitude = null;
        this.exif = new ExifInterface(s);
    }
}
