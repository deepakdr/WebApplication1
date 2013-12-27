using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public class DeeException:Exception
    {
        

        public override string Message
        {
            get
            {
                return "Dee is very sorry about it! Something went wrong. Please try later";
            }
        }
    }
}