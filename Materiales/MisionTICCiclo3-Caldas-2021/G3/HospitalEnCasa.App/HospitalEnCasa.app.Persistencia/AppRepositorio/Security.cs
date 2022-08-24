using System;
using System.Linq;
using System.Security.Cryptography;
namespace HospitalEnCasa.app.Persistencia
{
    public class Security
    {
        public String GetMD5Hash(String input)
        {
            input += "hospital"+input.Reverse(); //Añadir sal a la contraseña

            MD5CryptoServiceProvider x = new MD5CryptoServiceProvider();
            byte[] bs = System.Text.Encoding.UTF8.GetBytes(input);
            bs = x.ComputeHash(bs);
            System.Text.StringBuilder s = new System.Text.StringBuilder();
            foreach (byte b in bs)
            {
                s.Append(b.ToString("x2").ToLower());
            }
            String hash = s.ToString();
            return hash;
        }
    }
}