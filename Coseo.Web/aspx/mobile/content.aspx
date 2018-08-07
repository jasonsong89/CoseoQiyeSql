<%@ Page Language="C#" AutoEventWireup="true" Inherits="Coseo.Web.UI.Page.article_show" ValidateRequest="false" %>
<%@ Import namespace="System.Collections.Generic" %>
<%@ Import namespace="System.Text" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="Coseo.Common" %>

<script runat="server">
override protected void OnInit(EventArgs e)
{

	/* 
		This page was created by Coseo Template Engine at 2015-08-17 19:26:01.
		本页面代码由Coseo模板引擎生成于 2015-08-17 19:26:01. 
	*/

	base.OnInit(e);
	StringBuilder templateBuilder = new StringBuilder(220000);
	templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<title>");
	templateBuilder.Append(Utils.ObjectToStr(model.title));
	templateBuilder.Append("-");
	templateBuilder.Append(Utils.ObjectToStr(config.webname));
	templateBuilder.Append("</title>\r\n    <meta content=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webkeyword));
	templateBuilder.Append("\" name=\"keywords\" />\r\n    <meta content=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webdescription));
	templateBuilder.Append("\" name=\"description\" />\r\n    <link href=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/css/style.css\" rel=\"stylesheet\" type=\"text/css\"/>    \r\n    <script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery-1.10.2.min.js\"></");
	templateBuilder.Append("script>    \r\n    <script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/global.js\"></");
	templateBuilder.Append("script>    \r\n    <script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/jquery.SuperSlide.2.1.1.js\"></");
	templateBuilder.Append("script>\r\n\r\n    <!--[if IE 7]> \r\n	    <link href=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/css/IE7.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\" />\r\n    <![endif]-->\r\n    \r\n    <!--[if IE 6]>\r\n    	<script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/DD_belatedPNG.js\"></");
	templateBuilder.Append("script>\r\n        <script>\r\n          /* EXAMPLE */\r\n          DD_belatedPNG.fix('*');\r\n        </");
	templateBuilder.Append("script>\r\n	<![endif]-->    \r\n    <script type=\"text/javascript\">\r\n        $(function () {\r\n            $(\"#content");
	templateBuilder.Append(Utils.ObjectToStr(model.id));
	templateBuilder.Append("\").addClass(\"cur\");\r\n        });\r\n    </");
	templateBuilder.Append("script>    \r\n</head>\r\n\r\n<body>\r\n    ");

	templateBuilder.Append("<script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/base.js\"></");
	templateBuilder.Append("script>\r\n<div id=\"header\">    \r\n    <div class=\"header\">\r\n        <a class=\"left\" href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\"></a>\r\n        <div class=\"right\">\r\n            <div class=\"text_box\">\r\n                <div id=\"search\">\r\n                    <input id=\"keywords\" name=\"keywords\" class=\"keywords\" type=\"text\" x-webkit-speech=\"\" placeholder=\"输入回车搜索\" onkeydown=\"if(event.keyCode==13){SiteSearch('");
	templateBuilder.Append(linkurl("search"));

	templateBuilder.Append("', '#keywords');return false};\" />\r\n                    <input class=\"submit\" type=\"submit\" value=\"\" onclick=\"SiteSearch('");
	templateBuilder.Append(linkurl("search"));

	templateBuilder.Append("', '#keywords');\" />\r\n                </div>\r\n            </div>\r\n            <div class=\"nav_box\">\r\n                <div class=\"navBar\">\r\n                    <ul class=\"nav clearfix\">\r\n                        <li class=\"m\">\r\n                            <h3><a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">网站首页</a></h3>\r\n                        </li>\r\n                        <li class=\"s\">|</li>\r\n                        <li class=\"m on\">\r\n                            <h3><a href=\"");
	templateBuilder.Append(linkurl("content","about"));

	templateBuilder.Append("\">关于富乔鑫</a></h3>\r\n                            <ul class=\"sub\">\r\n                                ");
	DataTable dl_info = get_article_list("content", 0, 0, "status=0 and is_red=1");

	foreach(DataRow dr in dl_info.Rows)
	{

	if (Utils.ObjectToStr(dr["call_index"])!="contact"&&Utils.ObjectToStr(dr["call_index"])!="video")
	{

	templateBuilder.Append("\r\n                                <li><a href=\"");
	templateBuilder.Append(linkurl("content",Utils.ObjectToStr(dr["call_index"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(dr["title"]) + "</a></li>\r\n                                ");
	}	//end for if

	}	//end for if

	templateBuilder.Append("\r\n                            </ul>\r\n                        </li>\r\n                        <li class=\"s\">|</li>\r\n                        <li class=\"m\">\r\n                            <h3><a href=\"");
	templateBuilder.Append(linkurl("goods"));

	templateBuilder.Append("\">产品中心</a></h3>                            \r\n                        </li>\r\n                        <li class=\"s\">|</li>\r\n                        <li class=\"m\">\r\n                            <h3><a href=\"");
	templateBuilder.Append(linkurl("news"));

	templateBuilder.Append("\">新闻动态</a></h3>\r\n                            <ul class=\"sub\">                                \r\n                                ");
	DataTable category_list2 = get_category_child_list("news", 0);

	int cdr2__loop__id=0;
	foreach(DataRow cdr2 in category_list2.Rows)
	{
		cdr2__loop__id++;


	templateBuilder.Append("\r\n                                <li><a href=\"");
	templateBuilder.Append(linkurl("news",Utils.ObjectToStr(cdr2["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(cdr2["title"]) + "</a></li>\r\n                                ");
	}	//end for if

	templateBuilder.Append("\r\n                            </ul>\r\n                        </li>                    \r\n                        <li class=\"s\">|</li>\r\n                        <li class=\"m\">\r\n                            <h3><a href=\"");
	templateBuilder.Append(linkurl("content","video"));

	templateBuilder.Append("\">视频专区</a></h3>                            \r\n                        </li>\r\n                        <li class=\"s\">|</li>\r\n                        <li class=\"m\">\r\n                            <h3><a href=\"");
	templateBuilder.Append(linkurl("feedback"));

	templateBuilder.Append("\">客户反馈</a></h3>                            \r\n                        </li>\r\n                        <li class=\"s\">|</li>\r\n                        <li class=\"m\">\r\n                            <h3><a href=\"");
	templateBuilder.Append(linkurl("content","contact"));

	templateBuilder.Append("\">联系我们</a></h3>\r\n                        </li> \r\n                        <li class=\"block\" ></li>\r\n                    </ul>\r\n                  </div>\r\n                <div class=\"clear\"></div>\r\n            </div>\r\n        </div>            \r\n    </div>        \r\n</div>\r\n");


	templateBuilder.Append("\r\n    <div class=\"container\">        \r\n        <!-- banner -->\r\n        ");
	if (model.call_index=="about"||model.call_index=="culture"||model.call_index=="marketing")
	{

	templateBuilder.Append("\r\n        <script type=\"text/javascript\">\r\n            var ind = 1;\r\n        </");
	templateBuilder.Append("script>\r\n        <div class=\"banner img_1\"></div>\r\n        ");
	}
	else if (model.call_index=="video")
	{

	templateBuilder.Append("\r\n        <script type=\"text/javascript\">\r\n            var ind = 4;\r\n        </");
	templateBuilder.Append("script>\r\n        <div class=\"banner img_2\"></div>\r\n        ");
	}
	else if (model.call_index=="contact")
	{

	templateBuilder.Append("\r\n        <script type=\"text/javascript\">\r\n            var ind = 6;\r\n        </");
	templateBuilder.Append("script>\r\n        <div class=\"banner img_3\"></div>\r\n        ");
	}	//end for if

	templateBuilder.Append("        \r\n        <!-- main -->        \r\n        <div id=\"main\">\r\n            <div class=\"left\">\r\n                <div id=\"sitemap\">            \r\n                    <i class=\"iconfont icon-home\"></i>\r\n                    <a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">首页</a>\r\n                    <i class=\"iconfont icon-arrow\"></i>\r\n                    富乔鑫科技\r\n                    <i class=\"iconfont icon-arrow\"></i>\r\n                    ");
	templateBuilder.Append(Utils.ObjectToStr(model.title));
	templateBuilder.Append("\r\n                </div>\r\n                <div id=\"content-list\">\r\n                    ");
	templateBuilder.Append(Utils.ObjectToStr(model.content));
	templateBuilder.Append("\r\n                </div>\r\n            </div>\r\n            <div class=\"right\">\r\n                ");

	templateBuilder.Append("<div class=\"aside-headline ipage\">\r\n                    <h2><p class=\"en\">v-Future</p><i>&nbsp;</i><p class=\"cn\">富乔鑫科技</p></h2>\r\n                </div>\r\n                <ul id=\"menu\">\r\n                    ");
	DataTable content_list = get_article_list("content", 0, 0, "status=0 and is_red=1");

	foreach(DataRow dr in content_list.Rows)
	{

	templateBuilder.Append("\r\n                    <li>\r\n                        <a href=\"");
	templateBuilder.Append(linkurl("content",Utils.ObjectToStr(dr["call_index"])));

	templateBuilder.Append("\" id=\"content" + Utils.ObjectToStr(dr["id"]) + "\">" + Utils.ObjectToStr(dr["title"]) + "</a>\r\n                    </li>\r\n                    ");
	}	//end for if

	templateBuilder.Append("                    \r\n                </ul>\r\n                <div class=\"aside-service\">\r\n                    <h3>hotline</h3>\r\n                    <p>");
	templateBuilder.Append(Utils.ObjectToStr(config.webtel));
	templateBuilder.Append("</p>\r\n                </div>");


	templateBuilder.Append("\r\n            </div>\r\n            <div class=\"clear\"></div>\r\n        </div>\r\n        ");

	templateBuilder.Append("<div id=\"footer\">\r\n    <div class=\"footer\">\r\n        <div class=\"copyright\">");
	templateBuilder.Append(Utils.ObjectToStr(config.webcopyright));
	templateBuilder.Append("</div>\r\n       \r\n    </div>\r\n</div>\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/jquery.imgScroll.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/jquery.touchSlider.js\"></");
	templateBuilder.Append("script>");


	templateBuilder.Append("\r\n    </div>    \r\n</body>\r\n</html>\r\n");
	Response.Write(templateBuilder.ToString());
}
</script>
