using System;
using Biblioteca.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Http;

namespace Biblioteca.Controllers
{
    public class UsuariosController : Controller
    {
        public IActionResult ListaDeUsuarios()
        {
            Autenticacao.CheckLogin(this);
            Autenticacao.verificaSeUsuarioEAdimin(this);

            return View(new UsuarioService().Listar());
        }

        public IActionResult EditarUsuario(int id)
        {
            Usuario u = new UsuarioService().Listar(id);
            return View(u);
        }

        [HttpPost]
        public IActionResult EditarUsuario(Usuario userEditado)
        {
            UsuarioService us = new UsuarioService();
            us.EditarUsuario(userEditado);

            return RedirectToAction("ListaDeUsuarios");
        }

        public IActionResult RegistrarUsuarios()
        {
            Autenticacao.CheckLogin(this);
            Autenticacao.verificaSeUsuarioEAdimin(this);
            return View();
        }

        [HttpPost]
        public IActionResult RegistrarUsuarios(Usuario userReg)
        {
            Autenticacao.CheckLogin(this);
            Autenticacao.verificaSeUsuarioEAdimin(this);

            userReg.Senha = Criptografo.TextoCriptografado(userReg.Senha);

            UsuarioService us = new UsuarioService();
            us.IncluirUsuario(userReg);

            return RedirectToAction("CadastroRealizado");
        }

        public IActionResult ExcluirUsuario(int id)
        {
            UsuarioService us = new UsuarioService();
            return View(new UsuarioService().Listar(id));
        }

        [HttpPost]
        public IActionResult ExcluirUsuario(String decisao, int id)
        {
            Usuario us = new UsuarioService().Listar(id);
            if(decisao=="Excluir")
            {
                ViewData["Mensagem"] = "Exclusão do usuário " + new UsuarioService().Listar(id).Nome + " realizada com sucesso!";
                new UsuarioService().ExcluirUsuario(id);
                return View("ListaDeUsuarios", new UsuarioService().Listar());
            }
            else
            {
                ViewData["Mensagem"] = "Exclusão cancelada.";
                return View("ListaDeUsuarios", new UsuarioService().Listar());
            }
        }
        public IActionResult CadastroRealizado()
        {
            Autenticacao.CheckLogin(this);
            Autenticacao.verificaSeUsuarioEAdimin(this);

            return View();
        }

        public IActionResult NeedAdmin()
        {
            Autenticacao.CheckLogin(this);
            return View();
        }

        public IActionResult Sair()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index", "Home");
        }
    }
}