using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TiendaCarritoSession.Controllers
{
    public class CarritoController : Controller
    {
        // GET: Carrito
        public ActionResult Index(CarritoCompra cc)
        {
            return View(cc);
        }
    }
}