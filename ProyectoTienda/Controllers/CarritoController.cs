using ProyectoTienda;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace ProyectoTienda.Controllers
{
    public class CarritoController : Controller
    {
        private TiendaEntities db = new TiendaEntities();

        // GET: Carrito
        [Authorize]
        public ActionResult Index(CarritoCompra cc)
        {
            return View(cc);
        }

        // GET: Articulo/Delete/5
        public ActionResult Delete(int? id, CarritoCompra cc)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            } else
            {
                Articulo artCarrito = cc.Find(x=>x.Id == id);
                if (artCarrito != null)
                {
                    cc.Remove(artCarrito);
                }
            }
            return RedirectToAction("Index");
        }
    }
}