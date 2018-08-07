<%@ Page Language="C#" AutoEventWireup="true" Inherits="Coseo.Web.UI.Page.index" ValidateRequest="false" %>
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
	templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n    <title>");
	templateBuilder.Append(Utils.ObjectToStr(config.webtitle));
	templateBuilder.Append("</title>\r\n    <meta content=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webkeyword));
	templateBuilder.Append("\" name=\"keywords\" />\r\n    <meta content=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webdescription));
	templateBuilder.Append("\" name=\"description\" />\r\n    <link href=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/css/style.css\" rel=\"stylesheet\" type=\"text/css\"/>\r\n    <link href=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/css/focus.css\" rel=\"stylesheet\" type=\"text/css\"/>\r\n    <script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/browser_redirect.ashx\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery-1.10.2.min.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/global.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/jquery.SuperSlide.2.1.1.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/popwin.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\">\r\n        var ind = 0;\r\n	</");
	templateBuilder.Append("script>\r\n    <!--[if IE 7]> \r\n	    <link href=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/css/IE7.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\" />\r\n    <![endif]-->\r\n    \r\n    <!--[if IE 6]>\r\n    	<script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/DD_belatedPNG.js\"></");
	templateBuilder.Append("script>\r\n        <script>\r\n          /* EXAMPLE */\r\n          DD_belatedPNG.fix('*');\r\n        </");
	templateBuilder.Append("script>\r\n	<![endif]-->    \r\n</head>\r\n\r\n<body>\r\n    ");

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


	templateBuilder.Append("\r\n    <div id=\"container\">        \r\n        <!-- focus -->\r\n        <div class=\"focus\">\r\n            <div class=\"flicking_btn\">\r\n                <div class=\"flicking_inner\">\r\n                    <a href=\"#\">1</a>\r\n                    <a href=\"#\">2</a>\r\n                    <a href=\"#\">3</a>\r\n               	 </div>\r\n            </div>\r\n			<div class=\"focus_item\">\r\n				<ul>					\r\n					<li><span class=\"img_01\"></span></li>\r\n					<li><span class=\"img_02\"></span></li>\r\n					<li><span class=\"img_03\"></span></li>					\r\n				</ul>\r\n				<a href=\"javascript:;\" id=\"btn_prev\"></a>\r\n				<a href=\"javascript:;\" id=\"btn_next\"></a>\r\n			</div>\r\n		</div>       \r\n        <!-- main -->\r\n        <div id=\"grids\">\r\n            <ul>\r\n                <li>\r\n                    <div class=\"pic\"></div>\r\n                    <h2>关于富乔鑫</h2>\r\n                    <p>\r\n                        ");
	templateBuilder.Append(get_article_field("about","call_home").ToString());

	templateBuilder.Append("\r\n                    </p>\r\n                    <a class=\"more\" href=\"");
	templateBuilder.Append(linkurl("content","about"));

	templateBuilder.Append("\"></a>\r\n                </li>\r\n                <li>\r\n                    <div class=\"pic col2\"></div>\r\n                    <h2>企业文化</h2>\r\n                    <p>\r\n                        ");
	templateBuilder.Append(get_article_field("culture","call_home").ToString());

	templateBuilder.Append("\r\n                    </p>\r\n                    <a class=\"more\" href=\"");
	templateBuilder.Append(linkurl("content","culture"));

	templateBuilder.Append("\"></a>\r\n                </li>\r\n                <li>\r\n                    <div class=\"pic col3\"></div>\r\n                    <h2>联系我们</h2>\r\n                    <p>\r\n                        ");
	templateBuilder.Append(get_article_field("contact","call_home").ToString());

	templateBuilder.Append("\r\n                    </p>\r\n                    <a class=\"more\" href=\"");
	templateBuilder.Append(linkurl("content","contact"));

	templateBuilder.Append("\"></a>\r\n                </li>\r\n            </ul>\r\n        </div>\r\n        <div class=\"wrapper bg_gray\">\r\n            <div id=\"news_wrap\">\r\n                <div id=\"news\">\r\n                    <div class=\"left\">\r\n                        <h2>news</h2>\r\n                        <h3>最新资讯</h3>\r\n                        <a href=\"");
	templateBuilder.Append(linkurl("news"));

	templateBuilder.Append("\" class=\"more\">查看详情</a>\r\n                    </div>\r\n                    <div class=\"right\">\r\n                        ");
	DataTable top_news = get_article_list("news", 0, 1, "status=0 and is_top=1");

	foreach(DataRow dr in top_news.Rows)
	{

	templateBuilder.Append("\r\n                        <div class=\"is_top\">\r\n                            <div class=\"pic\">\r\n                                <img src=\"" + Utils.ObjectToStr(dr["img_url"]) + "\" alt=\"" + Utils.ObjectToStr(dr["title"]) + "\" />\r\n                            </div>\r\n                            <div class=\"box\">\r\n                                <h2>\r\n                                    <a href=\"javascript:void(0)\" name=\"");
	templateBuilder.Append(linkurl("news_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\" title=\"" + Utils.ObjectToStr(dr["title"]) + "\">\r\n                                        ");
	templateBuilder.Append(Utils.DropHTML(Utils.ObjectToStr(dr["title"]),40));

	templateBuilder.Append("\r\n                                    </a>\r\n                                </h2>\r\n                                <p>");
	templateBuilder.Append(Utils.DropHTML(Utils.ObjectToStr(dr["zhaiyao"]),100));

	templateBuilder.Append("</p>\r\n                            </div>\r\n                            <div class=\"clear\"></div>\r\n                        </div>\r\n                        ");
	}	//end for if

	templateBuilder.Append("\r\n                        <div class=\"is_red\">\r\n                            <ul>\r\n                                ");
	DataTable red_news = get_article_list("news", 0, 3, "status=0 and is_red=1");

	foreach(DataRow dr in red_news.Rows)
	{

	templateBuilder.Append("\r\n                                <li>\r\n                                    <a href=\"javascript:void(0)\" name=\"");
	templateBuilder.Append(linkurl("news_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\" title=\"" + Utils.ObjectToStr(dr["title"]) + "\">\r\n                                        ");
	templateBuilder.Append(Utils.DropHTML(Utils.ObjectToStr(dr["title"]),50));

	templateBuilder.Append("\r\n                                    </a>\r\n                                    <span>");	templateBuilder.Append(Utils.ObjectToDateTime(Utils.ObjectToStr(dr["add_time"])).ToString("yyyy-MM-dd"));

	templateBuilder.Append("</span>\r\n                                </li>\r\n                                ");
	}	//end for if

	templateBuilder.Append("\r\n                            </ul>\r\n                        </div>\r\n                    </div>\r\n                    <div class=\"clear\"></div>\r\n                </div>\r\n                <div id=\"btnlk\">\r\n                    <ul>\r\n                        <li>\r\n                            <div class=\"pic\"></div>\r\n                            <a href=\"");
	templateBuilder.Append(linkurl("content","advantage"));

	templateBuilder.Append("\" class=\"box\">\r\n                                <h2>视频专区</h2>\r\n                                <p>");
	templateBuilder.Append(get_article_field("video","call_home").ToString());

	templateBuilder.Append("</p>\r\n                            </a>\r\n                            <div class=\"clear\"></div>\r\n                        </li>\r\n                        <li>\r\n                            <div class=\"pic col_2\"></div>\r\n                            <a href=\"");
	templateBuilder.Append(linkurl("content","marketing"));

	templateBuilder.Append("\" class=\"box\">\r\n                                <h2>营销网络</h2>\r\n                                <p>");
	templateBuilder.Append(get_article_field("marketing","call_home").ToString());

	templateBuilder.Append("</p>\r\n                            </a>\r\n                            <div class=\"clear\"></div>\r\n                        </li>\r\n                    </ul>\r\n                </div>\r\n                <div class=\"clear\"></div>\r\n            </div>\r\n        </div>\r\n        <div class=\"wrapper\">\r\n            <div class=\"headlines\">\r\n                <h2>products</h2>\r\n                <p>产品推介</p>\r\n            </div>            \r\n            <div id=\"goods\">\r\n                <div id=\"wrapBox1\" class=\"wrapBox\">\r\n                    <ul id=\"count1\" class=\"count clearfix\">\r\n                        ");
	DataTable red_goods = get_article_list("goods", 0, 12, "status=0 and is_red=1");

	foreach(DataRow dr in red_goods.Rows)
	{

	templateBuilder.Append("\r\n                        <li>\r\n                            <a href=\"javascript:void(0)\" name=\"");
	templateBuilder.Append(linkurl("goods_show",Utils.ObjectToStr(dr["id"])));

	templateBuilder.Append("\" title=\"" + Utils.ObjectToStr(dr["title"]) + "\" class=\"img_wrap\">\r\n                                <img src=\"" + Utils.ObjectToStr(dr["img_url"]) + "\" alt=\"" + Utils.ObjectToStr(dr["title"]) + "\" />\r\n                                <p class=\"cover caption\">" + Utils.ObjectToStr(dr["title"]) + "</p>\r\n                            </a>\r\n                        </li>\r\n                        ");
	}	//end for if

	templateBuilder.Append("\r\n                    </ul>\r\n                </div>\r\n                <a id=\"right1\" class=\"prev arrows\"></a>\r\n                <a id=\"left1\" class=\"next arrows\"></a>\r\n            </div>\r\n            <a id=\"goods_more\" href=\"");
	templateBuilder.Append(linkurl("goods"));

	templateBuilder.Append("\">查看更多</a>\r\n        </div>\r\n        ");

	templateBuilder.Append("<div id=\"footer\">\r\n    <div class=\"footer\">\r\n        <div class=\"copyright\">");
	templateBuilder.Append(Utils.ObjectToStr(config.webcopyright));
	templateBuilder.Append("</div>\r\n       \r\n    </div>\r\n</div>\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/jquery.imgScroll.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/main");
	templateBuilder.Append("/js/jquery.touchSlider.js\"></");
	templateBuilder.Append("script>");


	templateBuilder.Append("\r\n    </div>\r\n</body>\r\n</html>\r\n");
	Response.Write(templateBuilder.ToString());
}
</script>
