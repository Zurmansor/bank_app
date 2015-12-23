package com.gentleware.bank.utils;


import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Encryption {

    public static String md5Encode(long lng) throws NoSuchAlgorithmException {
        return md5Encode(String.valueOf(lng));
    }

    public static String md5Encode(String string) throws NoSuchAlgorithmException {

        MessageDigest digest = MessageDigest.getInstance("MD5");
        digest.update(string.getBytes(), 0, string.length());
        String md5 = new BigInteger(1, digest.digest()).toString(16);
        return md5;
    }
}
