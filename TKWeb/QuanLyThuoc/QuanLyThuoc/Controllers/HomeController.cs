﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using QuanLyThuoc.Models;
using System.Diagnostics;
using X.PagedList;

namespace QuanLyThuoc.Controllers
{


	public class HomeController : Controller
	{
		QuanLyThuocContext db = new QuanLyThuocContext();
		private readonly ILogger<HomeController> _logger;

		public HomeController(ILogger<HomeController> logger)
		{
			_logger = logger;
		}

		public IActionResult Index(int? page)

		{
			int pageSize = 8;
			int pageNumber = page == null || page < 0 ? 1 : page.Value;
			var lstsanpham = db.TDanhMucThuocs.AsNoTracking().OrderBy(x=>x.TenThuoc).ToList();
			PagedList<TDanhMucThuoc> lst = new PageList<TDanhMucThuoc>(lstsanpham, pageNumber, pageSize);
			return View(lst);
		}

		public IActionResult Privacy()
		{
			return View();
		}

		[ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
		public IActionResult Error()
		{
			return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
		}
	}
}