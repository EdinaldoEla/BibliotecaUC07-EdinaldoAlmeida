using System;
using Biblioteca.Models;
using Microsoft.AspNetCore.Mvc;

namespace Biblioteca.Controllers
{
    public class LivroController : Controller
    {
        public IActionResult Cadastro()
        {
            Autenticacao.CheckLogin(this);
            return View();
        }

        [HttpPost]
        public IActionResult Cadastro(Livro l)
        {
            if(!string.IsNullOrEmpty(l.Titulo) && !string.IsNullOrEmpty(l.Autor) && l.Ano !=0)
            {
                LivroService LS = new LivroService();
                if(l.Id == 0)
                {
                    LS.Inserir(l);
                }
                else
                {
                    LS.Atualizar(l);
                }

                return RedirectToAction("Listagem");
            }
            else
            {
                ViewData["mensagem"]="Necessário preencher todos os campos!";
                return View();
            }
        }
        public IActionResult Listagem(string tipoFiltro, string filtro, string itensPorPagina, int NumDaPagina, int paginaAtual)
        {
            Autenticacao.CheckLogin(this);
            FiltrosLivros objFiltro = null;
            if(!string.IsNullOrEmpty(filtro))
            {
                objFiltro = new FiltrosLivros();
                objFiltro.Filtro = filtro;
                objFiltro.TipoFiltro = tipoFiltro;
            }
            
            LivroService LS = new LivroService();

            ViewData["livrosPorPagina"] = (string.IsNullOrEmpty(itensPorPagina) ? 10 : Int32.Parse(itensPorPagina));

            ViewData["PaginaAtual"] = (paginaAtual !=0 ? paginaAtual : 1);
            
           return View(LS.ListarTodos(objFiltro));
        }

        public IActionResult Edicao(int id)
        {
            Autenticacao.CheckLogin(this);
            LivroService LS = new LivroService();
            Livro l = LS.ObterPorId(id);
            return View(l);
        }
    }
}