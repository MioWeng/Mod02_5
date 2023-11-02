using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.IO;

namespace Mod02_5.Controllers
{
    public class EmployeesController : ApiController
    {
        //靜態  可以一職重複
        static List<string> employees = new List<string> { "mary", "candy", "Lilly", "Betty", "Jessica" };
        // GET: api/Employees
        public IEnumerable<string> Get()
        {
            return employees;
        }

        // GET: api/Employees/5
        public string Get(int id)
        {
            return employees[id];
        }

        // POST: api/Employees
        public void Post([FromBody]string value)
        {
            employees.Add(value);
        }

        // PUT: api/Employees/5
        public void Put(int id, [FromBody]string value)
        {
            employees[id] = value;  //換成新的客戶
        }

        // DELETE: api/Employees/5
        public void Delete(int id)
        {
            employees.RemoveAt(id);
        }
    }
}
