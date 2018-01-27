public with sharing class HashUtil {

    //SHA1 is default hashing algorithm
    public static String genHash(Object obj) {
        return EncodingUtil.base64encode(Crypto.generateDigest('SHA1',Blob.valueOf(JSON.serialize(obj))));
    }

    public static String genHash(Object obj, String algo) {
        return EncodingUtil.base64encode(Crypto.generateDigest(algo,Blob.valueOf(JSON.serialize(obj))));
    }
}
