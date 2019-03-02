using Microsoft.AspNet.Identity;
using ProyectoTienda;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

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

        // GET: 
        public ActionResult CreateOrder(CarritoCompra cc)
        {
            string email = User.Identity.GetUserName();

            var queryAllClients = from cliente in db.Clientes
                                  where cliente.email.Equals(email)
                                  select cliente;


            if (queryAllClients.Count() == 0) 
            {
                // LLevarle a registrar cliente si no tenemos sus datos.
                Cliente cliente = new Cliente();
                cliente.email = email;
                return RedirectToAction("Create", "Cliente", cliente);
            } else
            {
                Cliente clientePedido = new Cliente();
                foreach (var cliente in queryAllClients)
                {
                    clientePedido = cliente;
                }

                //Crear pedido (actualizando el stock de cada artículo).
                Pedido pedido = new Pedido();

                foreach (Articulo art in cc)
                {
                    pedido.Articulos.Add(db.Articulos.Find(art.Id));
                    
                    Articulo articuloDDBB = db.Articulos.Find(art.Id);
                    articuloDDBB.stock--;
                    db.Entry(articuloDDBB).State = EntityState.Modified;

                }

                pedido.fecha_registro = DateTime.Now;
                pedido.Cliente = clientePedido;
                pedido.Cliente_Id = clientePedido.Id;

                db.Pedidos.Add(pedido);

                db.SaveChanges();

                //Liberar el carrito
                cc.Clear();

                return RedirectToAction("OrderCreated");
            }
        }

        public ActionResult OrderCreated()
        {
            return View();
        }
    }
}