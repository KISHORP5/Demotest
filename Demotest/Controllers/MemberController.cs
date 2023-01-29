using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Demotest.Models
{
    public class MemberController : Controller
    {
        demotest2023Entities db = new demotest2023Entities();
        // GET: Member
        public ActionResult Index()
        {
            //List<State> statelist = db.States.ToList();
            //ViewBag.StateList = new SelectList(statelist, "Id", "StateName");

            var res = db.sp_GetaLLemembers().ToList();
            return View(res);
        }
        public ActionResult GetStateLIst()
        {
           
            return Json(db.States.Select(x => new
            {
                Id = x.Id,
                StateName = x.StateName
            }).ToList(), JsonRequestBehavior.AllowGet);
        }
        //public ActionResult GetCityList()
        //{

        //    return Json(db.Cities.Select(x => new
        //    {
        //        Id = x.Id,
        //        StateName = x.CityName,
        //        StateId= x.StateId
        //    }).ToList(), JsonRequestBehavior.AllowGet);
        //}
        public JsonResult GetCityList(int StateId)
        {
            db.Configuration.ProxyCreationEnabled = false;
            List<City> CityList = db.Cities.Where(x => x.StateId == StateId).ToList();
            return Json(CityList, JsonRequestBehavior.AllowGet);

        }

        // GET: Member/Details/5
        public ActionResult Details(int id)
        {
            var data = db.Members.Where(x => x.Id == id).FirstOrDefault();
            return View(data);
        }

        // GET: Member/Create
        public ActionResult Create()
        {
            List<State> statelist = db.States.ToList();
            ViewBag.StateList = new SelectList(statelist, "Id", "StateName");
            return View();
        }

        // POST: Member/Create
        [HttpPost]
        public ActionResult Create(Member member)
        {
            try
            {
                db.Members.Add(member);
                db.SaveChanges();
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Member/Edit/5
        public ActionResult Edit(int id)
        {
            List<State> statelist = db.States.ToList();
            ViewBag.StateList = new SelectList(statelist, "Id", "StateName");
          
            var data = db.Members.Where(x => x.Id == id).FirstOrDefault();
            List<City> citylist = db.Cities.ToList();
            ViewBag.CityList = new SelectList(citylist, "Id", "CityName");

           
            return View(data);
        }

        // POST: Member/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, Member member)
        {
            try
            {
                var data = db.Members.Where(x => x.Id == id).FirstOrDefault();
                if (data != null)
                {
                    data.Id = member.Id;
                    data.Name = member.Name;
                    data.Email = member.Email;
                    data.PhoneNo = member.PhoneNo;
                    data.StateId = member.StateId;
                    data.CityId = member.CityId;
                    data.Agree = member.Agree;
                    db.SaveChanges();
                }
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Member/Delete/5
        //public ActionResult Delete(int id)
        //{
        //    return View();
        //}

        // POST: Member/Delete/5
        //[HttpPost]
        public JsonResult Delete(int id)
        {
         
                var data = db.Members.Where(x => x.Id == id).FirstOrDefault();
                db.Members.Remove(data);
                db.SaveChanges();
                // TODO: Add delete logic here
                return Json(data, JsonRequestBehavior.AllowGet);
                //return RedirectToAction("Index");
            
         
        }
    }
}
