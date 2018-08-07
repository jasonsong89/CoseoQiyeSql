<%@ Page Language="C#" AutoEventWireup="true" Inherits="Coseo.Web.Plugin.Feedback.feedback" ValidateRequest="false" %>
<%@ Import namespace="System.Collections.Generic" %>
<%@ Import namespace="System.Text" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="Coseo.Common" %>

<script runat="server">
override protected void OnInit(EventArgs e)
{

	/* 
		This page was created by Coseo Template Engine at 2015-08-17 19:32:14.
		本页面代码由Coseo模板引擎生成于 2015-08-17 19:32:14. 
	*/

	base.OnInit(e);
	StringBuilder templateBuilder = new StringBuilder(220000);
	templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<title>客户反馈-");
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
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery.form.min.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/Validform_v5.3.2_min.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/lhgdialog/lhgdialog.js?skin=idialog\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/base.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\">\r\n        $(function () {\r\n            //初始化发表评论表单\r\n            AjaxInitForm('feedback_form', 'btnSubmit', 1);\r\n        });\r\n    </");
	templateBuilder.Append("script>\r\n    <!--[if IE 7]> \r\n	    <link href=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/css/IE7.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\" />\r\n    <![endif]-->\r\n    \r\n    <!--[if IE 6]>\r\n    	<script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/DD_belatedPNG.js\"></");
	templateBuilder.Append("script>\r\n        <script>\r\n          /* EXAMPLE */\r\n          DD_belatedPNG.fix('*');\r\n        </");
	templateBuilder.Append("script>\r\n	<![endif]-->    \r\n    <script type=\"text/javascript\">\r\n        var ind = 5;\r\n    </");
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body>\r\n    ");

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


	templateBuilder.Append("\r\n    <div class=\"container\">        \r\n        <div class=\"banner img_1\"></div>\r\n        <!-- main -->        \r\n        <div id=\"main\">\r\n            <div class=\"left\">\r\n                <div id=\"sitemap\">            \r\n                    <i class=\"iconfont icon-home\"></i>\r\n                    <a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">首页</a>\r\n                    <i class=\"iconfont icon-arrow\"></i>\r\n                    富乔鑫科技\r\n                    <i class=\"iconfont icon-arrow\"></i>\r\n                    客户反馈\r\n                </div>\r\n                <div id=\"content-list\">\r\n                    <form id=\"feedback_form\" name=\"feedback_form\" url=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("plugins/feedback/ajax.ashx?action=add\">\r\n                     <div class=\"form_box\">\r\n                       <dl>\r\n                         <dt>用户昵称：</dt>\r\n                         <dd><input id=\"txtUserName\" name=\"txtUserName\" type=\"text\" class=\"input txt\" datatype=\"*\" sucmsg=\" \" /></dd>\r\n                       </dl>\r\n                       <dl>\r\n                         <dt>联系电话：</dt>\r\n                         <dd><input id=\"txtUserTel\" name=\"txtUserTel\" type=\"text\" class=\"input txt\" datatype=\"*0-20\" sucmsg=\" \" /></dd>\r\n                       </dl>\r\n                       <dl>\r\n                         <dt>在线QQ：</dt>\r\n                         <dd><input id=\"txtUserQQ\" name=\"txtUserQQ\" type=\"text\" class=\"input txt\" datatype=\"*0-20\" sucmsg=\" \" /></dd>\r\n                       </dl>\r\n                       <dl>\r\n                         <dt>电子邮箱：</dt>\r\n                         <dd><input id=\"txtUserEmail\" name=\"txtUserEmail\" type=\"text\" class=\"input txt\" /></dd>\r\n                       </dl>\r\n                       <dl>\r\n                         <dt>留言标题：</dt>\r\n                         <dd><input id=\"txtTitle\" name=\"txtTitle\" type=\"text\" class=\"input txt\" datatype=\"*2-100\" sucmsg=\" \" /></dd>\r\n                       </dl>\r\n                       <dl>\r\n                         <dt>留言内容：</dt>\r\n                         <dd><textarea id=\"txtContent\" name=\"txtContent\" class=\"input txt\" datatype=\"*\" sucmsg=\" \" style=\"width:350px;height:80px;\"></textarea></dd>\r\n                       </dl>\r\n                       <dl>\r\n                         <dt>验证码：</dt>\r\n                         <dd>\r\n                           <input id=\"txtCode\" name=\"txtCode\" type=\"text\" class=\"input small\" datatype=\"*\" sucmsg=\" \" />\r\n                           <a href=\"javascript:;\" onclick=\"ToggleCode(this, '");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/verify_code.ashx');return false;\"><img src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/verify_code.ashx\" width=\"80\" height=\"22\" align=\"absmiddle\" /> 看不清楚？</a>\r\n                           <span class=\"Validform_checktip\"></span>\r\n                         </dd>\r\n                       </dl>\r\n                       <dl>\r\n                         <dt></dt>\r\n                         <dd>\r\n                           <input name=\"btnSubmit\" type=\"submit\" value=\"发表留言\" class=\"btn_submit\" />\r\n                         </dd>\r\n                       </dl>\r\n                     </div>\r\n                     <div class=\"clear\"></div>\r\n                     </form>\r\n                </div>\r\n            </div>\r\n            <div class=\"right\">\r\n                ");

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
