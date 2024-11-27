using System;
using System.Security;
using System.Security.Cryptography;
using System.Text;

namespace PCFactoryManagementView.Shared
{
    public class Settings
    {
        public static string Secret = new SecureString().ToString();

        public static string ApiKey = "IHVSDMr8ZXcG6oGY9";

        public static string ConnectionString = "";
        public static string ConnectionStringInteg = "";

        public static string Decrypt(string cipherString)
        {
            if (cipherString == null)
                return "";

            byte[] toEncryptArray = Convert.FromBase64String(cipherString);

            var key = new SecureString().ToString();

            //Usando hashing por padrão.....
            var hashmd5 = new MD5CryptoServiceProvider();
            byte[] keyArray = hashmd5.ComputeHash(Encoding.UTF8.GetBytes(key.ToString()));
            hashmd5.Clear();

            var tDesProvider = GetServiceprovider(keyArray);
            ICryptoTransform cTransform = tDesProvider.CreateDecryptor();
            byte[] resultArray = cTransform.TransformFinalBlock(
                toEncryptArray, 0, toEncryptArray.Length);
            tDesProvider.Clear();
            //return the Clear decrypted TEXT
            return Encoding.UTF8.GetString(resultArray);
        }

        private static TripleDESCryptoServiceProvider GetServiceprovider(byte[] keyArray)
        {
            //Configura a senha para o 3DES
            //Usando tipo ECB
            //Padding PKCS7
            var tdes = new TripleDESCryptoServiceProvider
            {
                Key = keyArray,
                Mode = CipherMode.ECB,
                Padding = PaddingMode.PKCS7
            };
            return tdes;
        }
    }
}
