using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto.Clases
{
    public class Utilidades
    {
        public static void ClearTextBoxes(Control p1)
        {
            foreach (Control ctrl in p1.Controls)
            {
                if (ctrl is TextBox)
                {
                    TextBox t = ctrl as TextBox;

                    if (t != null)
                    {
                        t.Text = String.Empty;
                    }
                }
                else if (ctrl is DropDownList c)
                {
                    c.SelectedIndex = 0;
                }
                else
                {
                    if (ctrl.Controls.Count > 0)
                    {
                        ClearTextBoxes(ctrl);
                    }
                }
            }
        }

        public static void CreateMessageByScript(ClientScriptManager ClientScript, Type type, string message)
        {
            string script = $"<script type='text/javascript'> alert('{message}'); </script>";
            ClientScript.RegisterStartupScript(type, Guid.NewGuid().ToString(), script);
        }
        public static void CreateMessageandRedirect(ClientScriptManager ClientScript, Type type, string message, string url)
        {
            string script = $"<script type='text/javascript'> alert('{message}'); window.location.href = '{url}'</script>";
            ClientScript.RegisterStartupScript(type, Guid.NewGuid().ToString(), script);
        }
    }
}