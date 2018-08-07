<%@ Page Language="C#" AutoEventWireup="true" Inherits="Coseo.Web.UI.Page.article_show" ValidateRequest="false" %>
<%@ Import namespace="System.Collections.Generic" %>
<%@ Import namespace="System.Text" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="Coseo.Common" %>

<script runat="server">
override protected void OnInit(EventArgs e)
{

	/* 
		This page was created by Coseo Template Engine at 2015-08-17 19:32:19.
		本页面代码由Coseo模板引擎生成于 2015-08-17 19:32:19. 
	*/

	base.OnInit(e);
	StringBuilder templateBuilder = new StringBuilder(220000);
	templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n    ");
	string category_title = get_category_title(model.category_id,"品牌形象");

	templateBuilder.Append("\r\n    <title>");
	templateBuilder.Append(Utils.ObjectToStr(model.title));
	templateBuilder.Append(" - ");
	templateBuilder.Append(Utils.ObjectToStr(category_title));
	templateBuilder.Append(" - ");
	templateBuilder.Append(Utils.ObjectToStr(config.webname));
	templateBuilder.Append("</title>\r\n    <meta content=\"");
	templateBuilder.Append(Utils.ObjectToStr(model.seo_keywords));
	templateBuilder.Append("\" name=\"keywords\" />\r\n    <meta content=\"");
	templateBuilder.Append(Utils.ObjectToStr(model.seo_description));
	templateBuilder.Append("\" name=\"description\" />\r\n    <link href=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/css/style.css\" rel=\"stylesheet\" type=\"text/css\"/>    \r\n    <script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery-1.10.2.min.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/global.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/jquery.SuperSlide.2.1.1.js\"></");
	templateBuilder.Append("script>\r\n    <!--[if IE 7]> \r\n	    <link href=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/css/IE7.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\" />\r\n    <![endif]-->\r\n    \r\n    <!--[if IE 6]>\r\n    	<script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/DD_belatedPNG.js\"></");
	templateBuilder.Append("script>\r\n        <script>\r\n          /* EXAMPLE */\r\n          DD_belatedPNG.fix('*');\r\n        </");
	templateBuilder.Append("script>\r\n	<![endif]-->    \r\n\r\n</head>\r\n\r\n<body style=\"padding-top:20px;\">            \r\n    <div id=\"goods_show\">\r\n        <div class=\"tag\">\r\n            <i class=\"list\">&nbsp;</i>");
	templateBuilder.Append(Utils.ObjectToStr(category_title));
	templateBuilder.Append("\r\n            <i class=\"time\">&nbsp;</i>");
	templateBuilder.Append(Utils.ObjectToStr(model.add_time));
	templateBuilder.Append("\r\n            <i class=\"view\">&nbsp;</i><script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=view_article_click&id=");
	templateBuilder.Append(Utils.ObjectToStr(model.id));
	templateBuilder.Append("&click=1\"></");
	templateBuilder.Append("script>\r\n        </div>\r\n        <div class=\"content\">\r\n            ");
	if (model.albums!=null)
	{

	foreach(Coseo.Model.article_albums modelt in model.albums)
	{

	templateBuilder.Append("\r\n            <div class=\"box\"><img src=\"");
	templateBuilder.Append(Utils.ObjectToStr(modelt.original_path));
	templateBuilder.Append("\" alt=\"\"/></div>\r\n            ");
	}	//end for if

	}	//end for if

	templateBuilder.Append("\r\n            ");
	templateBuilder.Append(Utils.ObjectToStr(model.content));
	templateBuilder.Append("\r\n        </div>\r\n        <div class=\"cutline\"></div>\r\n        <div class=\"prevnext\">\r\n            <span class=\"blue\">上一条：</span>");
	templateBuilder.Append(get_prevandnext_article("photo_show", -1, "没有啦！", 0).ToString());

	templateBuilder.Append("<br />\r\n            <span class=\"blue\">下一条：</span>");
	templateBuilder.Append(get_prevandnext_article("photo_show", 1, "没有啦！", 0).ToString());

	templateBuilder.Append("\r\n        </div> \r\n        <div class=\"share\">\r\n            ");

	templateBuilder.Append("        <!-- JiaThis Button BEGIN --> \r\n        <div id=\"ckepop\">\r\n            <span class=\"jiathis_txt\">分享到：</span>\r\n            <a class=\"jiathis_button_qzone\"></a>\r\n            <a class=\"jiathis_button_tqq\"></a>\r\n            <a class=\"jiathis_button_tsina\"></a>\r\n            <a class=\"jiathis_button_renren\"></a>\r\n            <a class=\"jiathis_button_douban\"></a>\r\n            <a class=\"jiathis_button_taobao\"></a>\r\n            <a class=\"jiathis_button_ujian\"></a>\r\n            <a class=\"jiathis_button_fav\"></a> \r\n            <a class=\"jiathis_button_copy\">复制</a> \r\n            <a href=\"http://www.jiathis.com/share/?uid=90225\" class=\"jiathis jiathis_txt jiathis_separator jtico jtico_jiathis\" target=\"_blank\">更多</a> \r\n            <a class=\"jiathis_counter_style\"></a> \r\n        </div> \r\n        <!-- JiaThis Button END -->\r\n        <script type=\"text/javascript\">var jiathis_config={data_track_clickback:true};</");
	templateBuilder.Append("script> \r\n        <script type=\"text/javascript\" src=\"http://v2.jiathis.com/code/jia.js?uid=1336353133859589\" charset=\"utf-8\"></");
	templateBuilder.Append("script>");


	templateBuilder.Append("\r\n        </div>\r\n    </div>\r\n</body>\r\n</html>\r\n");
	Response.Write(templateBuilder.ToString());
}
</script>
