/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class HashUtil_Test {

    @isTest
    static void genHash() {
        Set<String> args = new Set<String>{'foo','bar','whatevs'};
        String SHA1Hash = HashUtil.genHash(args);
        system.assertEquals('E5XMKfmka7kugtimuyTMAiP6o20=', SHA1Hash);
    }

    @isTest
    static void genHashSHA1() {
        Set<String> args = new Set<String>{'foo','bar','whatevs'};
        String SHA1Hash = HashUtil.genHash(args,'SHA1');
        system.assertEquals('E5XMKfmka7kugtimuyTMAiP6o20=', SHA1Hash);
    }

    @isTest
    static void genHashSHA256() {
        Set<String> args = new Set<String>{'foo','bar','whatevs'};
        String SHA256Hash = HashUtil.genHash(args,'SHA-256');
        system.assertEquals('qtvd9QtmAhBUMiQCon/EuBz9S9r5fydf3pX91BuJuJY=', SHA256Hash);
    }

    @isTest
    static void genHashSHA512() {
        Set<String> args = new Set<String>{'foo','bar','whatevs'};
        String SHA512Hash = HashUtil.genHash(args,'SHA-512');
        system.assertEquals('EZFktUzeh7eNT6DNDmZhz2I4VLieoOLuTO4IS4QiWjEO8yldV0/xUDmAgletKSqFsITcw7q9UWlB+hFNksZvJg==', SHA512Hash);
    }

    @isTest
    static void genHashMD5() {
        Set<String> args = new Set<String>{'foo','bar','whatevs'};
        String MD5Hash = HashUtil.genHash(args,'MD5');
        system.assertEquals('ZMipDxMCM3Epc3Dd5xpXRA==', MD5Hash);
    }
}