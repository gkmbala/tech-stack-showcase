using System;
using System.Collections.Generic;
using System.Web.UI;

namespace MyApp {
    public partial class Dashboard : Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) BindData();
        }

        protected void btnRefresh_Click(object sender, EventArgs e) {
            BindData();
        }

        private void BindData() {
            var data = new List<SalesRecord> {
                new SalesRecord { Month = "Jan", Revenue = 12400, Units = 310 },
                new SalesRecord { Month = "Feb", Revenue = 15800, Units = 395 },
                new SalesRecord { Month = "Mar", Revenue = 18200, Units = 455 },
            };
            gvSales.DataSource = data;
            gvSales.DataBind();
        }
    }

    public class SalesRecord {
        public string Month { get; set; }
        public decimal Revenue { get; set; }
        public int Units { get; set; }
    }
}
